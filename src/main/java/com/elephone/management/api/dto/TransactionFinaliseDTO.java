package com.elephone.management.api.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
public class TransactionFinaliseDTO {
    UUID finalisedBy;
}
