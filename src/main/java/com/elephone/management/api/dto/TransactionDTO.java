package com.elephone.management.api.dto;

import com.elephone.management.domain.EnumTransactionStatus;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.UUID;

@Getter
@Jacksonized
@Builder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class TransactionDTO {

    private UUID id;

    private String customerName;

    private String pickupTime;

    private String contact;

    private String device;

    private String color;

    private String imei;

    private String passcode;

    private String issue;

    private String condition;

    private String resolution;

    private String battery;

    private List<String> inspections;

    private String email;

    private String signature;

    @NotNull
    private StoreDTO store;

    @NotNull
    private EmployeeDTO createdBy;

    private EmployeeDTO finalisedBy;

    private String transactionNumber;

    private EnumTransactionStatus status;

    @JsonIgnore
    private Boolean isFinalised;

    @JsonIgnore
    private Boolean isDeleted;

    private List<UUID> productId;

    @JsonManagedReference
    private List<CommentDTO> comments;
}
