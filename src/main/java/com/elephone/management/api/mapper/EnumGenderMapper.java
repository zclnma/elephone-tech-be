package com.elephone.management.api.mapper;

import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.EnumGender;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class)
public interface EnumGenderMapper {
    default String toString(EnumGender gender) {
        if (gender == null) {
            return null;
        }
        return gender.getKey();
    }

    default EnumGender toEnum(String key) {
        if (key == null) {
            return null;
        }
        return EnumGender.fromKey(key);
    }
}
