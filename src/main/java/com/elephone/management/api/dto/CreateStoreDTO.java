package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import lombok.*;
import lombok.extern.jackson.Jacksonized;

import javax.persistence.Column;
import javax.validation.constraints.*;
import java.util.UUID;

@Data
@Builder
@Jacksonized
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class CreateStoreDTO {

    private UUID id;

    @Pattern(regexp = "[\\d]{10}", message = "Invalid contact number.")
    private String contact;

    @NotNull(message = "Name can't be null.")
    private String name;

    @Pattern(regexp = "[\\d]{10}", message = "Invalid ABN.")
    private String abn;

    @Min(value = 0, message = "warranty time should be more than 0")
    private Integer warranty;

    @NotNull(message = "Address can't be null.")
    private String address;

    @NotNull(message = "Suburb can't be null.")
    private String suburb;

    @NotNull(message = "State can't be null.")
    private String state;

    @NotNull(message = "Postcode can't be null.")
    private String postcode;

    @Email(message = "Email not valid.")
    @NotNull(message = "Email can't be null.")
    private String email;
}
