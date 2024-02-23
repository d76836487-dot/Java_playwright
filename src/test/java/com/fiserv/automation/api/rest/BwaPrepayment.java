package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.PrepaymentConsultationRequestDto;
import com.fiserv.automation.api.dto.PrepaymentDto;
import com.fiserv.qabrazil.config.ContractConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Response;

import java.util.List;
import java.util.Map;

@Component
public class BwaPrepayment extends BwaBase {
    private static final String USER_ID = "100350";

    @Autowired
    ContractConfig contractConfig;

    public PrepaymentDto getPrepayment(String apiAccessToken, String ec) throws Exception {
        Map<String, String> extraHeaderInfo = Map.of();
        PrepaymentConsultationRequestDto request = new PrepaymentConsultationRequestDto(List.of(
                new PrepaymentConsultationRequestDto.ItemDto(
                        contractConfig.getInstitution(),
                        ec,
                        USER_ID
                )
        ));
        BwaRest bwaRest = bwaHeader.getBwaRequest(apiAccessToken, extraHeaderInfo);

        Response<PrepaymentDto> execute = bwaRest.prepaymentConsultation(request).execute();

        if (execute.code() != 200) {
            throw new Exception(
                    String.format("Erro ao obter autorizações %s: %s. Merchant: %s",
                            execute.code(), execute.message(), ec));
        }

        return execute.body();
    }
}
