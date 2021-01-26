package com.elephone.management.service;

import com.elephone.management.dispose.exception.StoreException;
import com.elephone.management.domain.Transaction;
import com.elephone.management.domain.TransactionProduct;
import org.apache.commons.text.StringSubstitutor;
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

    private static final String EMAIL_SUBJECT = "Elephone Repair Confirmation";
    private static final String EMAIL_TEMPLATE_PATH = "/templates/email/index.html";
    private static final String REPAIR_ESTIMATE_PATH = "/templates/pdf/repairEstimate.html";
    private static final String CONF_TEMPLATE_PATH = "/templates/pdf/index.html";
    private static final String CONF_FILE_NAME = "Confirmation.pdf";

    private final SesService sesService;

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
        emailPlaceholder.put("name", transaction.getCustomer().getName());
        emailPlaceholder.put("storeName", transaction.getStore().getName());
        emailPlaceholder.put("address", transaction.getStore().getAddress());
        emailPlaceholder.put("suburb", transaction.getStore().getSuburb());
        emailPlaceholder.put("state", transaction.getStore().getState());
        emailPlaceholder.put("postcode", transaction.getStore().getPostcode());
        emailPlaceholder.put("contact", transaction.getStore().getContact());

        String emailContent = generateHTMLFromTemplate(EMAIL_TEMPLATE_PATH, emailPlaceholder);

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

        MimeBodyPart attachment = new MimeBodyPart();

        String repairEstimateHtml = "";
        int index = 1;
        int total = 0;
        for (TransactionProduct product : transaction.getProducts()) {
            Map<String, String> repairPlaceholder = new HashMap<>();
            repairPlaceholder.put("index", Integer.toString(index));
            repairPlaceholder.put("number", product.getNumber());
            repairPlaceholder.put("description", product.getDescription());
            repairPlaceholder.put("price", product.getPrice());
            String repairItem = generateHTMLFromTemplate(REPAIR_ESTIMATE_PATH, repairPlaceholder);
            total += Integer.parseInt(product.getPrice());
            repairEstimateHtml += repairItem;
            index += 1;
        }

        String createdBy = transaction.getCreatedBy().getFirstName() + " " +transaction.getCreatedBy().getLastName();

        Map<String, String> pdfPlaceholder = new HashMap<>();

        //Transaction form
        pdfPlaceholder.put("customerName", transaction.getCustomer().getName());
        pdfPlaceholder.put("customerContact", transaction.getCustomer().getContact());
        pdfPlaceholder.put("customerEmail", transaction.getCustomer().getEmail());
        pdfPlaceholder.put("device", transaction.getDevice().getName());
        pdfPlaceholder.put("color", transaction.getDevice().getColor());
        pdfPlaceholder.put("imei", transaction.getDevice().getImei());
        pdfPlaceholder.put("passcode", transaction.getDevice().getPasscode());
        pdfPlaceholder.put("battery", transaction.getBattery());
        pdfPlaceholder.put("reference", transaction.getReference());
        pdfPlaceholder.put("date", transaction.getCreatedDate().toString());
        pdfPlaceholder.put("resolution", transaction.getResolution());
        pdfPlaceholder.put("comment", transaction.getAdditionInfo());
        pdfPlaceholder.put("issue", transaction.getIssue());
        pdfPlaceholder.put("deposit", transaction.getDeposit());
        pdfPlaceholder.put("balance", Integer.toString(total - Integer.parseInt(transaction.getDeposit())));
        pdfPlaceholder.put("total", Integer.toString(total));
        pdfPlaceholder.put("confSignature", transaction.getConfSignature());
        pdfPlaceholder.put("receivedBy", createdBy);
        pdfPlaceholder.put("repairEstimate", repairEstimateHtml);

        //Store info
        pdfPlaceholder.put("storeContact", transaction.getStore().getContact());
        pdfPlaceholder.put("storeEmail", transaction.getStore().getEmail());
        pdfPlaceholder.put("storeName", transaction.getStore().getName());
        pdfPlaceholder.put("storeAddress", transaction.getStore().getAddress());
        pdfPlaceholder.put("storeSuburb", transaction.getStore().getSuburb());
        pdfPlaceholder.put("storeState", transaction.getStore().getState());
        pdfPlaceholder.put("storePostcode", transaction.getStore().getPostcode());
        pdfPlaceholder.put("storeWarranty", transaction.getStore().getWarranty().toString());
        pdfPlaceholder.put("storeAbn", transaction.getStore().getAbn());
        pdfPlaceholder.put("storeCompanyName", transaction.getStore().getCompanyName());

        String pdfHtml = generateHTMLFromTemplate(CONF_TEMPLATE_PATH, pdfPlaceholder);

        PdfService pdfService = new PdfService(pdfHtml, CONF_FILE_NAME);
        attachment.attachFile(pdfService.getGeneratedPDF());
        attachment.setFileName(CONF_FILE_NAME);
        message.addBodyPart(attachment);
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
