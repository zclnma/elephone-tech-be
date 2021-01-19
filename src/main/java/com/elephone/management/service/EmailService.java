package com.elephone.management.service;

import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Transaction;
import org.apache.commons.text.StringSubstitutor;
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

    private static final String EMAIL_SUBJECT = "Elephone Repair Confirmation";
    private static final String EMAIL_TEMPLATE_PATH = "/templates/email/index.html";
    private static final String CONF_TEMPLATE_PATH = "/templates/attachment.html";
    private static final String CONF_FILE_NAME = "Confirmation.pdf";

    private SesService sesService;

    @Autowired
    public EmailService(SesService sesService) {
        this.sesService = sesService;
    }

    public String generateHTMLFromTemplate(String templatePath, Map<String, String> placeHolder) throws Exception {
        Resource resource = new ClassPathResource(templatePath);
        InputStream inputStream = resource.getInputStream();
        String template = new Scanner(inputStream, StandardCharsets.UTF_8.toString()).useDelimiter("\\A").next();
        StringSubstitutor templateSub = new StringSubstitutor(
                placeHolder,
                "${",
                "}"
        );
        return templateSub.replace(template);
    }

    public MimeMessage generateConfEmail(Transaction transaction) throws Exception {

        Map<String, String> emailPlaceholder = new HashMap<>();

        //Replace ${name} to customer name.
        emailPlaceholder.put("name", transaction.getCustomerName());
        emailPlaceholder.put("storeName", transaction.getStore().getName());
        emailPlaceholder.put("address", transaction.getStore().getAddress());
        emailPlaceholder.put("suburb", transaction.getStore().getSuburb());
        emailPlaceholder.put("state", transaction.getStore().getState());
        emailPlaceholder.put("postcode", transaction.getStore().getPostcode());

        String emailContent = generateHTMLFromTemplate(EMAIL_TEMPLATE_PATH, emailPlaceholder);

        Session session = Session.getDefaultInstance(new Properties());
        MimeMessage mimeMessage = new MimeMessage(session);

        // Add subject, from and to lines.
        mimeMessage.setSubject(EMAIL_SUBJECT, "UTF-8");
        mimeMessage.setFrom(new InternetAddress(transaction.getStore().getEmail()));
        mimeMessage.addRecipients(Message.RecipientType.TO, InternetAddress.parse(transaction.getEmail()));
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

        MimeBodyPart attachment = new MimeBodyPart();

        Map<String, String> pdfPlaceholder = new HashMap<>();

        //Transaction form
        pdfPlaceholder.put("customerName", transaction.getCustomerName());
        pdfPlaceholder.put("customerContact", transaction.getContact());
        pdfPlaceholder.put("customerEmail", transaction.getEmail());
        pdfPlaceholder.put("device", transaction.getDevice());
        pdfPlaceholder.put("color", transaction.getColor());
        pdfPlaceholder.put("imei", transaction.getImei());
        pdfPlaceholder.put("passcode", transaction.getPasscode());
        pdfPlaceholder.put("issue", transaction.getIssue());
        pdfPlaceholder.put("resolution", transaction.getResolution());
        pdfPlaceholder.put("battery", transaction.getBattery());
        pdfPlaceholder.put("additionalInfo", transaction.getAdditionInfo());
        pdfPlaceholder.put("reference", transaction.getReference());
        pdfPlaceholder.put("date", transaction.getCreatedDate().toString());

        //Store info
        pdfPlaceholder.put("storeContact", transaction.getStore().getContact());
        pdfPlaceholder.put("storeEmail", transaction.getStore().getEmail());
        pdfPlaceholder.put("storeName", transaction.getStore().getName());
        pdfPlaceholder.put("storeAddress", transaction.getStore().getAddress());
        pdfPlaceholder.put("storeSuburb", transaction.getStore().getSuburb());
        pdfPlaceholder.put("storeState", transaction.getStore().getState());
        pdfPlaceholder.put("storePostcode", transaction.getStore().getPostcode());
        pdfPlaceholder.put("storeState", transaction.getStore().getState());
        pdfPlaceholder.put("storeWarranty", transaction.getStore().getWarranty().toString());
        pdfPlaceholder.put("storeAbn", transaction.getStore().getAbn());

        String pdfHtml = generateHTMLFromTemplate(CONF_TEMPLATE_PATH, pdfPlaceholder);

        PdfService pdfService = new PdfService(pdfHtml, CONF_FILE_NAME);
        attachment.attachFile(pdfService.getGeneratedPDF());
        attachment.setFileName(CONF_FILE_NAME);
        message.addBodyPart(attachment);
        return mimeMessage;
    }

    @Async
    public void sendEmail(Transaction transaction) {

        Boolean isVerified = sesService.getEmailIdentity(transaction.getStore().getEmail());
        if (!isVerified) {
            throw new IllegalArgumentException("Please login in to the store email to verify address first.");
        }

        String from = transaction.getStore().getEmail();
        String to = transaction.getEmail();
        List<String> bcc = new ArrayList<>(Arrays.asList("info@elephone.com"));
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
