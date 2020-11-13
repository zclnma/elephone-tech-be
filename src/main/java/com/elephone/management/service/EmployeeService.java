package com.elephone.management.service;

import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.api.mapper.EmployeeMapper;
import com.elephone.management.dispose.exception.EmployeeException;
import com.elephone.management.dispose.exception.NotFoundException;
import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Employee;
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
    private StoreRepository storeRepository;
    private CognitoService cognitoService;

    @Autowired
    public EmployeeService(EmployeeMapper employeeMapper, EmployeeRepository employeeRepository, StoreRepository storeRepository, CognitoService cognitoService) {
        this.employeeMapper = employeeMapper;
        this.employeeRepository = employeeRepository;
        this.storeRepository = storeRepository;
        this.cognitoService = cognitoService;
    }

    public Page<Employee> listEmployees(int page, int pageSize) {
        return employeeRepository.findAll(PageRequest.of(page, pageSize));
    }

    public Page<Employee> listEmployees(int page, int pageSize, String storeId) {
        if (StringUtils.isEmpty(storeId)) {
            return employeeRepository.findAll(PageRequest.of(page, pageSize));
        }
        UUID uuid = UUID.fromString(storeId);
        Store store = storeRepository.findById(uuid).orElse(null);
        if (store == null) {
            throw new StoreException("Can't find store with id: " + storeId);
        }
        return employeeRepository.findAllByStores(PageRequest.of(page, pageSize), store);
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

    public Employee createEmployee(EmployeeDTO employeeDTO) {
        if (employeeDTO.getId() != null) {
            throw new EmployeeException("Do not set Employee Id when creating employee.");
        }
        try {
            String cognitoUsername = cognitoService.getCognitoUsername(employeeDTO.getFirstName(), employeeDTO.getLastName());

            UserType cognitoUser = cognitoService.createUser(cognitoUsername, employeeDTO.getPassword(), employeeDTO.getRole().toString());
            AttributeType attributeType = cognitoUser.attributes().stream()
                    .filter(attribute -> StringUtils.equals(attribute.name(), "sub"))
                    .findAny().orElseThrow(() -> new RuntimeException("Cognito error"));

            UUID cognitoID;
            cognitoID = UUID.fromString(attributeType.value());
            Employee employee = employeeMapper.fromDTO(employeeDTO);
            employee.setCognitoId(cognitoID);
            return employeeRepository.save(employee);
        } catch (Exception ex) {
            throw new RuntimeException("Something went wrong.");
        }

    }

    public List<Employee> createEmployeeBatch(List<Employee> employees) {
        return employeeRepository.saveAll(employees);
    }

    @Transactional
    public Employee updateEmployee(EmployeeDTO employeedto) {
        if (employeedto.getId() == null) {
            throw new EmployeeException("Employee Id is required.");
        }

        Employee employee = employeeRepository.findById(employeedto.getId())
                .orElseThrow(() -> new NotFoundException("Exployee not found."));

        String username = cognitoService.getCognitoUsername(employeedto.getFirstName(), employeedto.getLastName());

        try {
            if (employeedto.getPassword() != null) {
                cognitoService.setPassword(username, employeedto.getPassword());
            }

            if (employee.getRole() != employeedto.getRole()) {
                cognitoService.removeUserFromGroup(username, employee.getRole().toString());
                cognitoService.addUserToGroup(username, employeedto.getRole().toString());
            }

            Employee newEmployee = employeeMapper.fromDTO(employeedto);
            newEmployee.setCognitoId(employee.getCognitoId());

            if (newEmployee.getStores() == null) {
                return employeeRepository.save(newEmployee);
            }

            List<Store> stores = storeRepository.findAllById(newEmployee.getStores().stream().map(Store::getId).collect(Collectors.toList()));
            Employee savedEmployee = employeeRepository.saveAndFlush(newEmployee);

            stores.forEach(store -> {
                if (!store.getEmployees().remove(newEmployee)) {
                    store.getEmployees().add(newEmployee);
                }
            });
            storeRepository.saveAll(stores);

            return savedEmployee;

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
        cognitoService.enableUser(cognitoService.getCognitoUsername(employee.getFirstName(), employee.getLastName()));
        employee.setActive(true);
        return employeeRepository.save(employee);
    }

    @Transactional
    public Employee deActivateEmployeeById(UUID id) {
        if (id == null) {
            throw new EmployeeException("Employee Id is required.");
        }
        Employee employee = getEmployeeById(id);
        cognitoService.disableUser(cognitoService.getCognitoUsername(employee.getFirstName(), employee.getLastName()));
        employee.setActive(false);
        return employeeRepository.save(employee);
    }

    @Transactional
    public void deleteEmployeeById(UUID id) {
        if (id == null) {
            throw new EmployeeException("Employee Id is required.");
        }

        Employee employee = getEmployeeById(id);
        cognitoService.deleteUser(cognitoService.getCognitoUsername(employee.getFirstName(), employee.getLastName()));
        employee.setCognitoId(null);
        employee.setDeleted(true);
        employeeRepository.save(employee);
    }

}
