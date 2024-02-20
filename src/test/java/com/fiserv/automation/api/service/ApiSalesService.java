package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.*;
import com.fiserv.automation.api.rest.BwaSales;
import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
        return getTotalSales(today);
    }

    public List<WeeklyScheduleDto> getTotalSalesYesterday() throws Exception {
        String today = DateUtil.formattedDate(-1);
        return getTotalSales(today);
    }

    @NotNull
    private List<WeeklyScheduleDto> getTotalSales(String today) throws Exception {
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
        double total = dailyPayment.getValue().stream()
                .mapToDouble(RealizedSaleSummaryDto::getValorTotalPlano)
                .sum();
        double netTotal = dailyPayment.getValue().stream()
                .mapToDouble(RealizedSaleSummaryDto::getValorTotalLiquidoPlano)
                .sum();
        String[] weekDayMonth = dateAndMonth(convertDateFromPageToLocale(paymentDate));
        int occurrences = dailyPayment.getValue().stream()
                .mapToInt(RealizedSaleSummaryDto::getQuantidade)
                .sum();

        return new WeeklyScheduleDto(
                paymentDate.substring(6, 8),
                weekDayMonth[1], weekDayMonth[0], total, netTotal, occurrences);
    }
}
