package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.UUID;

@Getter
@Jacksonized
@Builder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateTransactionDTO {

    private String additionInfo;

    @NotNull
    private String customerName;

    private String pickupTime;

    @NotNull
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

    @NotNull
    @Email(message = "Email format is not valid")
    private String email;

    @NotNull
    private String signature;

    @NotNull
    private UUID storeId;

    @NotNull
    private UUID createdById;

    private List<TransactionProductDTO> products;

    private String deposit;

}
