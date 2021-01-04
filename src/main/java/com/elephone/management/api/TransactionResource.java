package com.elephone.management.api;

import com.elephone.management.api.dto.*;
import com.elephone.management.api.mapper.CommentMapper;
import com.elephone.management.api.mapper.TransactionMapper;
import com.elephone.management.api.mapper.WarrantyHistoryMapper;
import com.elephone.management.domain.*;
import com.elephone.management.service.CommentService;
import com.elephone.management.service.TransactionService;
import com.elephone.management.service.WarrantyHistoryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/transaction")
@Api(tags = "Transaction management")
public class TransactionResource {

    private TransactionMapper transactionMapper;
    private TransactionService transactionService;
    private CommentService commentService;
    private CommentMapper commentMapper;
    private WarrantyHistoryMapper warrantyHistoryMapper;
    private WarrantyHistoryService warrantyHistoryService;

    @Autowired
    public TransactionResource(TransactionService transactionService, CommentService commentService, CommentMapper commentMapper, TransactionMapper transactionMapper, WarrantyHistoryMapper warrantyHistoryMapper, WarrantyHistoryService warrantyHistoryService) {
        this.transactionMapper = transactionMapper;
        this.transactionService = transactionService;
        this.commentMapper = commentMapper;
        this.commentService = commentService;
        this.warrantyHistoryMapper = warrantyHistoryMapper;
        this.warrantyHistoryService = warrantyHistoryService;
    }

    @PostMapping
    @ApiOperation(value = "create transaction", notes = "create transaction")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public ResponseEntity<TransactionDTO> create(@Valid @RequestBody CreateTransactionDTO transactionDTO) {
        Transaction transaction = transactionService.create(transactionDTO);
        return new ResponseEntity<>(transactionMapper.toDTO(transaction), HttpStatus.OK);
    }

    @GetMapping
    @ApiOperation(value = "list transactions", notes = "list transactions")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public ResponseEntity<List<TransactionDTO>> list(
            @ApiParam(name = "page", defaultValue = "0") @RequestParam(name = "page", defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam(name = "perPage", defaultValue = "10") int perPage,
            @ApiParam(name = "storeId") @RequestParam(name = "storeId", required = false) String storeId,
            @ApiParam(name = "status", defaultValue = "false") @RequestParam(name = "status", defaultValue = "false") String status,
            @ApiParam(name = "reference") @RequestParam(name = "reference", required = false) String reference,
            @ApiParam(name = "customerName") @RequestParam(name = "customerName", required = false) String customerName,
            @ApiParam(name = "contact") @RequestParam(name = "contact", required = false) String contact
    ) {
        EnumTransactionStatus transactionStatus = EnumTransactionStatus.fromKey(status);
        Page<Transaction> transactions = transactionService.listTransactions(page, perPage, transactionStatus, reference, customerName, contact, storeId);
        List<TransactionDTO> dtoTransactions = transactions.stream().map(transactionMapper::toDTO).collect(Collectors.toList());
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Count", Long.toString(transactions.getTotalElements()));
        return new ResponseEntity<>(dtoTransactions, headers, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "get transaction by id", notes = "get transaction by id")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public ResponseEntity<TransactionDTO> getById(@PathVariable UUID id) {
        Transaction transaction = transactionService.getTransactionById(id);
        return new ResponseEntity<>(transactionMapper.toDTO(transaction), HttpStatus.OK);
    }

    @PutMapping("/{id}/status")
    @ApiOperation(value = "update transaction status", notes = "update transaction status")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public ResponseEntity<TransactionDTO> updateStatus(@PathVariable UUID id, @Valid @RequestBody UpdateTransactionStatusDTO updateTransactionStatusDTO) {
        EnumTransactionStatus transactionStatus = EnumTransactionStatus.fromKey(updateTransactionStatusDTO.getStatus());
        Transaction transaction = transactionService.updateTransactionStatus(id, updateTransactionStatusDTO.getUpdatedBy(), transactionStatus);
        return new ResponseEntity<>(transactionMapper.toDTO(transaction), HttpStatus.OK);
    }

    @PutMapping("/{id}/move/{storeId}")
    @ApiOperation(value = "move transaction store", notes = "move transaction store")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public ResponseEntity<TransactionDTO> finalise(@PathVariable UUID id, @PathVariable UUID storeId) {
        Transaction transaction = transactionService.moveTransaction(id, storeId);
        return new ResponseEntity<>(transactionMapper.toDTO(transaction), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "delete transaction", notes = "delete transaction")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ResponseEntity<?> deleteById(@PathVariable UUID id) {
        transactionService.deleteTransactionById(id);
        return new ResponseEntity<>(new HashMap<String, String>() {{
            put("message", "Transaction: " + id + " has been deleted");
        }}, HttpStatus.ACCEPTED);
    }

    @PostMapping("/comment")
    @ApiOperation(value = "Create comment", notes = "Create comment")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public ResponseEntity<CommentDTO> createComment(@Valid @RequestBody CreateCommentDTO createCommentDTO) {
        Comment comment = commentService.createComment(createCommentDTO);
        return new ResponseEntity<>(commentMapper.toDTO(comment), HttpStatus.CREATED);
    }

    @PutMapping("/comment")
    @ApiOperation(value = "Update comment", notes = "Update comment")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ResponseEntity<CommentDTO> updateComment(@Valid @RequestBody CreateCommentDTO createCommentDTO) {
        Comment comment = commentService.updateComment(createCommentDTO);
        return new ResponseEntity<>(commentMapper.toDTO(comment), HttpStatus.OK);
    }

    @DeleteMapping("/comment/{id}")
    @ApiOperation(value = "Delete comment by id", notes = "Delete comment")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    public ResponseEntity<?> deleteComment(@PathVariable UUID id) {
        commentService.deleteCommentById(id);
        return new ResponseEntity<>(new HashMap<String, String>() {{
            put("message", "Comment: " + id + " has been deleted");
        }}, HttpStatus.ACCEPTED);
    }

    @PostMapping("/warranty")
    @ApiOperation(value = "Create Warranty History", notes = "Add Warranty History")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public ResponseEntity<WarrantyHistoryDTO> createWarrantyHistory(@Valid @RequestBody CreateWarrantyHistoryDTO createWarrantyHistoryDTO) {
        WarrantyHistory warrantyHistory = warrantyHistoryService.create(createWarrantyHistoryDTO);
        return new ResponseEntity<>(warrantyHistoryMapper.toDTO(warrantyHistory), HttpStatus.CREATED);
    }
}
