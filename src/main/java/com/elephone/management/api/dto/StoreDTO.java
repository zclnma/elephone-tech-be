package com.elephone.management.api.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.time.LocalDateTime;
import java.util.UUID;

@Getter
@Setter
@Builder
@Jacksonized
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class StoreDTO {

    private UUID id;

    @Pattern(regexp = "[\\d]{10}", message = "Invalid contact number.")
    private String contact;

    @NotBlank(message = "Name can't be empty.")
    private String name;

    @NotBlank(message = "Company Name can't be empty.")
    private String companyName;

    private String abn;

    @Min(value = 0, message = "warranty time should be more than 0")
    private Integer warranty;

    @NotBlank(message = "Address can't be empty.")
    private String address;

    @NotBlank(message = "Suburb can't be empty.")
    private String suburb;

    @NotBlank(message = "State can't be empty.")
    private String state;

    @NotBlank(message = "Postcode can't be empty.")
    private String postcode;

    @Email(message = "Email not valid.")
    @NotBlank(message = "Email can't be empty.")
    private String email;

    private Boolean isDeleted;

    private LocalDateTime deletedAt;
}
