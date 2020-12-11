package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.WarrantyHistoryDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.WarrantyHistory;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class, uses = {StoreMapper.class, EmployeeMapper.class})
public interface WarrantyHistoryMapper {

    WarrantyHistoryDTO toDTO(WarrantyHistory warrantyHistory);

    WarrantyHistory fromDTO(WarrantyHistoryDTO warrantyHistoryDTO);
}
