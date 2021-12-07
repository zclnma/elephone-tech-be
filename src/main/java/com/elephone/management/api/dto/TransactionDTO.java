package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.Pattern;
import java.time.LocalDateTime;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
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

    private String transactionStatus;

    private String additionInfo;

    private Set<TransactionProductDTO> products;

    private Set<TransactionTransitionDTO> transactionTransitions;

    private Set<TransactionActionDTO> transactionActions;

    private String deposit;

    private Set<CommentDTO> comments;

    private Set<WarrantyHistoryDTO> warrantyHistories;

    private LocalDateTime createdDate;

    private Boolean membership;

    private Boolean notification;

    private String pickupTime;

    private String pdfUrl;

    private String warrantyPeriod;

    private Boolean isSoaking;

    private String warrantyExpiryDate;

    private String batteryHealth;

    private Boolean isInspectable;

}
