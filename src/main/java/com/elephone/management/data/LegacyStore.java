package com.elephone.management.data;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
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
