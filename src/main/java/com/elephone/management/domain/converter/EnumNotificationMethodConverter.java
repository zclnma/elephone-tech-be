package com.elephone.management.domain.converter;

import com.elephone.management.domain.EnumNotificationMethod;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.util.stream.Stream;

@Converter(autoApply = true)
public class EnumNotificationMethodConverter implements AttributeConverter<EnumNotificationMethod, String> {
    @Override
    public String convertToDatabaseColumn(EnumNotificationMethod enumNotificationMethod) {
        if (enumNotificationMethod == null) {
            return null;
        }
        return enumNotificationMethod.getKey();
    }

    @Override
    public EnumNotificationMethod convertToEntityAttribute(String enumNotificationMethod) {
        if (enumNotificationMethod == null) {
            return null;
        }
        return Stream.of(EnumNotificationMethod.values())
                .filter(c -> c.getKey().equals(enumNotificationMethod))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
