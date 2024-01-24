package com.fiserv.qabrazil.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ContractConfig {
    @Value("${contract_url}")
    public String site;

    @Value("${contract_user}")
    public String user;

    @Value("${contract_password}")
    public String password;

    @Value("${contract_identity}")
    public String identity;
}
