package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
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
public class EmployeeDTO {

    private UUID id;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String password;

    @JsonIgnore
    private UUID cognitoId;

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
    @Pattern(regexp = "[\\d]{10}")
    private String contact;

    @NotNull
    @Email(message = "Email format is not valid")
    private String email;

    @NotNull
    @Pattern(regexp = "[\\d]{10}")
    private String tfn;

    private List<StoreDTO> stores;
}
