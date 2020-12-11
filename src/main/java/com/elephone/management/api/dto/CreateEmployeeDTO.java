package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.SuperBuilder;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.List;
import java.util.UUID;

@Getter
@Jacksonized
@SuperBuilder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateEmployeeDTO {
    private UUID id;

    private String password;

    @NotNull
    private String username;

    @NotNull
    private String firstName;

    @NotNull
    private String lastName;

    @NotNull
    private String gender;

    @NotNull
    private String birthday;

    @NotNull
    private String role;

    @NotNull
    private String contact;

    @NotNull
    @Email(message = "Email format is not valid")
    private String email;

    @NotNull
    @Pattern(regexp = "[\\d]{10}", message = "A valid TFN must be 10 digits.")
    private String tfn;

    private List<UUID> storeIds;
}
