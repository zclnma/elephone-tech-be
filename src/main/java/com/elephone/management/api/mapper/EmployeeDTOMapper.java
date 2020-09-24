package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import com.elephone.management.domain.WorkHistory;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;
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
        if(employee.getWorkingStore() != null) {
            employeeDTO.setWorkingStoreId(employee.getWorkingStore().getId());
        }

        if (employee.getStores() != null) {
            employeeDTO.setStoreId(
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

        Employee employee = new Employee();

        employee.setId(employeeDTO.getId());
        employee.setFirstName(employeeDTO.getFirstName());
        employee.setLastName(employeeDTO.getLastName());
        employee.setGender(employeeDTO.getGender());
        employee.setBirthday(employeeDTO.getBirthday());
        employee.setContact(employeeDTO.getContact());
        employee.setEmail(employeeDTO.getEmail());
        employee.setTfn(employeeDTO.getTfn());
        if(employeeDTO.getWorkingStoreId() != null) {
            employee.setWorkingStore(Store.builder().id(employeeDTO.getWorkingStoreId()).build());
        }
        Set<Store> stores = employeeDTO
                .getStoreId()
                .stream()
                .map(storeId -> Store.builder().id(storeId).build())
                .collect(Collectors.toSet());

        employee.setStores(new HashSet<>(stores));

        return employee;
    }
}
