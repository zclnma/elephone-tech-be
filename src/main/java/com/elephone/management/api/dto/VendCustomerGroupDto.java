package com.elephone.management.api.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class VendCustomerGroupDto implements Serializable {

    private static final long serialVersionUID = 7048324419051849657L;

    private String id;

    private String name;

    private String group_id;

}
