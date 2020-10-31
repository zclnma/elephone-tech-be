package com.elephone.management.api.dto;

import com.elephone.management.domain.Comment;
import com.elephone.management.domain.EnumTransactionStatus;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Set;
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
    @NotNull
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

    @JsonProperty
    private Set<CommentDTO> comments;
}
