package com.elephone.management.data;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreEmployee {
    private String _id;
    private String firstName;
    private String lastName;
}
