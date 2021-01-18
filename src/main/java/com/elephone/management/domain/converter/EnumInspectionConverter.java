package com.elephone.management.domain.converter;

import com.elephone.management.domain.EnumInspection;
import com.elephone.management.domain.EnumRole;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.util.stream.Stream;

@Converter(autoApply = true)
public class EnumInspectionConverter implements AttributeConverter<EnumInspection, String> {
    @Override
    public String convertToDatabaseColumn(EnumInspection enumInspection) {
        if (enumInspection == null) {
            return null;
        }
        return enumInspection.getKey();
    }

    @Override
    public EnumInspection convertToEntityAttribute(String inspection) {
        if (inspection == null) {
            return null;
        }
        return Stream.of(EnumInspection.values())
                .filter(c -> c.getKey().equals(inspection))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
