package com.elephone.management.domain;

import org.apache.commons.lang3.StringUtils;

public enum EnumInspection {
    SENSOR("SENSOR", "Proximity Sensor"),
    CAMERA("CAMERA", "Front / Back Camera"),
    EAR_SPEAKER("EAR_SPEAKER", "Ear Speaker"),
    LOUD_SPEAKER("LOUD_SPEAKER", "Loud Speaker"),
    WIFI("WIFI", "Bluetooth / WIFI"),
    LCD("LCD", "LCD"),
    MICROPHONE("MICROPHONE", "Microphone"),
    HOME("HOME", "Home Button"),
    ID("ID", "Face ID / Touch ID"),
    VOLUME("VOLUME", "Volume / Power Button");

    private final String key;
    private final String displayName;

    EnumInspection(String key, String displayName) {
        this.key = key;
        this.displayName = displayName;
    }

    public String getKey() {
        return key;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static EnumInspection fromKey(String key) {
        for (EnumInspection item : EnumInspection.values()) {
            if (StringUtils.equals(item.getKey(), key)) {
                return item;
            }
        }
        return null;
    }
}
