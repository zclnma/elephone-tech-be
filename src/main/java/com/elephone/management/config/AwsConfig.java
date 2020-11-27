package com.elephone.management.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.auth.credentials.*;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.cognitoidentityprovider.CognitoIdentityProviderClient;
import software.amazon.awssdk.services.sesv2.SesV2Client;
import software.amazon.awssdk.services.sqs.SqsClient;
import javax.annotation.PostConstruct;

@Configuration
public class AwsConfig {

    @Value("${cloud.aws.credentials.accessKey}")
    private String accessKeyId;

    @Value("${cloud.aws.credentials.secretKey}")
    private String secretAccessKey;

    private AwsCredentialsProvider awsCredentialsProvider;

    @PostConstruct
    private void init() {
        awsCredentialsProvider = StaticCredentialsProvider.create(AwsBasicCredentials.create(accessKeyId, secretAccessKey));
    }

    @Bean
    public SesV2Client sesV2Client() {
        return SesV2Client.builder()
                .region(Region.AP_SOUTHEAST_2)
                .credentialsProvider(awsCredentialsProvider)
                .build();
    }

    @Bean
    public CognitoIdentityProviderClient cognitoIdentityClient() {
        return CognitoIdentityProviderClient
                .builder()
                .region(Region.AP_SOUTHEAST_2)
                .credentialsProvider(awsCredentialsProvider)
                .build();
    }

    @Bean
    public SqsClient sqsClient() {
        return SqsClient.builder()
                .region(Region.AP_SOUTHEAST_2)
                .credentialsProvider(awsCredentialsProvider)
                .build();
    }
}
