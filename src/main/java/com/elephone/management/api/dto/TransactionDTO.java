package com.elephone.management.api.dto;

import com.elephone.management.domain.MovePath;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.jackson.Jacksonized;
import org.springframework.data.annotation.CreatedDate;

import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Getter
@Jacksonized
@Builder
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class TransactionDTO {

    private UUID id;

    private String customerName;

    private String contact;

    private String device;

    private String color;

    private String imei;

    private String passcode;

    private String issue;

    private String resolution;

    private String battery;

    private Set<String> initInspections;

    private Set<String> finalInspections;

    private String email;

    private String authSignature;

    private String confSignature;

    private StoreDTO store;

    private EmployeeDTO createdBy;

    private EmployeeDTO finalisedBy;

    private String reference;

    private String status;

    private String additionInfo;

    private Set<TransactionProductDTO> products;

    private Set<MovePathDTO> movePaths;

    private String deposit;

    private Set<CommentDTO> comments;

    private Set<WarrantyHistoryDTO> warrantyHistories;

    private Date createdDate;
}
