package com.elephone.management.data;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class StoreEmployee {
    private String _id;
    private String firstName;
    private String lastName;
}
