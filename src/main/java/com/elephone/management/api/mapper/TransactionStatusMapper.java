package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionStatusDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.TransactionStatus;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class, uses = {TransactionStatusGroupMapper.class})
public interface TransactionStatusMapper {
    TransactionStatusDTO toDTO(TransactionStatus transactionStatus);
}
