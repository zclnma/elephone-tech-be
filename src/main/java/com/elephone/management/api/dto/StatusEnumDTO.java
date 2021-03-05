package com.elephone.management.api.dto;

import com.elephone.management.domain.EnumTransactionStatusGroup;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.jackson.Jacksonized;

@Getter
@Setter
@Jacksonized
@Builder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class StatusEnumDTO{
    String key;
    String displayName;
    StatusGroupDTO statusGroup;
}
