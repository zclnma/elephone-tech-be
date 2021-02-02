package com.elephone.management.api.mapper;

import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.EnumTransactionStatus;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class)
public interface EnumTransactionStatusMapper {
    default String toString(EnumTransactionStatus transactionStatus) {
        if (transactionStatus == null) {
            return EnumTransactionStatus.WAIT.toString();
        }
        return transactionStatus.getKey();
    }

    default EnumTransactionStatus toEnum(String key) {
        if (key == null) {
            return EnumTransactionStatus.WAIT;
        }
        return EnumTransactionStatus.fromKey(key);
    }
}
