package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.SuperBuilder;
import lombok.extern.jackson.Jacksonized;

import java.util.List;
import java.util.Set;
import java.util.UUID;

@Getter
@Jacksonized
@SuperBuilder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class EmployeeDTO {

    private UUID id;

    private String username;

    private String firstName;

    private String lastName;

    private String gender;

    private String birthday;

    private String role;

    private String contact;

    private String email;

    private String tfn;

    private Set<StoreDTO> stores;
}
