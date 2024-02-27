package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.PagedSummaryDto;
import com.fiserv.qabrazil.config.ContractConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Response;

import java.util.Objects;
import java.util.stream.Stream;

import static com.fiserv.automation.api.util.DateUtil.formattedDate;

@Component
public class BwaAuthorization extends BwaBase {

    @Autowired
    ContractConfig contractConfig;

    public PagedSummaryDto getAuthorizationsHistory(String apiAccessToken, String merchant) throws Exception {
        String sevenDaysAgo = formattedDate(-7);
        String today = formattedDate(0);
        BwaRest bwaRest = bwaHeader.getBwaRequest(apiAccessToken);

        Response<PagedSummaryDto> execute = bwaRest.authorizationsHistory(contractConfig.getActiveUserProfile().institution(), merchant, sevenDaysAgo, today).execute();

        raiseIfGotError(execute, merchant);

        return execute.body();
    }

    public PagedSummaryDto getAuthorizationsToday(String apiAccessToken, String merchant) throws Exception {
        String today = formattedDate(0);
        BwaRest bwaRest = bwaHeader.getBwaRequest(apiAccessToken);

        int page = 1;
        PagedSummaryDto response = new PagedSummaryDto();
        Response<PagedSummaryDto> execute;
        do {
            execute = bwaRest.authorizations(contractConfig.getActiveUserProfile().institution(), merchant, today, today, page).execute();

            if (execute.code() == 404) return PagedSummaryDto.NULL;
            raiseIfGotError(execute, merchant);

            response.autorizacoes = Stream.concat(response.autorizacoes.stream(),
                    Objects.requireNonNull(execute.body()).autorizacoes.stream()).toList();
            page++;
        } while (Objects.requireNonNull(execute.body()).last);

        return response;
    }

    public PagedSummaryDto getSummarySevenDays(String apiAccessToken, String merchant) throws Exception {
        String sevenDaysAgo = formattedDate(-7);
        String today = formattedDate(0);
        BwaRest bwaRest = bwaHeader.getBwaRequest(apiAccessToken);

        Response<PagedSummaryDto> execute = bwaRest.summarization(contractConfig.getActiveUserProfile().institution(), merchant, sevenDaysAgo, today).execute();

        if (execute.code() == 404) return PagedSummaryDto.NULL;
        raiseIfGotError(execute, merchant);

        return execute.body();
    }

    private static void raiseIfGotError(Response<?> execute, String merchant) throws Exception {
        if (execute.code() != 200) {
            String errorBody = Objects.requireNonNull(execute.errorBody()).toString();
            throw new Exception(
                    String.format("Erro em chamada HTTP %s: %s. Merchant: %s. ErrorBody: %s",
                            execute.code(), execute.message(), merchant, errorBody));
        }
    }
}
