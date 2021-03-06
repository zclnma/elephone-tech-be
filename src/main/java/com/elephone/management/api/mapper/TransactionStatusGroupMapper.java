package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionStatusGroupDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.TransactionStatusGroup;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class)
public interface TransactionStatusGroupMapper {
    TransactionStatusGroupDTO toDTO(TransactionStatusGroup transactionStatusGroup);
}
