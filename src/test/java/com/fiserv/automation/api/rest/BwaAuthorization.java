package com.fiserv.automation.api.rest;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fiserv.automation.api.dto.PagedSummaryDto;
import com.fiserv.automation.api.util.Hmac;
import com.fiserv.qabrazil.config.ContractConfig;
import okhttp3.OkHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.jackson.JacksonConverterFactory;

import java.util.Date;

import static com.fiserv.automation.api.util.DateUtil.formattedDate;

@Component
public class BwaAuthorization {

    @Autowired
    ContractConfig contractConfig;

    public PagedSummaryDto getLastAuthorizations(String apiAccessToken, String merchant) throws Exception {
        String sevenDaysAgo = formattedDate(7);
        String today = formattedDate(0);
        BwaRest bwaRest = getBwaRest(apiAccessToken);

        Response<PagedSummaryDto> execute = bwaRest.authorizations(contractConfig.getInstitution(), merchant, sevenDaysAgo, today).execute();

        if (execute.code() != 200) {
            throw new Exception(
                    String.format("Erro ao obter autorizações %s: %s", execute.code(), execute.message()));
        }

        return execute.body();
    }

    public PagedSummaryDto getSummarySevenDays(String apiAccessToken, String merchant) throws Exception {
        String sevenDaysAgo = formattedDate(7);
        String today = formattedDate(0);
        BwaRest bwaRest = getBwaRest(apiAccessToken);

        Response<PagedSummaryDto> execute = bwaRest.summarization(contractConfig.getInstitution(), merchant, sevenDaysAgo, today).execute();

        if (execute.code() != 200) {
            throw new Exception(
                    String.format("Erro ao obter autorizações %s: %s", execute.code(), execute.message()));
        }

        return execute.body();
    }

    private BwaRest getBwaRest(String apiAccessToken) {
        long timestamp = new Date().getTime();
        String payload = "";

        OkHttpClient.Builder httpClient = new OkHttpClient.Builder();
        httpClient.addInterceptor(chain -> {
            okhttp3.Request request = chain.request().newBuilder()
                    .addHeader("Content-Type", "application/json")
                    .addHeader("ServiceContract", contractConfig.getServiceContract())
                    .addHeader("InstitutionCod", contractConfig.getInstitution())
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
                .baseUrl(contractConfig.getApiHost())
                .client(httpClient.build())
                .build();

        return retrofit.create(BwaRest.class);
    }

    private String getMsgToSign(long timestamp, String payload) {
        return Hmac.API_KEY + Hmac.REQUEST_ID + timestamp + payload;
    }

}
