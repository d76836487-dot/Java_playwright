package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.PagedPaymentDto;
import com.fiserv.qabrazil.config.ContractConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Response;

import static com.fiserv.automation.api.util.DateUtil.formattedDate;

@Component
public class BwaPayment extends BwaBase {
    private static final Logger log = LoggerFactory.getLogger(BwaPayment.class);

    @Autowired
    ContractConfig contractConfig;

    public PagedPaymentDto getPaymentSummarizedToday(String apiAccessToken, String merchant) throws Exception {
        String today = formattedDate(0);

        return getPaymentSummarized(apiAccessToken, merchant, today, today);
    }

    public PagedPaymentDto getPaymentSummarized(String apiAccessToken, String merchant, String fromDate, String toDate) throws Exception {
        BwaRest bwaRest = bwaHeader.getBwaRequest(apiAccessToken);

        Response<PagedPaymentDto> execute = bwaRest
                .paymentSummarized(contractConfig.getActiveUserProfile().institution(), merchant, fromDate, toDate).execute();

        if (execute.code() == 404) {
            return new PagedPaymentDto();
        }

        if (execute.code() != 200) {
            log.info(execute.headers().toString());
            log.info("Params: merchant <%s>, fromDate <%s>, toDate <%s>".formatted(merchant, fromDate, toDate));
            String errorBody = "";
            if (execute.errorBody() != null) {
                errorBody = execute.errorBody().string();
            }
            throw new Exception(
                    String.format("Erro ao obter autorizações %s: %s - %s", execute.code(), execute.message(), errorBody));
        }

        return execute.body();
    }
}
