package com.elephone.management.service;

import com.elephone.management.api.dto.CreateEmployeeDTO;
import com.elephone.management.api.dto.UpdateEmployeeDTO;
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
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class EmployeeService {

    private final EmployeeMapper employeeMapper;
    private final EmployeeRepository employeeRepository;
    private final StoreService storeService;
    private final CognitoService cognitoService;
    private final AuthService authService;

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
                employee.setEmail(null);
                employee.setCreatedDate(null);
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
    public Employee updateEmployee(UpdateEmployeeDTO updateEmployeeDTO) {
        if (updateEmployeeDTO.getId() == null) {
            throw new EmployeeException("Employee Id is required.");
        }

        boolean isAdmin = authService.getAuthorities().contains("ADMIN");

        Employee employee = employeeRepository.findById(updateEmployeeDTO.getId())
                .orElseThrow(() -> new NotFoundException("Employee not found."));


        if (isAdmin && employee.getRole().equals(EnumRole.ADMIN) && !employee.getCognitoId().toString().equals(authService.getCognitoId())) {
            throw new EmployeeException("You can't update the information of another admin user");
        }

        Set<Store> stores = updateEmployeeDTO
                .getStoreIds()
                .stream()
                .map(storeService::getStoreById)
                .collect(Collectors.toSet());

        employee.setStores(stores);

        try {
            if (isAdmin) {
                return employeeRepository.save(employee);
            }


            if (updateEmployeeDTO.getPassword() != null) {
                cognitoService.setPassword(updateEmployeeDTO.getUsername(), updateEmployeeDTO.getPassword());
            }

            if (!StringUtils.equals(employee.getRole().toString(), EnumRole.fromKey(updateEmployeeDTO.getRole()).toString())) {
                cognitoService.removeUserFromGroup(updateEmployeeDTO.getUsername(), employee.getRole().toString());
                cognitoService.addUserToGroup(updateEmployeeDTO.getUsername(), EnumRole.fromKey(updateEmployeeDTO.getRole()).toString());
                employee.setRole(EnumRole.fromKey(updateEmployeeDTO.getRole()));
            }

            employee.setGender(EnumGender.fromKey(updateEmployeeDTO.getGender()));
            employee.setEmail(updateEmployeeDTO.getEmail());
            employee.setTfn(updateEmployeeDTO.getTfn());
            employee.setContact(updateEmployeeDTO.getContact());

            return employeeRepository.save(employee);

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
