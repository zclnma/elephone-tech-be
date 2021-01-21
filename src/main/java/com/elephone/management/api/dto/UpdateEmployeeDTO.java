package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.UUID;

@Data
@Builder
@Jacksonized
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class UpdateEmployeeDTO {

    private UUID id;

    private String password;

    private String username;

    @NotBlank
    private String firstName;

    @NotBlank
    private String lastName;

    @NotBlank
    private String gender;

    private String birthday;

    private String role;

    private String contact;

    private String email;

    private String tfn;

    private List<UUID> storeIds;
}
