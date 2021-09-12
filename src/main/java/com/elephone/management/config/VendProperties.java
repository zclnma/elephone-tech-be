package com.elephone.management.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author wupeng
 * @version 1.0
 * @date 2021/9/1 11:19
 */
@Data
@Component
@ConfigurationProperties(prefix = "vend")
public class VendProperties {

    private String url;
}
