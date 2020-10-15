package com.elephone.management.api.dto;

import com.elephone.management.domain.EnumGender;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Data
public class EmployeeDTO {

    @JsonProperty
    private UUID id;

    @JsonProperty
    private String firstName;

    @JsonProperty
    private String lastName;

    @JsonProperty
    private EnumGender gender;

    @JsonProperty
    private String birthday;

    @JsonProperty
    @Pattern(regexp = "(\\+61|0)[0-9]{9}", message = "Invalid contact number.")
    private String contact;

    @JsonProperty
    @Email(message = "Email format is not valid")
    private String email;

    @JsonProperty
    private String tfn;

    @JsonProperty
    private UUID workingStoreId;

    @JsonProperty
    private Set<UUID> storeId = new HashSet<>();
}
