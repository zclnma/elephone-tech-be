package com.elephone.management.service;

import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

@Service
public class EmailService {

    private static final String EMAIL_SUBJECT = "Elephone Repair Confirmation";
    private static final String CONF_FILE_NAME = "Confirmation.pdf";

    private final SesService sesService;
    private final PdfService pdfService;

    @Autowired
    public EmailService(SesService sesService, PdfService pdfService) {
        this.sesService = sesService;
        this.pdfService = pdfService;
    }

    public MimeMessage generateConfEmail(Transaction transaction) throws Exception {

        String emailContent = TemplateService.generateEmailString(transaction);

        Session session = Session.getDefaultInstance(new Properties());
        MimeMessage mimeMessage = new MimeMessage(session);

        // Add subject, from and to lines.
        mimeMessage.setSubject(EMAIL_SUBJECT, "UTF-8");
        mimeMessage.setFrom(new InternetAddress(transaction.getStore().getEmail()));
        mimeMessage.addRecipients(Message.RecipientType.TO, InternetAddress.parse(transaction.getCustomer().getEmail()));
        mimeMessage.addRecipients(Message.RecipientType.BCC, InternetAddress.parse("info@elephone.com"));

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

        String pdfHtml = TemplateService.generatePdfString(transaction);
        byte[] pdfBytes = pdfService.generatePdfByte(pdfHtml);
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
        helper.addAttachment(CONF_FILE_NAME, new ByteArrayResource(pdfBytes));
        return mimeMessage;
    }

    @Async
    public void sendEmail(Transaction transaction) {

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
            mimeMessage = generateConfEmail(transaction);
            mimeMessage.writeTo(outputStream);
            sesService.sendEmail(from, to, bcc, outputStream);
        } catch (Exception ex) {
            throw new StoreException(ex.getMessage());
        }
    }
}
