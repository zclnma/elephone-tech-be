package com.elephone.management.domain;

import org.apache.commons.lang3.StringUtils;

public enum EnumNotificationMethod {
    SMS("sms", "Notify By SMS."),
    EMAIL("email", "Notify by email.");

    private String key;
    private String displayName;

    EnumNotificationMethod(String key, String displayName) {
        this.displayName = displayName;
        this.key = key;
    }

    public String getKey() {
        return key;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static EnumNotificationMethod fromkey(String key) {
        for (EnumNotificationMethod enumNotificationMethod : EnumNotificationMethod.values()) {
            if (StringUtils.equals(enumNotificationMethod.getKey(), key)) {
                return enumNotificationMethod;
            }
        }
        return null;
    }
}
