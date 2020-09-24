package com.elephone.management.api.dto;

import com.elephone.management.domain.Employee;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.UUID;

@Data
public class WorkHistoryDTO {

    @JsonProperty
    private UUID id;

    @JsonProperty
    @NotNull
    private String start;

    @JsonProperty
    private String finish;

    @JsonProperty
    @NotNull
    private UUID employeeId;
}
