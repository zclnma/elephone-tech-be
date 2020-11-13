package com.elephone.management.domain;

import org.apache.commons.lang3.StringUtils;

public enum EnumTransactionStatus {
    WAIT("WAIT", "Waiting for parts"),
    SENT("SENT", "Sent away"),
    DONE("DONE", "Done");

    private String key;
    private String displayName;

    EnumTransactionStatus(String key, String displayName){
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
        EnumTransactionStatus status = null;
        for (EnumTransactionStatus transactionStatus : EnumTransactionStatus.values()) {
            if (StringUtils.equals(transactionStatus.getKey(), key)) {
                status = transactionStatus;
                break;
            }
        }
        return status;
    }
}
