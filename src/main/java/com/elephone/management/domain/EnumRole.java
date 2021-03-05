package com.elephone.management.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

@Getter
@AllArgsConstructor
public enum EnumRole {
    USER("USER", "User"),
    ADMIN("ADMIN", "Admin");

    private String key;
    private String displayName;

    public static EnumRole fromKey(String key) {
        for (EnumRole enumRole : EnumRole.values()) {
            if (StringUtils.equals(enumRole.getKey(), key)) {
                return enumRole;
            }
        }
        return USER;
    }
}
