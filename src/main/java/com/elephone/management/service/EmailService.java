package com.elephone.management.service;

import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Transaction;
import org.apache.commons.text.StringSubstitutor;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Service
public class EmailService {

    private static final String FILE_NAME = "Confirmation.pdf";
    private static final String SUBJECT = "Elephone Repair Confirmation";

    private TransactionService transactionService;
    private SesService sesService;

    @Autowired
    public EmailService(TransactionService transactionService, SesService sesService) {
        this.transactionService = transactionService;
        this.sesService = sesService;
    }

    public MimeMessage generateEmail(Transaction transaction) throws Exception {
        String from = transaction.getStore().getEmail();
        String to = transaction.getEmail();
        Resource resource = new ClassPathResource("/templates/email.html");
        InputStream inputStream = resource.getInputStream();
        Map<String, String> emailPlaceholder = new HashMap<>();
        emailPlaceholder.put("name", transaction.getCustomerName());
        String emailTemplate = new Scanner(inputStream, StandardCharsets.UTF_8.toString()).useDelimiter("\\A").next();
        StringSubstitutor emailTemplateSub = new StringSubstitutor(
                emailPlaceholder,
                "${",
                "}"
        );
        String emailContent = emailTemplateSub.replace(emailTemplate);

        Session session = Session.getDefaultInstance(new Properties());
        MimeMessage mimeMessage = new MimeMessage(session);

        // Add subject, from and to lines.
        mimeMessage.setSubject(SUBJECT, "UTF-8");
        mimeMessage.setFrom(new InternetAddress(from));
        mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

        // Create a multipart/alternative child container.
        MimeMultipart messageBody = new MimeMultipart("alternative");

        // Define the HTML part.
        MimeBodyPart htmlPart = new MimeBodyPart();
        htmlPart.setContent(emailContent, "text/html; charset=UTF-8");

        // Add the text and HTML parts to the child container.
        messageBody.addBodyPart(htmlPart);

        // Create a wrapper for the HTML and text parts.
        MimeBodyPart wrap = new MimeBodyPart();

        // Add the child container to the wrapper object.
        wrap.setContent(messageBody);

        // Create a multipart/mixed parent container.
        MimeMultipart message = new MimeMultipart("mixed");

        // Add the multipart/alternative part to the message.
        message.addBodyPart(wrap);

        // Add the parent container to the message.
        mimeMessage.setContent(message);

        MimeBodyPart attachment = new MimeBodyPart();

        Map<String, String> placeholder = new HashMap<>();
        placeholder.put("warranty", transaction.getStore().getWarranty().toString());

        PdfService pdfService = new PdfService(placeholder, FILE_NAME);
        attachment.attachFile(pdfService.getGeneratedPDF());
        attachment.setFileName(pdfService.getPdfName());
        message.addBodyPart(attachment);
        return mimeMessage;
    }

    @Async
    public void formAndSend(Transaction transaction) {

        String from = transaction.getStore().getEmail();
        String to = transaction.getEmail();

        try {
            MimeMessage mimeMessage = generateEmail(transaction);
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            mimeMessage.writeTo(outputStream);
            sesService.sendEmail(from, to, outputStream);
        } catch (Exception ex) {
            throw new StoreException(ex.getMessage());
        }
    }

    public void sendEmail(UUID transactionId) {
        Transaction transaction = transactionService.getTransactionById(transactionId);

        Boolean isVerified = sesService.getEmailIdentity(transaction.getStore().getEmail());
        if (!isVerified) {
            throw new IllegalArgumentException("Please login in to the store email to verify address first.");
        }

        formAndSend(transaction);
        return;
    }
}
