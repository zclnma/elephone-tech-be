package com.elephone.management.api;

import com.elephone.management.api.dto.BaseEnumDTO;
import com.elephone.management.domain.EnumGender;
import com.elephone.management.service.TransactionStatusGroupService;
import com.elephone.management.service.TransactionStatusService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/v1/transaction-status")
@Api(tags = "Transaction status management")
@PreAuthorize("hasAnyAuthority('OWNER')")
public class TransactionStatusResource {
    private final TransactionStatusService transactionStatusService;
    private final TransactionStatusGroupService transactionStatusGroupService;

    @Autowired
    public TransactionStatusResource(TransactionStatusService transactionStatusService, TransactionStatusGroupService transactionStatusGroupService) {
        this.transactionStatusService = transactionStatusService;
        this.transactionStatusGroupService = transactionStatusGroupService;
    }


}
