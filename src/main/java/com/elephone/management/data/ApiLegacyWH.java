package com.elephone.management.data;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ApiLegacyWH {
    private Integer count;
    private List<LegacyWorkHistory> workHistory;
}
