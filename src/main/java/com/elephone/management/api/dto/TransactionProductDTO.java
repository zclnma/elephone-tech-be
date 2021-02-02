package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.NotBlank;
import java.util.UUID;

@Getter
@Jacksonized
@SuperBuilder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class TransactionProductDTO {

    private UUID id;

    @NotBlank
    private String number;

    @NotBlank
    private String description;

    @NotBlank
    private String price;

}
