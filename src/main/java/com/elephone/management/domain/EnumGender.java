package com.elephone.management.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

@Getter
@AllArgsConstructor
public enum EnumGender {

    MALE("MALE", "Male"),
    FEMALE("FEMALE", "Female"),
    UNSPECIFIED("UNSPECIFIED", "Unspecified");

    private String key;
    private String displayName;

    public static EnumGender fromKey(String key) {
        for (EnumGender enumGender : EnumGender.values()) {
            if (StringUtils.equals(enumGender.getKey(), key)) {
                return enumGender;
            }
        }
        return UNSPECIFIED;
    }
}
