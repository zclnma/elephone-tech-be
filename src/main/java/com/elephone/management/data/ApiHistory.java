package com.elephone.management.data;

import lombok.Data;

import java.util.List;

@Data
public class ApiHistory {
    private Integer count;
    private List<LegacyHistory> history;
}
