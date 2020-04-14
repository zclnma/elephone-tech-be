package com.elephone.management.api.dto;

import com.elephone.management.domain.EnumStoreRole;
import com.elephone.management.domain.StoreLocation;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.UUID;

@Data
public class StoreDTO {

    @JsonProperty(value = "id")
    private UUID id;

    @JsonProperty(value = "contact")
    @Pattern(regexp = "(\\+61|0)[0-9]{9}", message = "Invalid contact number.")
    private String contact;

    @JsonProperty(value = "role")
    private EnumStoreRole role;

    @JsonProperty(value = "abn")
    @Pattern(regexp = "[0-9]{10}", message = "Invalid abn number.")
    private String abn;

    @JsonProperty(value = "sequence")
    @NotBlank(message = "Sequence cannot be empty.")
    private String sequence;

    @JsonProperty(value = "warranty")
    private Integer warranty;

    @JsonProperty(value = "storeLocation")
    @NotNull(message = "Store location cannot be null.")
    private StoreLocation storeLocation;

}
