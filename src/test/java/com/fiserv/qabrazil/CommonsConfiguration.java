package com.fiserv.qabrazil;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fiserv.automation.framework.annotations.SingletonScope;
import com.fiserv.automation.framework.service.ClassPathResources;
import com.fiserv.automation.framework.service.Resources;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;

@TestConfiguration
@ComponentScan(basePackages = "com.fiserv.qabrazil")
@ConfigurationPropertiesScan(basePackages = "com.fiserv.qabrazil")
public class CommonsConfiguration {

    @Bean
    @SingletonScope
    public ObjectMapper objectMapper() {
        return new ObjectMapper();
    }

    @Bean
    @SingletonScope
    public Resources resources(ObjectMapper objectMapper) {
        return new ClassPathResources(objectMapper);
    }
}
