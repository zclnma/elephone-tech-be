package com.elephone.management.data;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class LegacyStore {

    private String _id;
    private String name;
    private String number;
    private String password;
    private String abn;
    private String warrenty;
    private Latitude latitude;
    private Longitude longitude;
    private List<StoreEmployee> workingEmployee;
    private List<StoreEmployee> employees;


}
