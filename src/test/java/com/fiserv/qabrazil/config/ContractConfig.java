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

    private String primaryCssClass;

    private String institutionTags;

    private String clientTags;

    private String locale;

    private String apiHost;

    private String serviceContract;

    private String institution;

    private String allianceName;

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

    public String getPrimaryCssClass() {
        return primaryCssClass;
    }

    public void setPrimaryCssClass(String primaryCssClass) {
        this.primaryCssClass = primaryCssClass;
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

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    public String getApiHost() {
        return apiHost;
    }

    public void setApiHost(String apiHost) {
        this.apiHost = apiHost;
    }

    public String getServiceContract() {
        return serviceContract;
    }

    public void setServiceContract(String serviceContract) {
        this.serviceContract = serviceContract;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getAllianceName() {
        return allianceName;
    }

    public void setAllianceName(String allianceName) {
        this.allianceName = allianceName;
    }
}
