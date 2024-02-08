package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.PageSalesDto;
import com.fiserv.automation.api.dto.ReceivableSalesSummarizedRequestDto;
import com.fiserv.automation.api.util.BwaHeader;
import com.fiserv.qabrazil.config.ContractConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Response;

import java.util.List;
import java.util.Map;

import static com.fiserv.automation.api.util.DateUtil.formattedDate;

@Component
public class BwaSales {
    @Autowired
    ContractConfig contractConfig;

    public PageSalesDto getReceivableSalesSummarized(String apiAccessToken, List<String> merchants) throws Exception {
        String oneDayAhead = formattedDate(1);
        String thirdDaysAhead = formattedDate(30);
        Map<String, String> extraHeaderInfo = Map.of(
                "instituicao", contractConfig.getInstitution(),
                "estabelecimento", merchants.get(0)
        );

        ReceivableSalesSummarizedRequestDto request = new ReceivableSalesSummarizedRequestDto(merchants);
        BwaRest bwaRest = BwaHeader.getBwaRequest(apiAccessToken, extraHeaderInfo);

        Response<PageSalesDto> execute = bwaRest.receivableSalesSummarized(oneDayAhead, thirdDaysAhead, request).execute();

        if (execute.code() != 200) {
            throw new Exception(
                    String.format("Erro ao obter autorizações %s: %s. Merchant: %s",
                            execute.code(), execute.message(), merchants));
        }
        System.out.printf("Rodou para merchant: %s\n", merchants);

        return execute.body();
    }
}
