package com.fiserv.automation.api.util;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.HmacAlgorithms;
import org.apache.commons.codec.digest.HmacUtils;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("api")
public class Hmac {
    public String apiKey;
    public String apiSecret;
    public String requestId;
    public String clientChannelId;

    public String getApiKey() {
        return apiKey;
    }

    public void setApiKey(String apiKey) {
        this.apiKey = apiKey;
    }

    public String getApiSecret() {
        return apiSecret;
    }

    public void setApiSecret(String apiSecret) {
        this.apiSecret = apiSecret;
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public String getClientChannelId() {
        return clientChannelId;
    }

    public void setClientChannelId(String clientChannelId) {
        this.clientChannelId = clientChannelId;
    }

    public String generateHMAC(String messageToSign) {
        byte[] result = new HmacUtils(HmacAlgorithms.HMAC_SHA_256, apiSecret).
                hmac(messageToSign);
        return Base64.encodeBase64String(result);
    }
}
