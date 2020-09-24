package com.elephone.management.data;

import lombok.Data;

import java.util.List;

@Data
public class ApiLegacyWH {
    private Integer count;
    private List<LegacyWorkHistory> workHistory;
}
