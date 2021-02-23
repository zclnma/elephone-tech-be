package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionProductDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.TransactionProduct;
import org.apache.commons.lang3.StringUtils;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.Named;

@Mapper(config = MapstructConfig.class)
public interface TransactionProductMapper {
    @Mappings({
            @Mapping(source = "number", target = "number", qualifiedByName = "fromNumberDto")
    })
    TransactionProduct fromDTO(TransactionProductDTO transactionProductDTO);

    TransactionProductDTO toDTO(TransactionProduct transactionProduct);

    @Named("fromNumberDto")
    default String fromNumberDto(String nameDto) {
        if (StringUtils.isEmpty(nameDto)) {
            return "1";
        }

        return nameDto;
    }
}
