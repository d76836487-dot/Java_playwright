package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.PageRealizedSalesDto;
import com.fiserv.automation.api.dto.PageReceivableDto;
import com.fiserv.automation.api.dto.ReceivableSalesSummarizedRequestDto;
import com.fiserv.automation.api.util.BwaHeader;
import com.fiserv.qabrazil.config.ContractConfig;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Response;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Stream;

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
        Map<String, String> extraHeaderInfo = getExtraHeaderInfo(ecs);

        ReceivableSalesSummarizedRequestDto request = new ReceivableSalesSummarizedRequestDto(ecs);
        BwaRest bwaRest = BwaHeader.getBwaRequest(apiAccessToken, extraHeaderInfo);

        Response<PageReceivableDto> execute = bwaRest.receivableSalesSummarized(initialDate, finalDate, request).execute();

        if (execute.code() == 404) return PageReceivableDto.NULL;
        raiseIfGotError(execute, ecs);

        return execute.body();
    }

    @NotNull
    private Map<String, String> getExtraHeaderInfo(List<String> ecs) {
        Map<String, String> extraHeaderInfo = Map.of(
                "instituicao", contractConfig.getInstitution(),
                "estabelecimento", ecs.get(0)
        );
        return extraHeaderInfo;
    }

    public PageRealizedSalesDto getRealizedSalesSummarized(String apiAccessToken, List<String> ecs, String initialDate, String finalDate) throws Exception {
        Map<String, String> extraHeaderInfo = getExtraHeaderInfo(ecs);

        ReceivableSalesSummarizedRequestDto request = new ReceivableSalesSummarizedRequestDto(ecs);
        BwaRest bwaRest = BwaHeader.getBwaRequest(apiAccessToken, extraHeaderInfo);

        Response<PageRealizedSalesDto> execute = bwaRest.realizedSalesSummarized(initialDate, finalDate, request).execute();

        if (execute.code() == 404) return PageRealizedSalesDto.NULL;
        raiseIfGotError(execute, ecs);

        return execute.body();
    }

    public PageRealizedSalesDto getRealizedSales(String apiAccessToken, List<String> ecs, String initialDate, String finalDate) throws Exception {
        Map<String, String> extraHeaderInfo = getExtraHeaderInfo(ecs);

        ReceivableSalesSummarizedRequestDto request = new ReceivableSalesSummarizedRequestDto(ecs);
        BwaRest bwaRest = BwaHeader.getBwaRequest(apiAccessToken, extraHeaderInfo);

        int page = 1;
        Response<PageRealizedSalesDto> execute;
        PageRealizedSalesDto response = new PageRealizedSalesDto();
        do {
            execute = bwaRest.realizedSales(initialDate, finalDate, page, request).execute();

            if (execute.code() == 404) return PageRealizedSalesDto.NULL;
            raiseIfGotError(execute, ecs);

            response.vendas = Stream.concat(response.vendas.stream(),
                    Objects.requireNonNull(execute.body()).vendas.stream()).toList();
            page++;
        } while (!Objects.requireNonNull(execute.body()).last);

        return response;
    }

    private static void raiseIfGotError(Response<?> execute, List<String> ecs) throws Exception {
        if (execute.code() != 200) {
            String errorBody = Objects.requireNonNull(execute.errorBody()).toString();
            throw new Exception(
                    String.format("Erro em chamada HTTP %s: %s. Merchant: %s. ErrorBody: %s",
                            execute.code(), execute.message(), ecs, errorBody));
        }
    }
}
