package com.elephone.management.data;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ApiHistory {
    private Integer count;
    private List<LegacyHistory> history;
}
