package com.elephone.management.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.apache.commons.lang3.StringUtils;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@AllArgsConstructor
public enum EnumTransactionStatus {
    RECEIVED("RECEIVED", "Item received", EnumTransactionStatusGroup.TO_BE_FIXED),
    IN_TRANSITION_TO_TECHNICIAN("IN_TRANSITION_TO_TECHNICIAN", "In Transition to technician", EnumTransactionStatusGroup.TO_BE_FIXED),
    RECEIVED_BY_TECHNICIAN("RECEIVED_BY_TECHNICIAN", "Received by technician, fix in queue", EnumTransactionStatusGroup.TO_BE_FIXED),
    FIX_IN_PROGRESS("IN_PROGRESS", "Repair in progress", EnumTransactionStatusGroup.TO_BE_FIXED),
    IN_TRANSITION_TO_STORE("IN_TRANSITION_TO_STORE", "In transition to store", EnumTransactionStatusGroup.TO_BE_FIXED),
    TO_BE_COLLECTED("TO_BE_COLLECTED", "Waiting to be collected", EnumTransactionStatusGroup.TO_BE_COLLECTED),
    FINALISED("FINALISED", "Transaction finalised", EnumTransactionStatusGroup.FINALISED);

    private String key;
    private String displayName;
    private EnumTransactionStatusGroup enumTransactionStatusGroup;

    public static EnumTransactionStatus fromKey(String key) {
        for (EnumTransactionStatus transactionStatus : EnumTransactionStatus.values()) {
            if (StringUtils.equals(transactionStatus.getKey(), key)) {
                return transactionStatus;
            }
        }
        return RECEIVED;
    }

    public static List<EnumTransactionStatus> fromStatusOrder(EnumTransactionStatusGroup enumTransactionStatusGroup) {
        return Arrays.stream(EnumTransactionStatus.values()).filter(enumTransactionStatus -> enumTransactionStatus.enumTransactionStatusGroup == enumTransactionStatusGroup).collect(Collectors.toList());
    }
}
