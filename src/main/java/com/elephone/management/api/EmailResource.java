package com.elephone.management.api;

import com.elephone.management.api.dto.EmailDTO;
import com.elephone.management.domain.Transaction;
import com.elephone.management.service.EmailService;
import com.elephone.management.service.TransactionService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/email")
public class EmailResource {

    private final TransactionService transactionService;
    private final EmailService emailService;

    @Autowired
    public EmailResource(EmailService emailService, TransactionService transactionService) {
        this.emailService = emailService;
        this.transactionService = transactionService;
    }

    @PostMapping
    @ApiOperation(value = "Send email", notes = "Send email")
    @PreAuthorize("hasAnyAuthority('OWNER','ADMIN','USER')")
    public ResponseEntity<Map<String,String>> sendEmail(@Valid @RequestBody EmailDTO emailDTO) {
        Transaction transaction = transactionService.getTransactionById(emailDTO.getTransactionId());
        emailService.sendEmail(transaction, emailDTO.getType());
        Map<String, String> responseBody = new HashMap<>();
        responseBody.put("message", "Email sent.");
        return new ResponseEntity<>(responseBody, HttpStatus.CREATED);
    }
}
