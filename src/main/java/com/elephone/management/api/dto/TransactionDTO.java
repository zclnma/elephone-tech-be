package com.elephone.management.api.dto;

import com.elephone.management.domain.Employee;
import com.elephone.management.domain.EnumTransactionStatus;
import com.elephone.management.domain.Store;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Data
public class TransactionDTO {

    @JsonProperty
    private UUID id;

    @JsonProperty
    private String customerName;

    @JsonProperty
    private String pickupTime;

    @JsonProperty
    private String contact;

    @JsonProperty
    private String device;

    @JsonProperty
    private String color;

    @JsonProperty
    private String imei;

    @JsonProperty
    private String issue;

    @JsonProperty
    private String condition;

    @JsonProperty
    private String resolution;

    @JsonProperty
    private Boolean inspection;

    @JsonProperty
    private UUID storeId;

    @JsonProperty
    private UUID createdBy;

    @JsonProperty
    private UUID finalisedBy;

    @JsonProperty
    private String transactionNumber;

    @JsonProperty
    private EnumTransactionStatus status;

    @JsonProperty
    private Boolean isFinalised;

    @JsonProperty
    private List<UUID> productId;
}
