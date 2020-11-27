package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CreateTransactionDTO;
import com.elephone.management.api.dto.TransactionDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.Transaction;
import org.mapstruct.*;

@Mapper(config = MapstructConfig.class, uses = {CommentMapper.class, StoreMapper.class, EmployeeMapper.class, EnumTransactionStatusMapper.class, EnumInspectionMapper.class, EnumRoleMapper.class, TransactionProductMapper.class})
public interface TransactionMapper {

    TransactionDTO toDTO(Transaction transaction);

    @Mappings({
            @Mapping(target = "isFinalised", source = "isFinalised", defaultValue = "false"),
            @Mapping(target = "isDeleted", source = "isDeleted", defaultValue = "false"),
    })
    Transaction fromDTO(TransactionDTO transaction);

    @Mappings({
            @Mapping(target = "isFinalised", constant = "false"),
            @Mapping(target = "isDeleted", constant = "false"),
    })
    Transaction fromCreateDTO(CreateTransactionDTO createTransactionDTO);
}
