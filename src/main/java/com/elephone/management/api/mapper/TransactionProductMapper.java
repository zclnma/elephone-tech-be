package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionProductDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.TransactionProduct;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class)
public interface TransactionProductMapper {
    TransactionProduct fromDTO(TransactionProductDTO transactionProductDTO);

    TransactionProductDTO toDTO(TransactionProduct transactionProduct);
}
