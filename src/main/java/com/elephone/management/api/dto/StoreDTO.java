package com.elephone.management.api.dto;

import com.elephone.management.domain.EnumStoreRole;
import com.elephone.management.domain.StoreLocation;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.jackson.Jacksonized;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Set;
import java.util.UUID;

@Data
@Jacksonized
@Builder
@JsonIgnoreProperties(ignoreUnknown = true)
public class StoreDTO {

    private UUID id;

    private UUID cognitoId;

    @Pattern(regexp = "(\\+61|0)[0-9]{9}", message = "Invalid contact number.")
    private String contact;

    private String name;

    private EnumStoreRole role;

    @Pattern(regexp = "[0-9]{10}", message = "Invalid abn number.")
    private String abn;

    @NotBlank(message = "Sequence cannot be empty.")
    private String sequence;

    private Integer warranty;

    @NotNull(message = "Store location cannot be null.")
    private StoreLocation storeLocation;

    private Set<UUID> employeeIds;
}
