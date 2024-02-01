package com.fiserv.qabrazil.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "user-profile")
public class ContractConfig {
    private String url;

    private String user;

    private String password;

    private String identity;

    private String institutionTags;

    private String clientTags;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getInstitutionTags() {
        return institutionTags;
    }

    public void setInstitutionTags(String institutionTags) {
        this.institutionTags = institutionTags;
    }

    public String getClientTags() {
        return clientTags;
    }

    public void setClientTags(String clientTags) {
        this.clientTags = clientTags;
    }
}
