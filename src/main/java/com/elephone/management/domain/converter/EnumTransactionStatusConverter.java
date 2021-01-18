package com.elephone.management.domain.converter;

import com.elephone.management.domain.EnumRole;
import com.elephone.management.domain.EnumTransactionStatus;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.util.stream.Stream;

@Converter(autoApply = true)
public class EnumTransactionStatusConverter implements AttributeConverter<EnumTransactionStatus, String> {
    @Override
    public String convertToDatabaseColumn(EnumTransactionStatus enumTransactionStatus) {
        if (enumTransactionStatus == null) {
            return null;
        }
        return enumTransactionStatus.getKey();
    }

    @Override
    public EnumTransactionStatus convertToEntityAttribute(String transactionStatus) {
        if (transactionStatus == null) {
            return null;
        }
        return Stream.of(EnumTransactionStatus.values())
                .filter(c -> c.getKey().equals(transactionStatus))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
