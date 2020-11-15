package com.elephone.management.domain;

import org.apache.commons.lang3.StringUtils;

public enum EnumGender {

    MALE("male", "Male"),
    FEMALE("female", "Female"),
    UNSPECIFIED("unspecified", "Unspecified");

    private String key;
    private String displayName;

    EnumGender(String key, String displayName) {
        this.key = key;
        this.displayName = displayName;
    }

    public String getKey() {
        return key;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static EnumGender fromKey(String key) {
        for (EnumGender enumGender : EnumGender.values()) {
            if (StringUtils.equals(enumGender.getKey(), key)) {
                return enumGender;
            }
        }
        return UNSPECIFIED;
    }
}
