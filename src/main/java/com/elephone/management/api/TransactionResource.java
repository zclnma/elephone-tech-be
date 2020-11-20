package com.elephone.management.api;

import com.elephone.management.api.dto.*;
import com.elephone.management.api.mapper.CommentMapper;
import com.elephone.management.api.mapper.TransactionMapper;
import com.elephone.management.domain.*;
import com.elephone.management.service.CommentService;
import com.elephone.management.service.TransactionService;
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

    @Autowired
    public TransactionResource(TransactionService transactionService, CommentService commentService, CommentMapper commentMapper, TransactionMapper transactionMapper) {
        this.transactionMapper = transactionMapper;
        this.transactionService = transactionService;
        this.commentMapper = commentMapper;
        this.commentService = commentService;
    }

    @PostMapping
    @ApiOperation(value = "create transaction", notes = "create transaction")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<TransactionDTO> create(@Valid @RequestBody TransactionDTO transactionDTO) {
        Transaction transaction = transactionService.create(transactionMapper.fromDTO(transactionDTO));
        return new ResponseEntity<>(transactionMapper.toDTO(transaction), HttpStatus.OK);
    }

    @GetMapping
    @ApiOperation(value = "list transactions", notes = "list transactions")
    public ResponseEntity<List<TransactionDTO>> list(
            @ApiParam(name = "page", defaultValue = "0") @RequestParam(name = "page", defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam(name = "perPage", defaultValue = "10") int perPage,
            @ApiParam(name = "storeId") @RequestParam(name = "storeId", required = false) String storeId,
            @ApiParam(name = "isFinalised", defaultValue = "false") @RequestParam(name = "isFinalised", defaultValue = "false") boolean isFinalised,
            @ApiParam(name = "transactionNumber") @RequestParam(name = "transactionNumber", required = false) String transactionNumber,
            @ApiParam(name = "customerName") @RequestParam(name = "customerName", required = false) String customerName,
            @ApiParam(name = "contact") @RequestParam(name = "contact", required = false) String contact
    ) {
        Page<Transaction> transactions = transactionService.listTransactions(page, perPage, isFinalised, transactionNumber, customerName, contact, storeId);
        List<TransactionDTO> dtoTransactions = transactions.stream().map(transactionMapper::toDTO).collect(Collectors.toList());
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Count", Long.toString(transactions.getTotalElements()));
        return new ResponseEntity<>(dtoTransactions, headers, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "get transaction by id", notes = "get transaction by id")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<TransactionDTO> getById(@PathVariable UUID id) {
        Transaction transaction = transactionService.getTransactionById(id);
        return new ResponseEntity<>(transactionMapper.toDTO(transaction), HttpStatus.OK);
    }

    @PutMapping("/{id}/status/{status}")
    @ApiOperation(value = "update transaction status", notes = "update transaction status")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<TransactionDTO> updateStatus(@PathVariable UUID id, @PathVariable String status) {
        EnumTransactionStatus transactionStatus = EnumTransactionStatus.fromKey(status);
        Transaction transaction = transactionService.updateTransactionStatus(id, transactionStatus);
        return new ResponseEntity<>(transactionMapper.toDTO(transaction), HttpStatus.OK);
    }

    @PutMapping("/{id}/finalise")
    @ApiOperation(value = "update transaction status", notes = "update transaction status")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<TransactionDTO> finalise(@PathVariable UUID id, @Valid @RequestBody TransactionFinaliseDTO transactionFinaliseDTO) {
        Transaction transaction = transactionService.finaliseTransaction(id, transactionFinaliseDTO.getFinalisedBy());
        return new ResponseEntity<>(transactionMapper.toDTO(transaction), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "delete transaction", notes = "delete transaction")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<?> deleteById(@PathVariable UUID id) {
        transactionService.deleteTransactionById(id);
        return new ResponseEntity<>(new HashMap<String, String>() {{
            put("message", "Transaction: " + id + " has been deleted");
        }}, HttpStatus.ACCEPTED);
    }

    @PostMapping("/comment")
    @ApiOperation(value = "Create comment", notes = "Create comment")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<CommentDTO> create(@Valid @RequestBody CreateCommentDTO createCommentDTO) {
        Comment comment = commentService.createComment(createCommentDTO);
        return new ResponseEntity<>(commentMapper.toDTO(comment), HttpStatus.CREATED);
    }

    @PutMapping("/comment")
    @ApiOperation(value = "Update comment", notes = "Update comment")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<CommentDTO> update(@Valid @RequestBody CreateCommentDTO createCommentDTO) {
        Comment comment = commentService.updateComment(createCommentDTO);
        return new ResponseEntity<>(commentMapper.toDTO(comment), HttpStatus.OK);
    }

    @DeleteMapping("/comment/{id}")
    @ApiOperation(value = "Delete comment by id", notes = "Delete comment")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<?> delete(@PathVariable UUID id) {
        commentService.deleteCommentById(id);
        return new ResponseEntity<>(new HashMap<String, String>() {{
            put("message", "Comment: " + id + " has been deleted");
        }}, HttpStatus.ACCEPTED);
    }


}
