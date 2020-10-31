package com.elephone.management.api.dto;

import com.elephone.management.domain.Employee;
import com.elephone.management.domain.Store;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {

    @JsonProperty
    private UUID id;

    @JsonProperty
    private String content;

    @JsonProperty
    private UUID employeeId;

    @JsonProperty
    private UUID transactionId;
}
