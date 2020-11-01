package com.elephone.management.api.dto;

import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.jackson.Jacksonized;

import java.util.Date;
import java.util.UUID;

@Data
@Jacksonized
@Builder
@JsonIgnoreProperties(ignoreUnknown = true)
public class CommentDTO {

    private UUID id;

    private String content;

    private UUID employeeId;

    private UUID transactionId;

    private Date lastModifiedDate;
}
