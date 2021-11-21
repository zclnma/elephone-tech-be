package com.elephone.management.modules.oss;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@ConfigurationProperties(prefix = "oss")
@Component
public class OssProperties {

    private String endpoint;

    private String customDomain;

    private Boolean pathStyleAccess = true;

    private String appId;

    private String region;

    private String accessKey;

    private String secretKey;

    private String bucketName = "payerp";
}
