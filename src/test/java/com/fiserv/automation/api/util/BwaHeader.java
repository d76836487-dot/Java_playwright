package com.fiserv.automation.api.util;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fiserv.automation.api.rest.BwaRest;
import com.fiserv.qabrazil.config.ContractConfig;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okio.Buffer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Retrofit;
import retrofit2.converter.jackson.JacksonConverterFactory;

import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Map;

@Component
public class BwaHeader {
    @Autowired
    ContractConfig contractConfig;

    public BwaRest getBwaRequest(String apiAccessToken) {
        return getBwaRequest(apiAccessToken, Map.of());
    }

    public BwaRest getBwaRequest(String apiAccessToken, Map<String, String> extraHeaderInfo) {
        long timestamp = new Date().getTime();

        OkHttpClient.Builder httpClient = new OkHttpClient.Builder();
        httpClient.addInterceptor(chain -> {
            Request originalRequest = chain.request();
            RequestBody originalBody = originalRequest.body();
            String payload = "";
            if (originalBody != null) {
                try (Buffer sink = new Buffer()) {
                    originalBody.writeTo(sink);
                    sink.flush();
                    payload = sink.readByteString().string(StandardCharsets.UTF_8);
                }
            }
            Request.Builder requestBuilder = originalRequest.newBuilder()
                    .addHeader("Content-Type", "application/json")
                    .addHeader("ServiceContract", contractConfig.getActiveUserProfile().serviceContract())
                    .addHeader("InstitutionCod", contractConfig.getActiveUserProfile().institution())
                    .addHeader("Client-Request-Id", Hmac.REQUEST_ID)
                    .addHeader("Api-Key", Hmac.API_KEY)
                    .addHeader("Message-Signature", Hmac.generateHMAC(getMsgToSign(timestamp, payload)))
                    .addHeader("Timestamp", String.valueOf(timestamp))
                    .addHeader("ChannelClientId", Hmac.CLIENT_CHANNEL_ID)
                    .addHeader("Authorization", apiAccessToken)
                    .addHeader("auth", apiAccessToken);

            extraHeaderInfo.forEach(requestBuilder::addHeader);

            okhttp3.Request request = requestBuilder.build();

            return chain.proceed(request);
        });

        Retrofit retrofit = new Retrofit.Builder()
                .addConverterFactory(JacksonConverterFactory.create(new ObjectMapper()
                        .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)))
                .baseUrl(contractConfig.getActiveUserProfile().apiHost())
                .client(httpClient.build())
                .build();

        return retrofit.create(BwaRest.class);
    }

    private static String getMsgToSign(long timestamp, String payload) {
        return Hmac.API_KEY + Hmac.REQUEST_ID + timestamp + payload;
    }
}
