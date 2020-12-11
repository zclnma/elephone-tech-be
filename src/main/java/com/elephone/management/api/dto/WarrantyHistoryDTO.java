package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.extern.jackson.Jacksonized;

import java.util.UUID;

@Getter
@Jacksonized
@Builder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class WarrantyHistoryDTO {
    private UUID id;

    private String description;

    private StoreDTO storeDTO;

    private EmployeeDTO employeeDTO;

}
