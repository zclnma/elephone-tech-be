package com.elephone.management.service;

import com.elephone.management.data.EnumEmailType;
import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Transaction;
import org.apache.commons.text.StringSubstitutor;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.annotation.Resources;
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

    private static final String AUTH_TEMPLATE_PATH = "/templates/authorisation.html";
    private static final String CONF_TEMPLATE_PATH = "/templates/confirmation.html";
    private static final String AUTH_FILE_NAME = "Authorisation.pdf";
    private static final String CONF_FILE_NAME = "Confirmation.pdf";
    private static final String AUTH_SUBJECT = "Elephone Repair Authorisation";
    private static final String CONF_SUBJECT = "Elephone Repair Confirmation";


    private SesService sesService;

    @Autowired
    public EmailService(SesService sesService) {
        this.sesService = sesService;
    }

    public MimeMessage generateConfEmail(Transaction transaction) throws Exception {
        String from = transaction.getStore().getEmail();
        String to = transaction.getEmail();
        Resource resource = new ClassPathResource(CONF_TEMPLATE_PATH);
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
        mimeMessage.setSubject(CONF_SUBJECT, "UTF-8");
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

        PdfService pdfService = new PdfService(placeholder, CONF_FILE_NAME);
        attachment.attachFile(pdfService.getGeneratedPDF());
        attachment.setFileName(pdfService.getPdfName());
        message.addBodyPart(attachment);
        return mimeMessage;
    }

    public MimeMessage generateAuthEmail(Transaction transaction) throws Exception {
        String from = transaction.getStore().getEmail();
        String to = transaction.getEmail();
        Resource resource = new ClassPathResource(AUTH_TEMPLATE_PATH);
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
        mimeMessage.setSubject(AUTH_SUBJECT, "UTF-8");
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

        //Transaction form
        placeholder.put("customerName", transaction.getCustomerName());
        placeholder.put("customerContact", transaction.getContact());
        placeholder.put("customerEmail", transaction.getEmail());
        placeholder.put("pickupTime", transaction.getPickupTime());
        placeholder.put("device", transaction.getDevice());
        placeholder.put("color", transaction.getColor());
        placeholder.put("imei", transaction.getImei());
        placeholder.put("passcode", transaction.getPasscode());
        placeholder.put("issue", transaction.getIssue());
        placeholder.put("resolution", transaction.getResolution());
        placeholder.put("condition", transaction.getCondition());
        placeholder.put("battery", transaction.getBattery());
        placeholder.put("additionalInfo", transaction.getAdditionInfo());
//        placeholder.put("signature", transaction.getSignature());
        placeholder.put("reference", transaction.getReference());
        placeholder.put("date", transaction.getCreatedDate().toString());

        //Store info
        placeholder.put("storeContact", transaction.getStore().getContact());
        placeholder.put("storeEmail", transaction.getStore().getEmail());
        placeholder.put("storeName", transaction.getStore().getName());
        placeholder.put("storeAddress", transaction.getStore().getAddress());
        placeholder.put("storeSuburb", transaction.getStore().getSuburb());
        placeholder.put("storeState", transaction.getStore().getState());
        placeholder.put("storePostcode", transaction.getStore().getPostcode());
        placeholder.put("storeState", transaction.getStore().getState());
        placeholder.put("storeWarranty", transaction.getStore().getWarranty().toString());
        placeholder.put("storeAbn", transaction.getStore().getAbn());

        PdfService pdfService = new PdfService(placeholder, AUTH_FILE_NAME);
        attachment.attachFile(pdfService.getGeneratedPDF());
        attachment.setFileName(pdfService.getPdfName());
        message.addBodyPart(attachment);
        return mimeMessage;
    }

    @Async
    public void sendEmail(Transaction transaction, EnumEmailType type) {

        Boolean isVerified = sesService.getEmailIdentity(transaction.getStore().getEmail());
        if (!isVerified) {
            throw new IllegalArgumentException("Please login in to the store email to verify address first.");
        }

        String from = transaction.getStore().getEmail();
        String to = transaction.getEmail();

        try {
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            MimeMessage mimeMessage;
            if (type.equals(EnumEmailType.AUTHORISATION)) {
                mimeMessage = generateAuthEmail(transaction);
                mimeMessage.writeTo(outputStream);
            } else if (type.equals(EnumEmailType.CONFIRMATION)) {
                mimeMessage = generateConfEmail(transaction);
                mimeMessage.writeTo(outputStream);
            }
            sesService.sendEmail(from, to, outputStream);
        } catch (Exception ex) {
            throw new StoreException(ex.getMessage());
        }
    }
}
