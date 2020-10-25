package com.elephone.management.service;

import org.apache.commons.text.StringSubstitutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.core.SdkBytes;
import software.amazon.awssdk.services.sesv2.SesV2Client;
import software.amazon.awssdk.services.sesv2.model.SendEmailRequest;
import software.amazon.awssdk.services.sesv2.model.RawMessage;
import software.amazon.awssdk.services.sesv2.model.Destination;
import software.amazon.awssdk.services.sesv2.model.MessageTag;
import software.amazon.awssdk.services.sesv2.model.EmailContent;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Message;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeBodyPart;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Scanner;

@Service
public class SesService {
    private SesV2Client sesV2Client;

    @Autowired
    public SesService(SesV2Client sesV2Client) {
        this.sesV2Client = sesV2Client;
    }

    public void sendEmail(String from, String to, String subject, String name) {

        String fileName = "Confirmation.pdf";

        try {
            Resource resource = new ClassPathResource("/templates/email.html");
            InputStream inputStream = resource.getInputStream();
            Map<String, String> emailPlaceholder = new HashMap<>();
            emailPlaceholder.put("name", name);
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
            mimeMessage.setSubject(subject, "UTF-8");
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
            placeholder.put("warranty", "90");

            PdfService pdfService = new PdfService(placeholder, fileName);
            attachment.attachFile(pdfService.getGeneratedPDF());
            attachment.setFileName(pdfService.getPdfName());
            message.addBodyPart(attachment);

            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            mimeMessage.writeTo(outputStream);

            SendEmailRequest sendEmailRequest = SendEmailRequest.builder()
                    .destination(Destination.builder().toAddresses(to).build())
                    .fromEmailAddress(from)
                    .content(EmailContent
                            .builder()
                            .raw(RawMessage
                                    .builder()
                                    .data(SdkBytes.fromByteArray(outputStream.toByteArray()))
                                    .build())
                            .build())
                    .build();

            sesV2Client.sendEmail(sendEmailRequest);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
