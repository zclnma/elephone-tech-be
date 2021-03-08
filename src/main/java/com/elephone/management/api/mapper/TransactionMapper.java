package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.CreateTransactionDTO;
import com.elephone.management.api.dto.TransactionDTO;
import com.elephone.management.api.dto.UpdateTransactionDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.Transaction;
import org.apache.commons.lang3.StringUtils;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.Named;

@Mapper(config = MapstructConfig.class, uses = {CommentMapper.class, StoreMapper.class, EmployeeMapper.class, EnumInspectionMapper.class, EnumRoleMapper.class, EnumNotificationMethodMapper.class, TransactionProductMapper.class, WarrantyHistoryMapper.class, TransactionTransitionMapper.class, TransactionActionMapper.class, TransactionStatusMapper.class})
public interface TransactionMapper {

    @Mappings({
            @Mapping(source = "customer.name", target = "customerName"),
            @Mapping(source = "customer.email", target = "email"),
            @Mapping(source = "customer.contact", target = "contact"),
            @Mapping(source = "device.name", target = "device"),
            @Mapping(source = "device.color", target = "color"),
            @Mapping(source = "device.imei", target = "imei"),
            @Mapping(source = "device.passcode", target = "passcode"),
            @Mapping(source = "transactionStatus.key", target = "transactionStatus", qualifiedByName = "fromTransactionStatus"),
    })
    TransactionDTO toDTO(Transaction transaction);

    @Mappings({
            @Mapping(target = "isDeleted", constant = "false"),
            @Mapping(source = "customerName", target = "customer.name"),
            @Mapping(source = "email", target = "customer.email"),
            @Mapping(source = "contact", target = "customer.contact"),
            @Mapping(source = "device", target = "device.name"),
            @Mapping(source = "color", target = "device.color"),
            @Mapping(source = "imei", target = "device.imei"),
            @Mapping(source = "passcode", target = "device.passcode"),
            @Mapping(target = "transactionStatus", ignore = true),
    })
    Transaction fromDTO(TransactionDTO transaction);

    @Mappings({
            @Mapping(target = "isDeleted", constant = "false"),
            @Mapping(source = "customerName", target = "customer.name"),
            @Mapping(source = "email", target = "customer.email"),
            @Mapping(source = "contact", target = "customer.contact"),
            @Mapping(source = "device", target = "device.name"),
            @Mapping(source = "color", target = "device.color"),
            @Mapping(source = "imei", target = "device.imei"),
            @Mapping(source = "passcode", target = "device.passcode"),
            @Mapping(source = "deposit", target = "deposit", qualifiedByName = "fromDepositDto")
    })
    Transaction fromCreateDTO(CreateTransactionDTO createTransactionDTO);

    @Mappings({
            @Mapping(target = "isDeleted", constant = "false"),
            @Mapping(source = "customerName", target = "customer.name"),
            @Mapping(source = "email", target = "customer.email"),
            @Mapping(source = "contact", target = "customer.contact"),
            @Mapping(source = "device", target = "device.name"),
            @Mapping(source = "color", target = "device.color"),
            @Mapping(source = "imei", target = "device.imei"),
            @Mapping(source = "passcode", target = "device.passcode"),
            @Mapping(source = "deposit", target = "deposit", qualifiedByName = "fromDepositDto")
    })
    Transaction fromUpdateDTO(UpdateTransactionDTO updateTransactionDTO);

    @Named("fromDepositDto")
    default String fromDepositDto(String depositDto) {
        if (StringUtils.isEmpty(depositDto)) {
            return "0";
        }
        return depositDto;
    }

    @Named("fromTransactionStatus")
    default String fromTransactionStatus(String transactionStatus) {
        return null;
    }
}
