package com.elephone.management.api;

import com.elephone.management.api.dto.EmailDTO;
import com.elephone.management.service.SesService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/v1/email")
public class EmailResource {

    private SesService sesService;

    @Autowired
    public EmailResource(SesService sesService) {
        this.sesService = sesService;
    }

    @PostMapping
    @ApiOperation(value = "Send email", notes = "Send email")
    @PreAuthorize("hasAuthority('USER')")
    public void sendEmail(@Valid @RequestBody EmailDTO emailDTO) {

        sesService.sendEmail(emailDTO.getTransactionId());
    }
}
