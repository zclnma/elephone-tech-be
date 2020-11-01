package com.elephone.management.api.dto;

import com.elephone.management.domain.Store;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.jackson.Jacksonized;

import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

@Data
@Jacksonized
@Builder
@JsonIgnoreProperties(ignoreUnknown = true)
public class IncomeDTO {

    private UUID id;

    private Integer cash;

    private Integer efpos;

    private Date createdDate;

    private UUID storeId;
}
