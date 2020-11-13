package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.TransactionDTO;
import com.elephone.management.domain.Transaction;
import org.mapstruct.*;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE, uses = {StoreMapper.class, EmployeeMapper.class})
public interface TransactionMapper {

    TransactionDTO toDTO(Transaction transaction);

    @Mappings({
            @Mapping(target = "isFinalised", source = "isFinalised", defaultValue = "false"),
            @Mapping(target = "isDeleted", source = "isDeleted", defaultValue = "false"),
            @Mapping(target = "status", source = "status", defaultValue = "WAIT")
    })
    Transaction fromDTO(TransactionDTO transaction);

}
