package com.elephone.management.api;

import com.elephone.management.api.dto.CommentDTO;
import com.elephone.management.api.dto.StoreDTO;
import com.elephone.management.api.dto.TransactionDTO;
import com.elephone.management.api.mapper.CommentDTOMapper;
import com.elephone.management.api.mapper.TransactionDTOMapper;
import com.elephone.management.domain.*;
import com.elephone.management.service.CommentService;
import com.elephone.management.service.TransactionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/transaction")
@Api(tags = "Transaction management")
public class TransactionResource {

    private TransactionDTOMapper transactionDTOMapper;
    private TransactionService transactionService;
    private CommentService commentService;
    private CommentDTOMapper commentDTOMapper;

    @Autowired
    public TransactionResource(TransactionService transactionService, TransactionDTOMapper transactionDTOMapper, CommentService commentService, CommentDTOMapper commentDTOMapper) {
        this.transactionDTOMapper = transactionDTOMapper;
        this.transactionService = transactionService;
        this.commentDTOMapper = commentDTOMapper;
        this.commentService = commentService;
    }

    @PostMapping
    @ApiOperation(value = "create transaction", notes = "create transaction")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<TransactionDTO> create(@Valid @RequestBody TransactionDTO transactionDTO) {
        Transaction transaction = transactionService.create(transactionDTOMapper.fromDTO(transactionDTO));
        return new ResponseEntity<>(transactionDTOMapper.toDTO(transaction), HttpStatus.OK);
    }

    @GetMapping
    @ApiOperation(value = "list transactions", notes = "list transactions")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<List<TransactionDTO>> list(
            @ApiParam(name = "page", defaultValue = "0") @RequestParam( name = "page", defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam( name = "perPage", defaultValue = "10") int perPage,
            @ApiParam(name = "isFinalised", defaultValue = "false") @RequestParam(name = "isFinalised", defaultValue = "false") boolean isFinalised,
            @ApiParam(name = "transactionNumber") @RequestParam(name = "transactionNumber", required = false) String transactionNumber,
            @ApiParam(name = "customerName") @RequestParam(name = "customerName", required = false) String customerName,
            @ApiParam(name = "contact") @RequestParam(name = "contact", required = false) String contact,
            @ApiParam(name = "storeId") @RequestParam(name = "storeId", required = false) String storeId
    ) {
        Page<Transaction> transactions;

        if(StringUtils.isEmpty(storeId)) {
            transactions = transactionService.listTransactions(page, perPage, isFinalised, transactionNumber, customerName, contact);
        } else {
            transactions = transactionService.listTransactions(page, perPage, isFinalised, transactionNumber, customerName, contact, storeId);
        }

        List<TransactionDTO> dtoTransactions = transactions.stream().map(transactionDTOMapper::toDTO).collect(Collectors.toList());
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Count", Long.toString(transactions.getTotalElements()));
        return new ResponseEntity<>(dtoTransactions, headers, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "get transaction by id", notes = "get transaction by id")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<TransactionDTO> getById(@PathVariable UUID id) {
        Transaction transaction = transactionService.getTransactionById(id);
        return new ResponseEntity<>(transactionDTOMapper.toDTO(transaction), HttpStatus.OK);
    }

    @PutMapping("/{id}/status")
    @ApiOperation(value = "update transaction status", notes = "update transaction status")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<TransactionDTO> updateStatus (@PathVariable UUID id, @Valid @RequestBody TransactionStatus transactionStatus) {
         Transaction transaction = transactionService.updateTransactionStatus(id, transactionStatus.getStatus());
         return new ResponseEntity<>(transactionDTOMapper.toDTO(transaction), HttpStatus.OK);
    }

    @PutMapping("/{id}/finalise")
    @ApiOperation(value = "update transaction status", notes = "update transaction status")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<TransactionDTO> finalise (@PathVariable UUID id, @Valid @RequestBody TransactionFinalise transactionFinalise) {
        Transaction transaction = transactionService.finaliseTransaction(id, transactionFinalise.getFinalisedBy());
        return new ResponseEntity<>(transactionDTOMapper.toDTO(transaction), HttpStatus.OK);
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
    public ResponseEntity<CommentDTO> create (@Valid @RequestBody CommentDTO commentDTO) {
        Comment comment = commentService.createComment(commentDTOMapper.fromDTO(commentDTO));
        return new ResponseEntity<>(commentDTOMapper.toDTO(comment), HttpStatus.CREATED);
    }

    @PutMapping("/comment")
    @ApiOperation(value = "Update comment", notes = "Update comment")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<CommentDTO> update (@Valid @RequestBody CommentDTO commentDTO) {
        Comment comment = commentService.updateComment(commentDTOMapper.fromDTO(commentDTO));
        return new ResponseEntity<>(commentDTOMapper.toDTO(comment), HttpStatus.OK);
    }

    @DeleteMapping("/comment/{id}")
    @ApiOperation(value = "Delete comment by id", notes = "Delete comment")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<?> delete (@PathVariable UUID id) {
        commentService.deleteCommentById(id);
        return new ResponseEntity<>(new HashMap<String, String>() {{
            put("message", "Comment: " + id + " has been deleed");
        }}, HttpStatus.ACCEPTED);
    }

}
