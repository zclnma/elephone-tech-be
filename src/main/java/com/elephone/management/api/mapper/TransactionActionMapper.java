package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionActionDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.TransactionAction;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

@Mapper(config = MapstructConfig.class, uses = {TransactionStatusMapper.class, EmployeeMapper.class})
public interface TransactionActionMapper {
    @Mappings({
            @Mapping(source = "createdDate", target = "performedDate"),
    })
    TransactionActionDTO toDTO(TransactionAction transactionAction);
}
