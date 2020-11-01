package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import org.springframework.stereotype.Component;

import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
public class StoreDTOMapper {

    public StoreDTO toDTO(Store store) {
        if (store == null) {
            return null;
        }

        return StoreDTO.builder()
                .id(store.getId())
                .name(store.getName())
                .contact(store.getContact())
                .role(store.getRole())
                .abn(store.getAbn())
                .sequence(store.getSequence())
                .warranty(store.getWarranty())
                .storeLocation(store.getStoreLocation())
                .employeeIds(store.getEmployees().stream().map(Employee::getId).collect(Collectors.toSet()))
                .build();

    }

    public Store fromDTO(StoreDTO storeDTO) {
        if (storeDTO == null) {
            return null;
        }

        Store store = new Store();
        store.setId(storeDTO.getId());
        store.setName(storeDTO.getName());
        store.setRole(storeDTO.getRole());
        store.setContact(storeDTO.getContact());
        store.setAbn(storeDTO.getAbn());
        store.setCognitoId(storeDTO.getCognitoId());
        store.setSequence(storeDTO.getSequence());
        store.setWarranty(storeDTO.getWarranty());
        store.setStoreLocation(storeDTO.getStoreLocation());
        if (storeDTO.getEmployeeIds() != null) {
            Set<Employee> employees = storeDTO
                    .getEmployeeIds()
                    .stream()
                    .map(employeeId -> Employee.builder().id(employeeId).build())
                    .collect(Collectors.toSet());
            store.setEmployees(employees);
        }

        return store;
    }

}
