package com.elephone.management.domain;

import org.apache.commons.lang3.StringUtils;

public enum EnumRole {
    USER("user", "User"),
    ADMIN("admin", "Admin");

    private String key;
    private String displayName;

    EnumRole(String key, String displayName) {
        this.key = key;
        this.displayName = displayName;
    }

    public String getKey() {
        return key;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static EnumRole fromKey(String key) {
        for (EnumRole enumRole : EnumRole.values()) {
            if (StringUtils.equals(enumRole.getKey(), key)) {
                return enumRole;
            }
        }
        return USER;
    }
}
