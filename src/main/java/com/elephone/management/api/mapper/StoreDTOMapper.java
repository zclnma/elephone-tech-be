package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.domain.Store;
import org.mapstruct.*;

import java.util.HashSet;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.WARN)
public interface StoreDTOMapper {

    StoreDTO toDTO(Store store);

    Store fromDTO(StoreDTO storeDTO);

//    @AfterMapping
//    default void addEmptySet(StoreDTO storeDTO, @MappingTarget Store store) {
//        store.setEmployees(new HashSet<>());
//        store.setWorkingEmployees(new HashSet<>());
//        store.setIncomes(new HashSet<>());
//    }

}
