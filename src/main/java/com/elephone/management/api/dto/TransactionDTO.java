package com.elephone.management.api.dto;

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

    private List<String> inspections;

    private String email;

    private String confSignature;

    private StoreDTO store;

    private EmployeeDTO createdBy;

    private EmployeeDTO finalisedBy;

    private String reference;

    private String status;

    private String additionInfo;

    private List<TransactionProductDTO> products;

    private String deposit;

    private List<CommentDTO> comments;

    private List<WarrantyHistoryDTO> warrantyHistories;

    private Date createdDate;
}
