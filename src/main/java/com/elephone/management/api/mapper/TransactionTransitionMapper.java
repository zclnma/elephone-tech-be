package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionTransitionDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.TransactionTransition;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class, uses = {StoreMapper.class})
public interface TransactionTransitionMapper {
    TransactionTransition fromDTO(TransactionTransitionDTO transactionTransitionDTO);

    TransactionTransitionDTO toDTO(TransactionTransition transactionTransition);
}
