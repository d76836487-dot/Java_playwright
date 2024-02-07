package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.PagedPaymentDto;
import com.fiserv.automation.api.dto.PaymentSummaryDto;
import com.fiserv.automation.api.rest.BwaPayment;
import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;

@Component
public class ApiReceivableService {
    @Autowired
    BrowserLocalStorage browserLocalStorage;

    @Autowired
    BwaPayment bwaReceivable;

    @Autowired
    private ApiUserDetailsService apiUserDetailsService;

    public BigDecimal getPaymentToday() throws Exception {
        String apiAccessToken = browserLocalStorage.getApiAccessToken();
        List<String> ecs = apiUserDetailsService.getEcs();

        List<PaymentSummaryDto> payments = ecs.parallelStream()
                .flatMap(ec -> getPaymentSummarized(ec, apiAccessToken).sumarizacao.stream())
                .toList();

        String today = DateUtil.formattedDate(0);
        return payments.stream()
                .filter(pay -> pay.dataEfetivaPgto.equals(today))
                .map(pay -> pay.pagamentoLiquidoTotal)
                .reduce(BigDecimal::add)
                .orElse(new BigDecimal(0));
    }

    private PagedPaymentDto getPaymentSummarized(String ec, String apiAccessToken)  {
        try {
            return bwaReceivable.getPaymentSummarized(apiAccessToken, ec);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
