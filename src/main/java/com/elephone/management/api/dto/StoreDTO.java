package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import lombok.extern.jackson.Jacksonized;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Getter
@Jacksonized
@Builder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class StoreDTO {

    private UUID id;

    private String contact;

    private String name;

    private String abn;

    private String sequence;

    private Integer warranty;

    @JsonIgnore
    private List<EmployeeDTO> employees;
}
