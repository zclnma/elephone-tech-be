package com.elephone.management.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.services.sqs.SqsClient;

@Service
public class SqsService {
    private final SqsClient sqsClient;

    @Autowired
    public SqsService(SqsClient sqsClient) {
        this.sqsClient = sqsClient;
    }


}
