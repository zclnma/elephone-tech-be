package com.elephone.management.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(new ApiInfo(
                        "Elephone Management System",
                        "This is the elephone management system",
                        "1.0",
                        ApiInfo.DEFAULT.getTermsOfServiceUrl(),
                        ApiInfo.DEFAULT_CONTACT,
                        ApiInfo.DEFAULT.getLicense(),
                        ApiInfo.DEFAULT.getLicenseUrl(),
                        ApiInfo.DEFAULT.getVendorExtensions()))
                .select()
                .apis(RequestHandlerSelectors.any())
                .paths(PathSelectors.any())
                .build();
    }
}
