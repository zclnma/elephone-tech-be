package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import lombok.*;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.*;
import java.util.UUID;

@Data
@Builder
@Jacksonized
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class StoreDTO {

    private UUID id;

    @Pattern(regexp = "[\\d]{10}", message = "Invalid contact number.")
    private String contact;

    private String name;

    @Pattern(regexp = "[\\d]{10}", message = "Invalid ABN.")
    private String abn;

    @Pattern(regexp = "[\\d]{2}", message = "store sequece can only be two digit and unique")
    private String sequence;

    @Min(value = 0,message = "warranty time should be more than 0")
    private Integer warranty;

    @NotNull(message = "Address can't be null.")
    private String address;

    @Email(message = "Email not valid.")
    @NotNull(message = "Email can't be null.")
    private String email;
}
