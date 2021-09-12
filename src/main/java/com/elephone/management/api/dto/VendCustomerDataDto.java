package com.elephone.management.api.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author wupeng
 * @version 1.0
 * @date 2021/9/1 11:31
 */
@Data
public class VendCustomerDataDto implements Serializable {
    private static final long serialVersionUID = 7048324419051844657L;

    private VendCustomerDto data;
}
