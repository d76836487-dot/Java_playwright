package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.PrepaymentMessageDto;
import com.fiserv.automation.api.rest.BwaPrepayment;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;

@Component
public class ApiPrepaymentService {
    @Autowired
    BrowserLocalStorage browserLocalStorage;

    @Autowired
    BwaPrepayment bwaPrepayment;

    @Autowired
    private ApiUserDetailsService apiUserDetailsService;

    public BigDecimal getTotalSalesReceivables() throws Exception {
        String apiAccessToken = browserLocalStorage.getApiAccessToken();
        List<String> ecs = apiUserDetailsService.getEcs();

        List<PrepaymentMessageDto> prepaymentMessageDtos = ecs.parallelStream()
                .flatMap(ec -> getPrepayment(apiAccessToken, ec).stream())
                .toList();

        return prepaymentMessageDtos.stream()
                .map(pay -> pay.amount.totalAmount)
                .reduce(BigDecimal::add)
                .orElse(new BigDecimal(0));
    }

    private List<PrepaymentMessageDto> getPrepayment(String apiAccessToken, String ec) {
        try {
            return bwaPrepayment.getPrepayment(apiAccessToken, ec).processMessage;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
