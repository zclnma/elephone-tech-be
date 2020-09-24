package com.elephone.management.data;

import lombok.Data;

import java.util.List;

@Data
public class LegacyTransaction {
    private String _id;
    private String color;
    private String createdBy;
    private String device;
    private String imei;
    private String inspetion;
    private String issue;
    private String name;
    private String number;
    private String sequentialNumber;
    private String status;
    private String time;
    private String resolution;
    private TransactionStore store;
    private List<LegacyEstimate> estimate;

}
