package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Builder
@Jacksonized
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateTransactionDTO {

    private UUID id;

    private String additionInfo;

    @NotBlank(message = "Customer name can't be empty.")
    private String customerName;

    @NotBlank(message = "Contact number can't be empty.")
    private String contact;

    private String device;

    private String color;

    private String imei;

    private String passcode;

    private String issue;

    private String resolution;

    private String battery;

    private Set<String> initInspections;

    @NotBlank(message = "Email can't be empty.")
    @Email(message = "Email format is not valid")
    private String email;

    private String authSignature;

    private String notificationMethod;

    private UUID storeId;

    private UUID createdById;

    private List<TransactionProductDTO> products;

    private String deposit;

    private Boolean membership;

    private Boolean notification;
}
