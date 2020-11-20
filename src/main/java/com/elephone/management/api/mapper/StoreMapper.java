package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import org.mapstruct.*;

import java.util.List;

@Mapper(config = MapstructConfig.class, uses = EmployeeMapper.class, builder = @Builder)
public interface StoreMapper {

//    @Named("NoEmployee")
//    @Mapping(target = "employees", ignore = true)
//    StoreDTO toDTOIgnoreEmployee(Store stores);
//
//    @Named("NoListEmployee")
//    @Mapping(target = "employees", ignore = true)
//    List<StoreDTO> toDTOIgnoreListEmployee(List<Store> stores);

    StoreDTO toDTO(Store store);

    @Mapping(target = "isDeleted", constant = "false")
    Store fromDTO(StoreDTO store);

}
