package com.elephone.management.data;

import lombok.Data;

import java.util.List;

@Data
public class ApiLegacyIncome {
    private Integer count;
    private List<LegacyIncome> income;
}
