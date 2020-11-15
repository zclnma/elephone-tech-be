package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.Store;
import org.mapstruct.*;

@Mapper(config = MapstructConfig.class,  uses = EmployeeMapper.class, builder = @Builder)
public interface StoreMapper {

    @Mapping(target = "employees", ignore = true)
    StoreDTO toDTO(Store store);

    Store fromDTO(StoreDTO store);
}
