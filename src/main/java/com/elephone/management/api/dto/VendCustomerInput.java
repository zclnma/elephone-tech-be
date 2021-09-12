package com.elephone.management.api.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * @author wupeng
 * @version 1.0
 * @date 2021/9/1 11:30
 */
@Data
public class VendCustomerInput {

    @NotBlank(message = "first_name cannot be empty")
    @Size(max = 100, message = "first_name maximum length is 100")
    private String first_name;

    @NotBlank(message = "last_name cannot be empty")
    @Size(max = 100, message = "last_name maximum length is 100")
    private String last_name;

    private String email;

    private String phone;

    private Boolean do_not_email;
}
