package com.elephone.management.api.dto;

import com.elephone.management.domain.EnumGender;
import com.elephone.management.domain.EnumRole;
import com.fasterxml.jackson.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.experimental.SuperBuilder;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.HashSet;
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

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String password;

    @JsonIgnore
    private UUID cognitoId;

    @NotNull
    private String firstName;

    @NotNull
    private String lastName;

    @NotNull
    private EnumGender gender;

    @NotNull
    private String birthday;

    @NotNull
    private EnumRole role;

    @NotNull
    @Pattern(regexp="[\\d]{10}")
    private String contact;

    @NotNull
    @Email(message = "Email format is not valid")
    private String email;

    @NotNull
    @Pattern(regexp="[\\d]{10}")
    private String tfn;

    private List<StoreDTO> stores;
}
