package com.fiserv.automation.api;

import com.fiserv.automation.api.util.Hmac;
import com.fiserv.qabrazil.config.ContractConfig;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Component
public class BwaAuthorization {
    private static final String API_AUTHENTICATION = "/access-management-api-qa/v1/public/authenticate-api/no-mfa";
    private static final String API_AUTHORIZATION_SUMMARY = "%s/autorizacoes/v2/%s/%s/%s/%s?tipoSumarizacao=D";

    @Autowired
    ContractConfig contractConfig;

    public String getSummarySevenDays(String accessToken, String merchant) throws IOException {
        String sevenDaysAgo = formattedDate(7);
        String today = formattedDate(0);
        String url = String.format(API_AUTHORIZATION_SUMMARY,
                contractConfig.getApiHost(), contractConfig.getInstitution(), merchant, sevenDaysAgo, today);
        long timestamp = new Date().getTime();
        String payload = "";

        RequestBuilder request = RequestBuilder.get(url);
        request.addHeader("Content-Type", "application/json");
        request.addHeader("ServiceContract", contractConfig.getServiceContract()); //"110"
        request.addHeader("InstitutionCod", contractConfig.getInstitution()); //"00000004"
        request.addHeader("Client-Request-Id", Hmac.REQUEST_ID);
        request.addHeader("Api-Key", Hmac.API_KEY);
        request.addHeader("Message-Signature", Hmac.generateHMAC(getMsgToSign(timestamp, payload)));
        request.addHeader("Timestamp", String.valueOf(timestamp));
        request.addHeader("ChannelClientId", Hmac.CLIENT_CHANNEL_ID);
        request.addHeader("auth", accessToken);

        HttpUriRequest patchReq = request.build();
        HttpClient httpclient = HttpClients.createDefault();

        HttpResponse response2 = httpclient.execute(patchReq);
        System.out.println("Response Code : " + response2.getStatusLine().getStatusCode() + " " + response2.getStatusLine().getReasonPhrase());
        System.out.println(response2.toString());

        BufferedReader rd = null;
        StringBuffer result = new StringBuffer();
        String line = "";
        rd = new BufferedReader(new InputStreamReader(response2.getEntity().getContent()));
        while ((line = rd.readLine()) != null) {
            line = line.replaceAll(",", " ,\n");
            System.out.println(line);
            result.append(line);
        }

        return result.toString();
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
