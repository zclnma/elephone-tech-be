package com.elephone.management.api.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author wupeng
 * @version 1.0
 * @date 2021/9/1 11:28
 */
@Data
public class VendCustomerListDto implements Serializable {

    private static final long serialVersionUID = -9153173627890080948L;
    private List<VendCustomerDto> data;
}
