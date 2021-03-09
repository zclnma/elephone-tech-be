package com.elephone.management.service;

import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Transaction;
import org.apache.commons.codec.CharEncoding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

@Service
public class EmailService {

    @Value("${spring.profiles.active:default}")
    private String profile;

    private final SesService sesService;
    private final PdfService pdfService;
    private final TemplateService templateService;

    @Autowired
    public EmailService(SesService sesService, PdfService pdfService, TemplateService templateService) {
        this.sesService = sesService;
        this.pdfService = pdfService;
        this.templateService = templateService;
    }

    public MimeMessage generateEmail(Transaction transaction, String type) throws Exception {

        Session session = Session.getDefaultInstance(new Properties());
        MimeMessage mimeMessage = new MimeMessage(session);
        String emailContent = templateService.generateEmailString(transaction, type);

        String pdfHtml = templateService.generatePdfString(transaction, type);
        byte[] pdfBytes = pdfService.generatePdfByte(pdfHtml);
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, CharEncoding.UTF_8);
        helper.setSubject("authorisation".equalsIgnoreCase(type) ? "Elephone Repair Authorisation" : "Elephone Repair Confirmation");
        helper.setFrom(new InternetAddress(transaction.getStore().getEmail()));
        helper.addTo(transaction.getCustomer().getEmail());
        if (!"local".equalsIgnoreCase(profile)) {
            helper.addBcc("info@elephone.com.au");
        }
        helper.setText(emailContent, true);
        helper.addAttachment("authorisation".equalsIgnoreCase(type) ? "Authorisation.pdf" : "Confirmation.pdf", new ByteArrayResource(pdfBytes), "application/pdf");

        return mimeMessage;
    }

    @Async
    public void sendEmail(Transaction transaction, String type) {
        boolean isVerified = sesService.getEmailIdentity(transaction.getStore().getEmail());
        if (!isVerified) {
            throw new IllegalArgumentException("Please login in to the store email to verify address first.");
        }

        String from = transaction.getStore().getEmail();
        String to = transaction.getCustomer().getEmail();
        List<String> bcc = new ArrayList<>(Collections.singletonList("info@elephone.com"));
        try {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            MimeMessage mimeMessage;
            mimeMessage = generateEmail(transaction, type);
            mimeMessage.writeTo(outputStream);
            sesService.sendEmail(from, to, bcc, outputStream);
        } catch (Exception ex) {
            throw new StoreException(ex.getMessage());
        }
    }
}
