package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.domain.Store;
import org.mapstruct.*;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE, uses = EmployeeMapper.class, builder = @Builder)
public interface StoreMapper {

//    @Mapping(target = "employees", qualifiedByName = "NoStore")
    @Mapping(target = "employees", ignore = true)
    StoreDTO toDTO(Store store);

    @Named("NoEmployee")
    @Mapping(target = "employees", ignore = true)
    StoreDTO toDTONoEmployee(Store store);

    Store fromDTO(StoreDTO store);
}
