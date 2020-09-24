package com.elephone.management.data;

import lombok.Data;

@Data
public class LegacyIncome {
    private String _id;
    private String recordedBy;
    private String date;
    private Integer efpos;
    private Integer cash;
}
