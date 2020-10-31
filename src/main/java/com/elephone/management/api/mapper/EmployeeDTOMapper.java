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

        EmployeeDTO employeeDTO = new EmployeeDTO();

        employeeDTO.setId(employee.getId());
        employeeDTO.setFirstName(employee.getFirstName());
        employeeDTO.setLastName(employee.getLastName());
        employeeDTO.setGender(employee.getGender());
        employeeDTO.setBirthday(employee.getBirthday());
        employeeDTO.setContact(employee.getContact());
        employeeDTO.setEmail(employee.getEmail());
        employeeDTO.setTfn(employee.getTfn());

        if (employee.getStores() != null) {
            employeeDTO.setStoreIds(
                    employee.getStores()
                            .stream()
                            .map(Store::getId)
                            .collect(Collectors.toSet())
            );
        }

        return employeeDTO;
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
