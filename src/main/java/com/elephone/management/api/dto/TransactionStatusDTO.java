package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.jackson.Jacksonized;

import java.util.UUID;

@Getter
@Setter
@Jacksonized
@Builder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class TransactionStatusDTO {

    UUID id;
    String key;
    String displayName;
    TransactionStatusGroupDTO transactionStatusGroup;
}