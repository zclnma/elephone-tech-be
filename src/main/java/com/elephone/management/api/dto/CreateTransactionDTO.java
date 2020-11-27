package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.UUID;

@Getter
@Jacksonized
@Builder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateTransactionDTO {

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
    private UUID storeId;

    @NotNull
    private UUID createdById;

    private List<TransactionProductDTO> products;

}
