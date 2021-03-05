package com.elephone.management.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum EnumTransactionStatusGroup {

    TO_BE_FIXED("TO_BE_FIXED", "To be fixed", 1),
    TO_BE_COLLECTED("TO_BE_COLLECTED", "To be collected", 2),
    FINALISED("FINALISED", "Finalised", 3);

    private String key;
    private String displayName;
    private Integer order;
}
