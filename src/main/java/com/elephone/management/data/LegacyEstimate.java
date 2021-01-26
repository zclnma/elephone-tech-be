package com.elephone.management.data;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LegacyEstimate {
    private String _id;
    private String price;
    private String item;
    private String description;
}
