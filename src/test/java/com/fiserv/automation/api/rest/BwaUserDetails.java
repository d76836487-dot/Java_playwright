package com.fiserv.automation.api.rest;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fiserv.automation.api.dto.UserDetailDto;
import com.fiserv.automation.api.util.Hmac;
import com.fiserv.qabrazil.config.ContractConfig;
import okhttp3.OkHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.jackson.JacksonConverterFactory;

import java.util.Date;

@Component
public class BwaUserDetails {
    @Autowired
    ContractConfig contractConfig;

    public UserDetailDto getUserDetails(String accessToken) throws Exception {
        long timestamp = new Date().getTime();

        OkHttpClient.Builder httpClient = new OkHttpClient.Builder();
        httpClient.addInterceptor(chain -> {
            okhttp3.Request request = chain.request().newBuilder()
                    .addHeader("Content-Type", "application/json")
                    .addHeader("ServiceContract", contractConfig.getServiceContract())
                    .addHeader("InstitutionCod", contractConfig.getInstitution())
                    .addHeader("Client-Request-Id", Hmac.REQUEST_ID)
                    .addHeader("Api-Key", Hmac.API_KEY)
                    .addHeader("Message-Signature", Hmac.generateHMAC(getMsgToSign(timestamp)))
                    .addHeader("Timestamp", String.valueOf(timestamp))
                    .addHeader("ChannelClientId", Hmac.CLIENT_CHANNEL_ID)
                    .addHeader("Authorization", accessToken)
                    .build();

            return chain.proceed(request);
        });

        Retrofit retrofit = new Retrofit.Builder()
                .addConverterFactory(JacksonConverterFactory.create(new ObjectMapper()
                        .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)))
                .baseUrl(contractConfig.getApiHost())
                .client(httpClient.build())
                .build();

        BwaRest bwaSomething = retrofit.create(BwaRest.class);
        Response<UserDetailDto> execute = bwaSomething.userDetail().execute();
        if (execute.code() != 200) {
            throw new Exception(
                    String.format("Erro ao obter detalhes do usuário %s: %s", execute.code(), execute.message()));
        }
        return execute.body();
    }

    private String getMsgToSign(long timestamp) {
        return Hmac.API_KEY + Hmac.REQUEST_ID + timestamp;
    }
}
