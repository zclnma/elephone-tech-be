package com.elephone.management.api.dto;

import com.elephone.management.domain.EnumTransactionStatus;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Data
@Jacksonized
@Builder
@JsonIgnoreProperties(ignoreUnknown = true)
public class TransactionDTO {

    private UUID id;

    private String customerName;

    private String pickupTime;

    private String contact;

    private String device;

    private String color;

    private String imei;

    private String issue;

    private String condition;

    private String resolution;

    private Boolean inspection;

    @NotNull
    private UUID storeId;

    private UUID createdBy;

    private UUID finalisedBy;

    private String transactionNumber;

    private EnumTransactionStatus status;

    private Boolean isFinalised;

    private List<UUID> productId;

    private List<CommentDTO> comments;
}
