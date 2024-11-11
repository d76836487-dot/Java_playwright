package com.fiserv.qabrazil.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
@ConfigurationProperties
public class ContractConfig {

    @Value("${spring.profiles.active:}")
    private String activeProfiles;

    private Map<String, ProfileData> userProfiles;

    public Map<String, ProfileData> getUserProfiles() {
        return userProfiles;
    }

    public void setUserProfiles(Map<String, ProfileData> userProfiles) {
        this.userProfiles = userProfiles;
    }

    public String getActiveProfiles() {

        return activeProfiles;
    }

    public ProfileData getActiveUserProfile() {
//
//        activeProfiles = "bin003";
         activeProfiles = "sicredi";
//
       /* return userProfiles.computeIfAbsent(activeProfiles, profile -> {
            if (profile.isEmpty()) {
                throw new IllegalStateException("No profile specified by spring.profiles.active property");
            }
            if (profile.contains(",")) {
                throw new IllegalStateException("Only one profile may be active at a time, but was: " + profile);
            }
            throw new IllegalStateException("No profile found with the following name: " + profile);
        });*/
        return null;
    }

    public record ProfileData(
            String url,
            String user,
            String password,
            String mfaSecretKey,
            String identity,
            String primaryCssClass,
            String institutionTags,
            String clientTags,
            String locale,
            String apiHost,
            String serviceContract,
            String institution,
            String allianceName) {

        public boolean isMaster() {
            return clientTags.contains("@UsuárioComHierarquia");

        }
    }
}
