package com.elephone.management.api;

import com.elephone.management.api.dto.*;
import com.elephone.management.api.mapper.TransactionStatusGroupMapper;
import com.elephone.management.api.mapper.TransactionStatusMapper;
import com.elephone.management.domain.TransactionStatus;
import com.elephone.management.domain.TransactionStatusGroup;
import com.elephone.management.service.TransactionStatusGroupService;
import com.elephone.management.service.TransactionStatusService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

@RestController
@RequestMapping("/api/v1/transaction-status")
@Api(tags = "Transaction status management")
@PreAuthorize("hasAnyAuthority('OWNER')")
public class TransactionStatusResource {
    private final TransactionStatusMapper transactionStatusMapper;
    private final TransactionStatusGroupMapper transactionStatusGroupMapper;
    private final TransactionStatusService transactionStatusService;
    private final TransactionStatusGroupService transactionStatusGroupService;

    @Autowired
    public TransactionStatusResource(TransactionStatusMapper transactionStatusMapper, TransactionStatusGroupMapper transactionStatusGroupMapper, TransactionStatusService transactionStatusService, TransactionStatusGroupService transactionStatusGroupService) {
        this.transactionStatusMapper = transactionStatusMapper;
        this.transactionStatusGroupMapper = transactionStatusGroupMapper;
        this.transactionStatusService = transactionStatusService;
        this.transactionStatusGroupService = transactionStatusGroupService;
    }

    @PostMapping
    @ApiOperation(value = "create transaction status", notes = "create transaction status")
    public ResponseEntity<TransactionStatusDTO> createStatus(@Valid @RequestBody CreateTransactionStatusDTO createTransactionStatusDTO) {
        TransactionStatus transactionStatus = transactionStatusService.create(createTransactionStatusDTO);
        return new ResponseEntity<>(transactionStatusMapper.toDTO(transactionStatus), HttpStatus.OK);
    }

    @PostMapping("/group")
    @ApiOperation(value = "create transaction status group", notes = "create transaction status group")
    public ResponseEntity<TransactionStatusGroupDTO> createStatusGroup(@Valid @RequestBody TransactionStatusGroupDTO transactionStatusGroupDTO) {
        TransactionStatusGroup transactionStatusGroup = transactionStatusGroupService.create(transactionStatusGroupMapper.fromDTO(transactionStatusGroupDTO));
        return new ResponseEntity<>(transactionStatusGroupMapper.toDTO(transactionStatusGroup), HttpStatus.OK);
    }

    @PutMapping
    @ApiOperation(value = "update transaction status", notes = "update transaction status")
    public ResponseEntity<TransactionStatusDTO> updateStatus(@Valid @RequestBody CreateTransactionStatusDTO createTransactionStatusDTO) {
        TransactionStatus transactionStatus = transactionStatusService.update(createTransactionStatusDTO);
        return new ResponseEntity<>(transactionStatusMapper.toDTO(transactionStatus), HttpStatus.OK);
    }

    @PutMapping("/group")
    @ApiOperation(value = "update transaction status group", notes = "update transaction status group")
    public ResponseEntity<TransactionStatusGroupDTO> updateStatusGroup(@Valid @RequestBody TransactionStatusGroupDTO transactionStatusGroupDTO) {
        TransactionStatusGroup transactionStatusGroup = transactionStatusGroupService.update(transactionStatusGroupMapper.fromDTO(transactionStatusGroupDTO));
        return new ResponseEntity<>(transactionStatusGroupMapper.toDTO(transactionStatusGroup), HttpStatus.OK);
    }
}
