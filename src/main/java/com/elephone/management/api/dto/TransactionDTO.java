package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.Pattern;
import java.time.LocalDateTime;
import java.util.Set;
import java.util.UUID;

@Getter
@Jacksonized
@Builder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class TransactionDTO {

    private UUID id;

    private String customerName;

    @Pattern(regexp = "[\\d]{10}", message = "Invalid contact number.")
    private String contact;

    private String device;

    private String color;

    private String imei;

    private String passcode;

    private String issue;

    private String resolution;

    private String battery;

    private Set<String> initInspections;

    private Set<String> finalInspections;

    private String email;

    private String authSignature;

    private String confSignature;

    private StoreDTO store;

    private EmployeeDTO createdBy;

    private EmployeeDTO finalisedBy;

    private String reference;

    private String status;

    private String additionInfo;

    private Set<TransactionProductDTO> products;

    private Set<MovePathDTO> movePaths;

    private String deposit;

    private Set<CommentDTO> comments;

    private Set<WarrantyHistoryDTO> warrantyHistories;

    private LocalDateTime createdDate;
}
