package com.elephone.management.api.dto;

import com.elephone.management.domain.EnumGender;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import java.util.Set;
import java.util.UUID;

@Data
@Jacksonized
@Builder
@JsonIgnoreProperties(ignoreUnknown = true)
public class EmployeeDTO {

    private UUID id;
    private String firstName;
    private String lastName;
    private EnumGender gender;
    private String birthday;

    @Pattern(regexp = "(\\+61|0)[0-9]{9}", message = "Invalid contact number.")
    private String contact;

    @Email(message = "Email format is not valid")
    private String email;

    private String tfn;
    private UUID workingStoreId;
    private Set<UUID> storeIds;
}
