package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.jackson.Jacksonized;
import org.springframework.data.annotation.CreatedDate;

import javax.validation.constraints.NotNull;
import java.util.Date;
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

    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private String transactionNumber;

    private String status;

    @JsonIgnore
    private Boolean isDeleted;

    private List<TransactionProductDTO> products;

    private List<CommentDTO> comments;

    private Date createdDate;
}
