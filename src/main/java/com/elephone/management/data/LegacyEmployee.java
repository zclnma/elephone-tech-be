package com.elephone.management.data;

import lombok.Data;

import java.util.List;

@Data
public class LegacyEmployee {

    private String birth;
    private String email;
    private String firstName;
    private String lastName;
    private String gender;
    private String number;
    private String status;
    private List<String> stores;
    private String tfn;
    private String _id;


}
