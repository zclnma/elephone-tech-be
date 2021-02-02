package com.elephone.management.data;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ApiLegacyIncome {
    private Integer count;
    private List<LegacyIncome> income;
}
