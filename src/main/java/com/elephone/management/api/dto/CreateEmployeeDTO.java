package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.SuperBuilder;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
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

    @NotBlank
    private String username;

    @NotBlank
    private String firstName;

    @NotBlank
    private String lastName;

    @NotBlank
    private String gender;

    @NotBlank
    private String birthday;

    @NotBlank
    private String role;

    @NotBlank
    private String contact;

    @NotBlank
    @Email(message = "Email format is not valid")
    private String email;

    @NotBlank
    @Pattern(regexp = "[\\d]{10}", message = "A valid TFN must be 10 digits.")
    private String tfn;

    private List<UUID> storeIds;
}
