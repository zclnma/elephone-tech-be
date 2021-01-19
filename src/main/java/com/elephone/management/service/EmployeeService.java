package com.elephone.management.service;

import com.elephone.management.api.dto.CreateEmployeeDTO;
import com.elephone.management.api.mapper.EmployeeMapper;
import com.elephone.management.dispose.exception.EmployeeException;
import com.elephone.management.dispose.exception.NotFoundException;
import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.*;
import com.elephone.management.repository.EmployeeRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import software.amazon.awssdk.services.cognitoidentityprovider.model.AttributeType;
import software.amazon.awssdk.services.cognitoidentityprovider.model.UserType;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class EmployeeService {

    private EmployeeMapper employeeMapper;
    private EmployeeRepository employeeRepository;
    private StoreService storeService;
    private CognitoService cognitoService;
    private AuthService authService;

    @Autowired
    public EmployeeService(EmployeeMapper employeeMapper, EmployeeRepository employeeRepository, StoreService storeService, CognitoService cognitoService, AuthService authService) {
        this.employeeMapper = employeeMapper;
        this.employeeRepository = employeeRepository;
        this.storeService = storeService;
        this.cognitoService = cognitoService;
        this.authService = authService;
    }

    public Page<Employee> listEmployees(int page, int pageSize, String storeId) {
        boolean isOwner = authService.getAuthorities().contains("OWNER");

        if (StringUtils.isEmpty(storeId)) {
            return employeeRepository.findAllByIsDeleted(PageRequest.of(page, pageSize), false);
        }
        UUID uuid = UUID.fromString(storeId);
        Store store = storeService.getStoreById(uuid);
        if (store == null) {
            throw new StoreException("Can't find store with id: " + storeId);
        }
        Page<Employee> employees = employeeRepository.findAllByStoresAndIsDeleted(PageRequest.of(page, pageSize), store, false);
        if (!isOwner) {
            return employees.map(employee -> {
                employee.setBirthday(null);
                employee.setTfn(null);
                employee.setContact(null);
                return employee;
            });
        }
        return employees;
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

        List<GrantedAuthority> grantedAuthorities = new ArrayList<>(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        List<String> authorities = grantedAuthorities.stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList());
        if (!authorities.contains("OWNER") && !authorities.contains("ADMIN")) {
            throw new EmployeeException("You don't have permission to create user.");
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

        boolean isOwner = authService.getAuthorities().contains("OWNER");

        Employee employee = employeeRepository.findById(createEmployeeDTO.getId())
                .orElseThrow(() -> new NotFoundException("Employee not found."));

        try {
            if (isOwner && createEmployeeDTO.getPassword() != null) {
                cognitoService.setPassword(createEmployeeDTO.getUsername(), createEmployeeDTO.getPassword());
            }

            if (isOwner && !StringUtils.equals(employee.getRole().toString(), EnumRole.fromKey(createEmployeeDTO.getRole()).toString())) {
                cognitoService.removeUserFromGroup(createEmployeeDTO.getUsername(), employee.getRole().toString());
                cognitoService.addUserToGroup(createEmployeeDTO.getUsername(), EnumRole.fromKey(createEmployeeDTO.getRole()).toString());
                employee.setRole(EnumRole.fromKey(createEmployeeDTO.getRole()));
            }

            List<Store> stores = createEmployeeDTO
                    .getStoreIds()
                    .stream()
                    .map(storeService::getStoreById)
                    .collect(Collectors.toList());

            employee.setStores(stores);

            if (isOwner) {
                employee.setGender(EnumGender.fromKey(createEmployeeDTO.getGender()));
                employee.setEmail(createEmployeeDTO.getEmail());
                employee.setTfn(createEmployeeDTO.getTfn());
                employee.setContact(createEmployeeDTO.getContact());
            }
            return employeeRepository.saveAndFlush(employee);

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
