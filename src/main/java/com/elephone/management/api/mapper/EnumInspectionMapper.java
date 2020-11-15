package com.elephone.management.api.mapper;

import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.EnumInspection;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class)
public interface EnumInspectionMapper {

    default String toString(EnumInspection inspection) {
        if (inspection == null) {
            return null;
        }
        return inspection.getKey();
    }

    default EnumInspection toEnum(String key) {
        if (key == null) {
            return null;
        }
        return EnumInspection.fromKey(key);
    }
}
