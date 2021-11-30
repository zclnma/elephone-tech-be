package com.elephone.management.api.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class VendCustomerGroupListDto implements Serializable {

    private static final long serialVersionUID = 7048324419051844657L;

    private List<VendCustomerGroupDto> data;
}
