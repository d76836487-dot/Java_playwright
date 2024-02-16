package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.PageRealizedSalesDto;
import com.fiserv.automation.api.dto.PageReceivableDto;
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

    public PageReceivableDto getReceivableSalesSummarizedNextMonth(String apiAccessToken, List<String> ecs) throws Exception {
        String oneDayAhead = formattedDate(1);
        String thirdDaysAhead = formattedDate(30);

        return getReceivableSalesSummarized(apiAccessToken, ecs, oneDayAhead, thirdDaysAhead);
    }

    public PageReceivableDto getReceivableSalesSummarized(String apiAccessToken, List<String> ecs, String initialDate, String finalDate) throws Exception {
        Map<String, String> extraHeaderInfo = Map.of(
                "instituicao", contractConfig.getInstitution(),
                "estabelecimento", ecs.get(0)
        );

        ReceivableSalesSummarizedRequestDto request = new ReceivableSalesSummarizedRequestDto(ecs);
        BwaRest bwaRest = BwaHeader.getBwaRequest(apiAccessToken, extraHeaderInfo);

        Response<PageReceivableDto> execute = bwaRest.receivableSalesSummarized(initialDate, finalDate, request).execute();

        if (execute.code() == 404) {
            return new PageReceivableDto();
        }

        if (execute.code() != 200) {
            String errorBody = "";
            if (execute.errorBody() != null) {
                errorBody = execute.errorBody().string();
            }
            throw new Exception(
                    String.format("Erro ao obter autorizações %s: %s. Merchant: %s. ErrorBody: %s",
                            execute.code(), execute.message(), ecs, errorBody));
        }

        return execute.body();
    }

    public PageRealizedSalesDto getRealizedSalesSummarized(String apiAccessToken, List<String> ecs, String initialDate, String finalDate) throws Exception {
        Map<String, String> extraHeaderInfo = Map.of(
                "instituicao", contractConfig.getInstitution(),
                "estabelecimento", ecs.get(0)
        );

        ReceivableSalesSummarizedRequestDto request = new ReceivableSalesSummarizedRequestDto(ecs);
        BwaRest bwaRest = BwaHeader.getBwaRequest(apiAccessToken, extraHeaderInfo);

        Response<PageRealizedSalesDto> execute = bwaRest.realizedSalesSummarized(initialDate, finalDate, request).execute();

        if (execute.code() == 404) {
            return new PageRealizedSalesDto();
        }

        if (execute.code() != 200) {
            String errorBody = "";
            if (execute.errorBody() != null) {
                errorBody = execute.errorBody().string();
            }
            throw new Exception(
                    String.format("Erro ao obter autorizações %s: %s. Merchant: %s. ErrorBody: %s",
                            execute.code(), execute.message(), ecs, errorBody));
        }

        return execute.body();
    }
}
