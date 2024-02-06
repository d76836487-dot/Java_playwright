package com.fiserv.automation.api;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fiserv.automation.api.util.Hmac;
import com.fiserv.qabrazil.config.ContractConfig;
import okhttp3.OkHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.jackson.JacksonConverterFactory;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Component
public class BwaAuthorization {

    @Autowired
    ContractConfig contractConfig;

    public BwaRest.PagedSummaryDto getSummarySevenDays(String accessToken, String merchant) throws IOException {
        String sevenDaysAgo = formattedDate(7);
        String today = formattedDate(0);
        long timestamp = new Date().getTime();
        String payload = "";

        OkHttpClient.Builder httpClient = new OkHttpClient.Builder();
        httpClient.addInterceptor(chain -> {
            okhttp3.Request request = chain.request().newBuilder()
                    .addHeader("Content-Type", "application/json")
                    .addHeader("ServiceContract", contractConfig.getServiceContract()) //"110"
                    .addHeader("InstitutionCod", contractConfig.getInstitution()) //"00000004"
                    .addHeader("Client-Request-Id", Hmac.REQUEST_ID)
                    .addHeader("Api-Key", Hmac.API_KEY)
                    .addHeader("Message-Signature", Hmac.generateHMAC(getMsgToSign(timestamp, payload)))
                    .addHeader("Timestamp", String.valueOf(timestamp))
                    .addHeader("ChannelClientId", Hmac.CLIENT_CHANNEL_ID)
                    .addHeader("auth", accessToken)
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
        Response<BwaRest.PagedSummaryDto> execute = bwaSomething.summarization(contractConfig.getInstitution(), merchant, sevenDaysAgo, today).execute();
        System.out.println("Response Code : " + execute.code());
        System.out.println("Message: " + execute.message());
        return execute.body();
    }

    private String getMsgToSign(long timestamp, String payload) {
        return Hmac.API_KEY + Hmac.REQUEST_ID + timestamp + payload;
    }

    private String formattedDate(int daysAgo) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, daysAgo * -1);
        SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyyMMdd");
        return simpleFormat.format(cal.getTime());
    }
}
