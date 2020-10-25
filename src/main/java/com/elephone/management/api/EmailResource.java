package com.elephone.management.api;

import com.elephone.management.service.SesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/email")
public class EmailResource {

    private SesService sesService;

    @Autowired
    public EmailResource(SesService sesService) {
        this.sesService = sesService;
    }

    @GetMapping
    public void sendEmail() {
        String SEND_FROM = "elephonefix@elephoneaus.com";
        String SUBJECT = "Elephone Repair Confirmation";
        String TEST_DESTINATION = "test@elephoneaus.com";
        sesService.sendEmail(SEND_FROM, TEST_DESTINATION, SUBJECT, "Lionel");
    }
}
