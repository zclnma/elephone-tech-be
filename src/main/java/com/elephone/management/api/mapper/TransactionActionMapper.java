package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionActionDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.TransactionAction;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class, uses = {TransactionStatusMapper.class, EmployeeMapper.class})
public interface TransactionActionMapper {
    TransactionAction fromDTO(TransactionActionDTO transactionActionDTO);

    TransactionActionDTO toDTO(TransactionAction transactionAction);
}
