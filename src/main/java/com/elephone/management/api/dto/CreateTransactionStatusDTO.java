package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.NotBlank;
import java.util.UUID;

@Getter
@Setter
@Jacksonized
@Builder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateTransactionStatusDTO {
    UUID id;

    @NotBlank
    String key;

    @NotBlank
    String displayName;

    @NotBlank
    Boolean isDefault;

    Boolean isActive;

    @NotBlank
    UUID transactionStatusGroupId;
}
