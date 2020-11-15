package com.elephone.management.api.mapper;

import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.EnumRole;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class)
public interface EnumRoleMapper {

    default String toString(EnumRole enumRole) {
        if (enumRole == null) {
            return null;
        }
        return enumRole.getKey();
    }

    default EnumRole toEnum(String key) {
        if (key == null) {
            return null;
        }
        return EnumRole.fromKey(key);
    }
}
