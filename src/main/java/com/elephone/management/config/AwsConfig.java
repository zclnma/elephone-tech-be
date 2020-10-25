package com.elephone.management.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.mail.javamail.JavaMailSender;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.sesv2.SesV2Client;

@Configuration
public class AwsConfig {

    private String LOCAL_PROFILE = "default";

    @Bean
    @Profile("local")
    public SesV2Client sesV2Client(){
        return SesV2Client.builder()
                .region(Region.AP_SOUTHEAST_2)
                .credentialsProvider(
                        ProfileCredentialsProvider
                                .builder()
                                .profileName(LOCAL_PROFILE)
                                .build()

                ).build();
    }

}
