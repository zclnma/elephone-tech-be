package com.elephone.management.service;

import com.elephone.management.api.dto.CreateEmployeeDTO;
import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.api.mapper.EmployeeMapper;
import com.elephone.management.dispose.exception.EmployeeException;
import com.elephone.management.dispose.exception.NotFoundException;
import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.EnumRole;
import com.elephone.management.domain.Store;
import com.elephone.management.repository.EmployeeRepository;
import com.elephone.management.repository.StoreRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import software.amazon.awssdk.services.cognitoidentityprovider.model.AttributeType;
import software.amazon.awssdk.services.cognitoidentityprovider.model.UserType;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class EmployeeService {

    private EmployeeMapper employeeMapper;
    private EmployeeRepository employeeRepository;
    private StoreService storeService;
    private CognitoService cognitoService;

    @Autowired
    public EmployeeService(EmployeeMapper employeeMapper, EmployeeRepository employeeRepository, StoreService storeService, CognitoService cognitoService) {
        this.employeeMapper = employeeMapper;
        this.employeeRepository = employeeRepository;
        this.storeService = storeService;
        this.cognitoService = cognitoService;
    }

    public Page<Employee> listEmployees(int page, int pageSize, String storeId) {
        if (StringUtils.isEmpty(storeId)) {
            return employeeRepository.findAllByIsDeleted(PageRequest.of(page, pageSize), false);
        }
        UUID uuid = UUID.fromString(storeId);
        Store store = storeService.getStoreById(uuid);
        if (store == null) {
            throw new StoreException("Can't find store with id: " + storeId);
        }
        return employeeRepository.findAllByStoresAndIsDeleted(PageRequest.of(page, pageSize), store, false);
    }

    public Employee getEmployeeByUniqueId(String type, UUID id) {

        if (StringUtils.equals(type, "cognito")) {
            return employeeRepository.findByCognitoId(id).orElseThrow(() -> new NotFoundException("Employee Not Found."));
        }
        return employeeRepository.findById(id).orElseThrow(() -> new NotFoundException("Employee Not Found."));
    }

    public Employee getEmployeeById(UUID id) {
        if (id == null) {
            throw new EmployeeException("Employee Id is required.");
        }
        return employeeRepository.findById(id).orElseThrow(() -> new NotFoundException("Employee Not Found."));
    }

    public Employee createEmployee(CreateEmployeeDTO createEmployeeDTO) {
        if (createEmployeeDTO.getId() != null) {
            throw new EmployeeException("Do not set Employee Id when creating employee.");
        }
        try {
            UserType cognitoUser = cognitoService.createUser(createEmployeeDTO.getUsername(), createEmployeeDTO.getPassword(), EnumRole.fromKey(createEmployeeDTO.getRole()).toString());
            AttributeType attributeType = cognitoUser.attributes().stream()
                    .filter(attribute -> StringUtils.equals(attribute.name(), "sub"))
                    .findAny().orElseThrow(() -> new RuntimeException("Cognito error"));
            UUID cognitoID;
            cognitoID = UUID.fromString(attributeType.value());
            Employee employee = employeeMapper.fromCreateDTO(createEmployeeDTO);
            employee.setCognitoId(cognitoID);
            return employeeRepository.save(employee);
        } catch (Exception ex) {
            throw new RuntimeException(ex.getMessage());
        }

    }

    public List<Employee> createEmployeeBatch(List<Employee> employees) {
        return employeeRepository.saveAll(employees);
    }

    @Transactional
    public Employee updateEmployee(CreateEmployeeDTO createEmployeeDTO) {
        if (createEmployeeDTO.getId() == null) {
            throw new EmployeeException("Employee Id is required.");
        }

        Employee employee = employeeRepository.findById(createEmployeeDTO.getId())
                .orElseThrow(() -> new NotFoundException("Exployee not found."));

        try {
            if (createEmployeeDTO.getPassword() != null) {
                cognitoService.setPassword(createEmployeeDTO.getUsername(), createEmployeeDTO.getPassword());
            }

            if (StringUtils.equals(employee.getRole().toString(), createEmployeeDTO.getRole())) {
                cognitoService.removeUserFromGroup(createEmployeeDTO.getUsername(), employee.getRole().toString());
                cognitoService.addUserToGroup(createEmployeeDTO.getUsername(), createEmployeeDTO.getRole());
                employee.setRole(EnumRole.fromKey(createEmployeeDTO.getRole()));
            }

            List<Store> stores = createEmployeeDTO
                    .getStoreIds()
                    .stream()
                    .map(storeService::getStoreById)
                    .collect(Collectors.toList());

            employee.setStores(stores);
            Employee employeeToReturn = employeeRepository.saveAndFlush(employee);

            stores.forEach(store -> {
                if (!store.getEmployees().remove(employee)) {
                    store.getEmployees().add(employee);
                }
            });
            storeService.updateAllStore(stores);

            return employeeToReturn;

        } catch (Exception ex) {
            throw new EmployeeException(ex.getMessage());
        }

    }

    @Transactional
    public Employee activateEmployeeById(UUID id) {
        if (id == null) {
            throw new EmployeeException("Employee Id is required.");
        }
        Employee employee = getEmployeeById(id);
        cognitoService.enableUser(employee.getUsername());
        employee.setIsActive(true);
        return employeeRepository.save(employee);
    }

    @Transactional
    public Employee deActivateEmployeeById(UUID id) {
        if (id == null) {
            throw new EmployeeException("Employee Id is required.");
        }
        Employee employee = getEmployeeById(id);
        cognitoService.disableUser(employee.getUsername());
        employee.setIsActive(false);
        return employeeRepository.save(employee);
    }

    @Transactional
    public void deleteEmployeeById(UUID id) {
        if (id == null) {
            throw new EmployeeException("Employee Id is required.");
        }

        Employee employee = getEmployeeById(id);
        cognitoService.deleteUser(employee.getUsername());
        employee.setCognitoId(null);
        employee.setIsDeleted(true);
        employeeRepository.save(employee);
    }

}
