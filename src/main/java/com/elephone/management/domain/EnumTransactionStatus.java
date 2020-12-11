package com.elephone.management.domain;

import org.apache.commons.lang3.StringUtils;

public enum EnumTransactionStatus {
    WAIT("WAIT", "Waiting for parts"),
    DONE("DONE", "Done"),
    FINALISED("FINALISED", "Finalised");

    private String key;
    private String displayName;

    EnumTransactionStatus(String key, String displayName) {
        this.key = key;
        this.displayName = displayName;
    }

    public String getKey() {
        return key;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static EnumTransactionStatus fromKey(String key) {
        for (EnumTransactionStatus transactionStatus : EnumTransactionStatus.values()) {
            if (StringUtils.equals(transactionStatus.getKey(), key)) {
                return transactionStatus;
            }
        }
        return WAIT;
    }
}
