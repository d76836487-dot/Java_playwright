package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.*;
import com.fiserv.automation.api.rest.BwaSales;
import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
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


    public List<WeeklyScheduleDto> getTotalSalesToday() throws Exception {
        String today = DateUtil.formattedDate(0);
        List<WeeklyScheduleDto> dto = getTotalRealizedSales(today, today);

        if (dto.isEmpty()) return List.of(WeeklyScheduleDto.NULL);

        return dto;
    }


    public List<WeeklyScheduleDto> getTotalRealizedSales(String initialDate, String endDate) throws Exception {
        String apiAccessToken = browserLocalStorage.getApiAccessToken();
        List<String> ecs = apiUserDetailsService.getEcs();

        List<RealizedSaleSummaryDto> salesDto = getRealizedSalesSummarized(initialDate, endDate, apiAccessToken, ecs);

        Map<String, List<RealizedSaleSummaryDto>> groupByDay = salesDto.stream()
                .collect(Collectors.groupingBy(RealizedSaleSummaryDto::getData));

        return groupByDay.entrySet().stream()
                .map(this::createNewDailyScheduleSales)
                .toList();
    }

    private List<RealizedSaleSummaryDto> getRealizedSalesSummarized(String initialDate, String endDate, String apiAccessToken, List<String> ecs)  {
        try {
            PageRealizedSalesDto paged = bwaSales.getRealizedSalesSummarized(apiAccessToken, ecs, initialDate, endDate);
            return paged.sumarizacao;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private WeeklyScheduleDto createNewDailyScheduleSales(Map.Entry<String, List<RealizedSaleSummaryDto>> dailyPayment)  {
        String paymentDate = dailyPayment.getKey();
        double totalPayment = dailyPayment.getValue().stream()
                .mapToDouble(RealizedSaleSummaryDto::getValorTotalPlano)
                .sum();
        String[] weekDayMonth = dateAndMonth(convertDateFromPageToLocale(paymentDate));

        return new WeeklyScheduleDto(
                paymentDate.substring(6, 8),
                weekDayMonth[1], weekDayMonth[0], totalPayment, 0);
    }
}
