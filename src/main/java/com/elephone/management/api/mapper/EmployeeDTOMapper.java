package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import com.elephone.management.domain.WorkHistory;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
public class EmployeeDTOMapper {

    public EmployeeDTO toDTO(Employee employee) {
        if (employee == null) {
            return null;
        }

        return EmployeeDTO.builder()
                .id(employee.getId())
                .firstName(employee.getFirstName())
                .lastName(employee.getLastName())
                .gender(employee.getGender())
                .birthday(employee.getBirthday())
                .contact(employee.getContact())
                .email(employee.getEmail())
                .tfn(employee.getTfn())
                .storeIds(employee.getStores() == null ? null : employee.getStores()
                        .stream()
                        .map(Store::getId)
                        .collect(Collectors.toSet()))
                .build();
    }

    public Employee fromDTO(EmployeeDTO employeeDTO) {
        if (employeeDTO == null) {
            return null;
        }

        Set<Store> stores = employeeDTO
                .getStoreIds()
                .stream()
                .map(storeId -> Store.builder().id(storeId).build())
                .collect(Collectors.toSet());

        Employee employee = Employee.builder()
                .id(employeeDTO.getId())
                .firstName(employeeDTO.getFirstName())
                .lastName(employeeDTO.getLastName())
                .gender(employeeDTO.getGender())
                .birthday(employeeDTO.getBirthday())
                .contact(employeeDTO.getContact())
                .email(employeeDTO.getEmail())
                .tfn(employeeDTO.getTfn())
                .stores(stores)
                .build();

        return employee;
    }
}
