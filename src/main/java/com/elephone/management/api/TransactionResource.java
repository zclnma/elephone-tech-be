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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/transaction")
@Api(tags = "Transaction management")
public class TransactionResource {

    private final TransactionMapper transactionMapper;
    private final TransactionService transactionService;
    private final CommentService commentService;
    private final CommentMapper commentMapper;
    private final WarrantyHistoryMapper warrantyHistoryMapper;
    private final WarrantyHistoryService warrantyHistoryService;

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
    public ResponseEntity<TransactionDTO> create(@Valid @RequestBody CreateTransactionDTO transactionDTO) throws Exception{
        Transaction transaction = transactionService.create(transactionDTO);
        return new ResponseEntity<>(transactionMapper.toDTO(transaction), HttpStatus.OK);
    }

    @PutMapping
    @ApiOperation(value = "update transaction", notes = "update transaction")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public ResponseEntity<TransactionDTO> update(@Valid @RequestBody UpdateTransactionDTO updateTransactionDTO) {
        Transaction transaction = transactionService.update(updateTransactionDTO);
        return new ResponseEntity<>(transactionMapper.toDTO(transaction), HttpStatus.OK);
    }

    @GetMapping
    @ApiOperation(value = "list transactions", notes = "list transactions")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public ResponseEntity<List<TransactionDTO>> list(
            @ApiParam(name = "page", defaultValue = "0") @RequestParam(name = "page", defaultValue = "0") int page,
            @ApiParam(name = "perPage", defaultValue = "10") @RequestParam(name = "perPage", defaultValue = "10") int perPage,
            @ApiParam(name = "storeId") @RequestParam(name = "storeId", required = false) String storeId,
            @ApiParam(name = "status") @RequestParam(name = "status", required = false) String status,
            @ApiParam(name = "statusGroup") @RequestParam(name = "statusGroup", required = false) String statusGroup,
            @ApiParam(name = "reference") @RequestParam(name = "reference", required = false) String reference,
            @ApiParam(name = "customerName") @RequestParam(name = "customerName", required = false) String customerName,
            @ApiParam(name = "contact") @RequestParam(name = "contact", required = false) String contact,
            @ApiParam(name = "hasWarranty") @RequestParam(name = "hasWarranty", required = false) Boolean hasWarranty,
            @ApiParam(name = "showCreatedAt") @RequestParam(name = "showCreatedAt", required = false) Boolean showCreatedAt
    ) {

        Page<Transaction> transactions = transactionService.listTransactions(page, perPage, reference, customerName, contact, storeId, hasWarranty, showCreatedAt, status, statusGroup);
        List<TransactionDTO> dtoTransactions = transactions.stream().map(transactionMapper::toDTO).collect(Collectors.toList());
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Count", Long.toString(transactions.getTotalElements()));
        for (TransactionDTO transactionDTO : dtoTransactions){
            String pickupTime = transactionDTO.getPickupTime();
            String warrantyPeriod = transactionDTO.getWarrantyPeriod();
            if (pickupTime != null && !pickupTime.equals("") && !pickupTime.equals("false") && warrantyPeriod != null && !warrantyPeriod.equals("") && !warrantyPeriod.equals("false")){
                String[] warrantyPeriodArr = warrantyPeriod.split(" ");
                long warrantyPeriodDay = Long.valueOf(warrantyPeriodArr[0]);
                try {
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    Date pickupTimeDate = format.parse(pickupTime.replace("/", "-"));
                    long time = pickupTimeDate.getTime(); // 得到指定日期的毫秒数
                    long day = warrantyPeriodDay * 24 * 60 * 60 * 1000; // 要加上的天数转换成毫秒数
                    time += day; // 相加得到新的毫秒数
                    String warrantyExpiryDate = format.format(new Date(time));
                    transactionDTO.setWarrantyExpiryDate(warrantyExpiryDate);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }else{
                transactionDTO.setWarrantyExpiryDate("");
            }
        }
        return new ResponseEntity<>(dtoTransactions, headers, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "get transaction by id", notes = "get transaction by id")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public ResponseEntity<TransactionDTO> getById(@PathVariable UUID id) {
        Transaction transaction = transactionService.getTransactionById(id);
        String pickupTime = transaction.getPickupTime();
        String warrantyPeriod = transaction.getWarrantyPeriod();
        if (pickupTime != null && !pickupTime.equals("") && warrantyPeriod != null && !warrantyPeriod.equals("")){
            String[] warrantyPeriodArr = warrantyPeriod.split(" ");
            long warrantyPeriodDay = Long.valueOf(warrantyPeriodArr[0]);
            try {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                Date pickupTimeDate = format.parse(pickupTime);
                long time = pickupTimeDate.getTime(); // 得到指定日期的毫秒数
                long day = warrantyPeriodDay * 24 * 60 * 60 * 1000l; // 要加上的天数转换成毫秒数
                time += day; // 相加得到新的毫秒数
                String warrantyExpiryDate = format.format(new Date(time));
                transaction.setWarrantyExpiryDate(warrantyExpiryDate);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }else{
            transaction.setWarrantyExpiryDate("");
        }
        return new ResponseEntity<>(transactionMapper.toDTO(transaction), HttpStatus.OK);
    }

    @PutMapping("/{id}/status")
    @ApiOperation(value = "update transaction status", notes = "update transaction status")
    @PreAuthorize("hasAnyAuthority('ADMIN','USER')")
    public ResponseEntity<TransactionDTO> updateStatus(@PathVariable UUID id, @Valid @RequestBody UpdateTransactionStatusDTO updateTransactionStatusDTO) {
        Transaction transaction = transactionService.updateTransactionStatus(id, updateTransactionStatusDTO.getUpdatedBy(), updateTransactionStatusDTO.getStatus());
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
