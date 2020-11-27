package com.elephone.management.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.core.SdkBytes;
import software.amazon.awssdk.services.sesv2.SesV2Client;
import software.amazon.awssdk.services.sesv2.model.*;
import java.io.ByteArrayOutputStream;

@Service
public class SesService {

    private SesV2Client sesV2Client;

    @Autowired
    public SesService(SesV2Client sesV2Client) {
        this.sesV2Client = sesV2Client;
    }

    public boolean getEmailIdentity(String emailIdentity){
        GetEmailIdentityRequest request = GetEmailIdentityRequest.builder()
                .emailIdentity(emailIdentity)
                .build();

        GetEmailIdentityResponse response = sesV2Client.getEmailIdentity(request);
        return response.verifiedForSendingStatus();
    }

    public void createEmailIdentity(String emailIdentity) {
        CreateEmailIdentityRequest request = CreateEmailIdentityRequest.builder()
                .emailIdentity(emailIdentity)
                .build();

        sesV2Client.createEmailIdentity(request);
    }

    public void deleteEmailIdentity(String emailIdentity) {
        DeleteEmailIdentityRequest request = DeleteEmailIdentityRequest.builder()
                .emailIdentity(emailIdentity)
                .build();

        sesV2Client.deleteEmailIdentity(request);
    }

    public void sendEmail(String from, String to, ByteArrayOutputStream outputStream) {
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
    }
}
