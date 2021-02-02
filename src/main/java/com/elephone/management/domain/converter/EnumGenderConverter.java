package com.elephone.management.domain.converter;

import com.elephone.management.domain.EnumGender;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.util.stream.Stream;

@Converter(autoApply = true)
public class EnumGenderConverter implements AttributeConverter<EnumGender, String> {

    @Override
    public String convertToDatabaseColumn(EnumGender enumGender) {
        if (enumGender == null) {
            return null;
        }
        return enumGender.getKey();
    }

    @Override
    public EnumGender convertToEntityAttribute(String gender) {
        if (gender == null) {
            return null;
        }
        return Stream.of(EnumGender.values())
                .filter(c -> c.getKey().equals(gender))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
