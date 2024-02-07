package com.fiserv.automation.api.rest;

import com.fiserv.automation.api.dto.PagedPaymentDto;
import com.fiserv.automation.api.util.BwaHeader;
import com.fiserv.qabrazil.config.ContractConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import retrofit2.Response;

import static com.fiserv.automation.api.util.DateUtil.formattedDate;

@Component
public class BwaPayment {
    @Autowired
    ContractConfig contractConfig;

    public PagedPaymentDto getPaymentSummarized(String apiAccessToken, String merchant) throws Exception {
        String sevenDaysAgo = formattedDate(7);
        String today = formattedDate(0);
        BwaRest bwaRest = BwaHeader.getBwaRest(apiAccessToken);

        Response<PagedPaymentDto> execute = bwaRest.paymentSummarized(contractConfig.getInstitution(), merchant, sevenDaysAgo, today).execute();

        if (execute.code() != 200) {
            throw new Exception(
                    String.format("Erro ao obter autorizações %s: %s", execute.code(), execute.message()));
        }

        return execute.body();
    }
}
