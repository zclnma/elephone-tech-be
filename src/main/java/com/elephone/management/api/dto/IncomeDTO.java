package com.elephone.management.api.dto;

import com.elephone.management.domain.Store;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

@Data
public class IncomeDTO {

    @JsonProperty
    private UUID id;

    @JsonProperty
    private Integer cash;

    @JsonProperty
    private Integer efpos;

    @JsonProperty
    private Date createdDate;

    @JsonProperty
    private UUID storeId;
}
