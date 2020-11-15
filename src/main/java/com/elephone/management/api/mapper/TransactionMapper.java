package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.EnumInspection;
import com.elephone.management.domain.Transaction;
import org.mapstruct.*;

@Mapper(config = MapstructConfig.class, uses = {StoreMapper.class, EmployeeMapper.class, EnumTransactionStatusMapper.class, EnumInspectionMapper.class, EnumRoleMapper.class})
public interface TransactionMapper {

    TransactionDTO toDTO(Transaction transaction);

    @Mappings({
            @Mapping(target = "isFinalised", source = "isFinalised", defaultValue = "false"),
            @Mapping(target = "isDeleted", source = "isDeleted", defaultValue = "false"),
    })
    Transaction fromDTO(TransactionDTO transaction);
}
