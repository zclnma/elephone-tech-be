package com.elephone.management.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.services.sns.SnsClient;
import software.amazon.awssdk.services.sns.model.MessageAttributeValue;
import software.amazon.awssdk.services.sns.model.PublishRequest;
import software.amazon.awssdk.services.sns.model.PublishResponse;

import java.util.HashMap;
import java.util.Map;

@Service
public class SnsService {

    private SnsClient snsClient;

    @Autowired
    public SnsService(SnsClient snsClient) {
        this.snsClient = snsClient;
    }

    public void sendSMSMessage(String phoneNumber, String message) {
        Map<String, MessageAttributeValue> smsAttributes =
                new HashMap<String, MessageAttributeValue>();

        smsAttributes.put("AWS.SNS.SMS.SMSType", MessageAttributeValue.builder()
                .stringValue("Transactional")
                .dataType("String")
                .build());

        PublishResponse response = snsClient.publish(
                PublishRequest.builder()
                        .message(message)
                        .phoneNumber(phoneNumber)
                        .messageAttributes(smsAttributes)
                        .build()
        );
    }
}
