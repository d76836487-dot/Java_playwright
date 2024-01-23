package com.fiserv.qabrazil.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ContractConfig {
    @Value("${contract.url:azulzinha.qa.portaldocliente.fiserv.com}")
    public String site;

    @Value("${contract.user:62716352000103}")
    public String user;

    @Value("${contract.password:Fiserv@1234}")
    public String password;

    @Value("${contract.identity:azulzinha}")
    public String identity;
}
