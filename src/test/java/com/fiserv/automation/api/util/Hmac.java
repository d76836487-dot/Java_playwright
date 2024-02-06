package com.fiserv.automation.api.util;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.HmacAlgorithms;
import org.apache.commons.codec.digest.HmacUtils;

public class Hmac {
    public static final String API_KEY = "kaGC9uLpusCBi3BgR8QBAz35gJxIkEST";  // 4500000703
    private static final String API_SECRET = "sU7aBf8bHhQfoeQ8wILCkAjAa23tgJd7KAcUc79ueiN";
    public static final String REQUEST_ID = "857fe690-2ae9-41a9-81a6-a1ceb0777a6d";
    public static final String CLIENT_CHANNEL_ID = "09b609197bb3eb06cd4c42af586c2825451cd2fc";

    public static String generateHMAC(String messageToSign) {
        byte[] result = new HmacUtils(HmacAlgorithms.HMAC_SHA_256, API_SECRET).
                hmac(messageToSign);
        return Base64.encodeBase64String(result);
    }
}
