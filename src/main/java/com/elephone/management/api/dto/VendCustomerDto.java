package com.elephone.management.api.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author wupeng
 * @version 1.0
 * @date 2021/9/1 11:29
 */
@Data
public class VendCustomerDto implements Serializable {

    private static final long serialVersionUID = 7048324419051849657L;

    private String id;

    private String customer_code;

    private String first_name;

    private String last_name;

    private String email;

    private String phone;

    private String mobile;

}
