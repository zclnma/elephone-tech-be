package com.elephone.management.api.mapper;

import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.EnumNotificationMethod;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class)
public interface EnumNotificationMethodMapper {
    default String toString(EnumNotificationMethod notificationMethod) {
        if (notificationMethod == null) {
            return null;
        }
        return notificationMethod.getKey();
    }

    default EnumNotificationMethod toEnum(String key) {
        if (key == null) {
            return null;
        }
        return EnumNotificationMethod.fromkey(key);
    }
}
