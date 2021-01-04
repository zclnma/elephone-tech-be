package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CreateEmployeeDTO;
import com.elephone.management.api.dto.CreateStoreDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import org.mapstruct.*;

import java.util.List;

@Mapper(config = MapstructConfig.class, uses = EmployeeMapper.class, builder = @Builder)
public interface StoreMapper {

    StoreDTO toDTO(Store store);

    @Mapping(target = "isDeleted", constant = "false")
    Store fromDTO(StoreDTO store);

    @Mapping(target = "isDeleted", constant = "false")
    Store fromCreateDTO(CreateStoreDTO createStoreDTO);
}
