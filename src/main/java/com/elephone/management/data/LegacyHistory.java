package com.elephone.management.data;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class LegacyHistory {
    private String _id;
    private String color;
    private LegacyBy createdBy;
    private LegacyBy finalisedBy;
    private String finalisedTime;
    private String device;
    private String imei;
    private String inspetion;
    private String issue;
    private String name;
    private String number;
    private String sequentialNumber;
    private String time;
    private String resolution;
    private TransactionStore store;
    private List<LegacyEstimate> estimate;
}
