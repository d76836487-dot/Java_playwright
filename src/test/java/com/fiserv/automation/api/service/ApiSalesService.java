package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.SalesSummaryDto;
import com.fiserv.automation.api.rest.BwaSales;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;

@Component
public class ApiSalesService {
    @Autowired
    BrowserLocalStorage browserLocalStorage;

    @Autowired
    BwaSales bwaSales;

    @Autowired
    private ApiUserDetailsService apiUserDetailsService;

    public BigDecimal getTotalSalesReceivables() throws Exception {
        String apiAccessToken = browserLocalStorage.getApiAccessToken();
        List<String> ecs = apiUserDetailsService.getEcs();

        List<SalesSummaryDto> salesSummaryDtos = bwaSales.getReceivableSalesSummarized(apiAccessToken, ecs).sumarizacao;

        return salesSummaryDtos.stream()
                .map(pay -> pay.valorLiquidoParcela)
                .reduce(BigDecimal::add)
                .orElse(new BigDecimal(0));
    }
}
