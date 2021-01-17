package com.elephone.management.domain.converter;

import com.elephone.management.domain.EnumRole;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.util.stream.Stream;

@Converter(autoApply = true)
public class EnumRoleConverter implements AttributeConverter<EnumRole, String> {
    @Override
    public String convertToDatabaseColumn(EnumRole enumRole) {
        if (enumRole == null) {
            return null;
        }
        return enumRole.getKey();
    }

    @Override
    public EnumRole convertToEntityAttribute(String role) {
        if (role == null) {
            return null;
        }
        return Stream.of(EnumRole.values())
                .filter(c -> c.getKey().equals(role))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
