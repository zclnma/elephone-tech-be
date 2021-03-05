package com.elephone.management.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

@Getter
@AllArgsConstructor
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
    VOLUME("VOLUME", "Volume / Power Button"),
    CHARGING("CHARGING", "Charging"),
    LIQUID("LIQUID", "Liquid Damage");

    private final String key;
    private final String displayName;

    public static EnumInspection fromKey(String key) {
        for (EnumInspection item : EnumInspection.values()) {
            if (StringUtils.equals(item.getKey(), key)) {
                return item;
            }
        }
        return null;
    }
}
