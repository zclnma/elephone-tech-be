package com.elephone.management.api.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class TransactionFinaliseDTO {
    UUID finalisedBy;
}
