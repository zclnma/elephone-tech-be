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

        StoreDTO storeDTO = new StoreDTO();
        storeDTO.setId(store.getId());
        storeDTO.setName(store.getName());
        storeDTO.setContact(store.getContact());
        storeDTO.setRole(store.getRole());
        storeDTO.setAbn(store.getAbn());
        storeDTO.setSequence(store.getSequence());
        storeDTO.setWarranty(store.getWarranty());
        storeDTO.setStoreLocation(store.getStoreLocation());
        Set<UUID> employeeId = store
                .getEmployees()
                .stream()
                .map(Employee::getId)
                .collect(Collectors.toSet());

        storeDTO.setEmployeeIds(employeeId);
        return storeDTO;
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
        if(storeDTO.getEmployeeIds() != null) {
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
