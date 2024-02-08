package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.PrepaymentDto;
import com.fiserv.automation.api.util.BwaHeader;
import com.fiserv.qabrazil.config.ContractConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Response;

import java.util.Map;

@Component
public class BwaPrepayment {
    private static final String USER_ID = "100350";
    @Autowired
    ContractConfig contractConfig;

    public PrepaymentDto getPrepayment(String apiAccessToken, String ec) throws Exception {
        Map<String, String> extraHeaderInfo = Map.of();
        String payload = String.format("{\"consultPrepayments\": [{" +
                "      \"institutionNumber\": \"%s\"," +
                "      \"merchantID\": \"%s\"," +
                "      \"userID\": \"%s\"" +
                "    }]}", contractConfig.getInstitution(), ec, USER_ID);
        BwaRest bwaRest = BwaHeader.getBwaRequest(apiAccessToken, extraHeaderInfo, payload);

        Response<PrepaymentDto> execute = bwaRest.prepaymentConsultation().execute();

        if (execute.code() != 200) {
            throw new Exception(
                    String.format("Erro ao obter autorizações %s: %s. Merchant: %s",
                            execute.code(), execute.message(), ec));
        }

        return execute.body();
    }
}
