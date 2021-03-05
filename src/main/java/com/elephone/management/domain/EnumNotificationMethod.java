package com.elephone.management.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

@Getter
@AllArgsConstructor
public enum EnumNotificationMethod {
    SMS("SMS", "Notify By SMS."),
    EMAIL("EMAIL", "Notify by email.");

    private String key;
    private String displayName;

    public static EnumNotificationMethod fromkey(String key) {
        for (EnumNotificationMethod enumNotificationMethod : EnumNotificationMethod.values()) {
            if (StringUtils.equals(enumNotificationMethod.getKey(), key)) {
                return enumNotificationMethod;
            }
        }
        return null;
    }
}
