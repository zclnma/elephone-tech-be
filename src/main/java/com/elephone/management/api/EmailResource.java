package com.elephone.management.api;

import com.elephone.management.api.dto.EmailDTO;
import com.elephone.management.api.dto.EmployeeDTO;
import com.elephone.management.service.EmailService;
import com.elephone.management.service.SesService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/v1/email")
public class EmailResource {

    private EmailService emailService;

    @Autowired
    public EmailResource(EmailService emailService) {
        this.emailService = emailService;
    }

    @PostMapping
    @ApiOperation(value = "Send email", notes = "Send email")
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public ResponseEntity<Void> sendEmail(@Valid @RequestBody EmailDTO emailDTO) {
        emailService.sendEmail(emailDTO.getTransactionId());
        return new ResponseEntity<>(null, HttpStatus.CREATED);
    }
}
