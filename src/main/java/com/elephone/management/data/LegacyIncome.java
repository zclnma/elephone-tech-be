package com.elephone.management.data;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LegacyIncome {
    private String _id;
    private String recordedBy;
    private String date;
    private Integer efpos;
    private Integer cash;
}
