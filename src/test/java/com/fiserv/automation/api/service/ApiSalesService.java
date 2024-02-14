package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.SalesSummaryDto;
import com.fiserv.automation.api.dto.WeeklyScheduleDto;
import com.fiserv.automation.api.rest.BwaSales;
import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.fiserv.automation.api.util.DateUtil.convertDateFromPageToLocale;
import static com.fiserv.automation.api.util.DateUtil.dateAndMonth;

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

    public List<WeeklyScheduleDto> getTotalSalesThisWeek() throws Exception {
        if (getDaysUntilFriday() == 0) return Collections.emptyList();

        String apiAccessToken = browserLocalStorage.getApiAccessToken();
        List<String> ecs = apiUserDetailsService.getEcs();

        String tomorrow = DateUtil.formattedDate(1);
        String friday = DateUtil.formattedDate(getDaysUntilFriday());

        List<SalesSummaryDto> salesSummaryDtos = bwaSales.getSalesSummarized(apiAccessToken, ecs, tomorrow, friday).sumarizacao;

        Map<String, List<SalesSummaryDto>> groupByDay = salesSummaryDtos.stream()
                .collect(Collectors.groupingBy(SalesSummaryDto::getData));


        return groupByDay.entrySet().stream()
                .map(this::createNewDailySchedule)
                .toList();
    }

    private WeeklyScheduleDto createNewDailySchedule(Map.Entry<String, List<SalesSummaryDto>> dailyPayment)  {
        String paymentDate = dailyPayment.getKey();
        double totalPayment = dailyPayment.getValue().stream()
                .mapToDouble(SalesSummaryDto::getValorLiquidoParcela)
                .sum();
        String[] weekDayMonth = dateAndMonth(convertDateFromPageToLocale(paymentDate));

        return new WeeklyScheduleDto(
                paymentDate.substring(6, 8),
                weekDayMonth[1], weekDayMonth[0], totalPayment, dailyPayment.getValue().size());
    }

    private int getDaysUntilFriday() {
        return 5 - (LocalDate.now().getDayOfWeek().getValue());
    }
}
