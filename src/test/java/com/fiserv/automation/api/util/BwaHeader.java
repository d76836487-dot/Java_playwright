package com.fiserv.automation.api.util;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fiserv.automation.api.rest.BwaRest;
import com.fiserv.qabrazil.config.ContractConfig;
import jakarta.annotation.PostConstruct;
import okhttp3.OkHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Retrofit;
import retrofit2.converter.jackson.JacksonConverterFactory;

import java.util.Date;

@Component
public class BwaHeader {
    @Autowired
    ContractConfig contractConfig;

    private static ContractConfig staticContractConfig;

    @PostConstruct
    public void init() {
        BwaHeader.staticContractConfig = contractConfig;
    }

    public static BwaRest getBwaRest(String apiAccessToken) {
        long timestamp = new Date().getTime();
        String payload = "";

        OkHttpClient.Builder httpClient = new OkHttpClient.Builder();
        httpClient.addInterceptor(chain -> {
            okhttp3.Request request = chain.request().newBuilder()
                    .addHeader("Content-Type", "application/json")
                    .addHeader("ServiceContract", staticContractConfig.getServiceContract())
                    .addHeader("InstitutionCod", staticContractConfig.getInstitution())
                    .addHeader("Client-Request-Id", Hmac.REQUEST_ID)
                    .addHeader("Api-Key", Hmac.API_KEY)
                    .addHeader("Message-Signature", Hmac.generateHMAC(getMsgToSign(timestamp, payload)))
                    .addHeader("Timestamp", String.valueOf(timestamp))
                    .addHeader("ChannelClientId", Hmac.CLIENT_CHANNEL_ID)
                    .addHeader("Authorization", apiAccessToken)
                    .build();

            return chain.proceed(request);
        });

        Retrofit retrofit = new Retrofit.Builder()
                .addConverterFactory(JacksonConverterFactory.create(new ObjectMapper()
                        .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)))
                .baseUrl(staticContractConfig.getApiHost())
                .client(httpClient.build())
                .build();

        return retrofit.create(BwaRest.class);
    }

    private static String getMsgToSign(long timestamp, String payload) {
        return Hmac.API_KEY + Hmac.REQUEST_ID + timestamp + payload;
    }
}
