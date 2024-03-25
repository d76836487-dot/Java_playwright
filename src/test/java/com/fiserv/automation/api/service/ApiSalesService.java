package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.*;
import com.fiserv.automation.api.rest.BwaAuthorization;
import com.fiserv.automation.api.rest.BwaSales;
import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.jetbrains.annotations.NotNull;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static com.fiserv.automation.api.util.DateUtil.convertDateFromPageToLocale;
import static com.fiserv.automation.api.util.DateUtil.dateAndMonth;

@Component
public class ApiSalesService {
    private static final Logger log = LoggerFactory.getLogger(ApiSalesService.class);

    @Autowired
    BrowserLocalStorage browserLocalStorage;

    @Autowired
    BwaSales bwaSales;

    @Autowired
    private ApiUserDetailsService apiUserDetailsService;

    @Autowired
    private BwaAuthorization bwaAuthorization;


    public List<WeeklyScheduleDto> getTotalSalesToday() throws Exception {
        String today = DateUtil.formattedDate(0);
        return getTotalSales(today);
    }

    public List<WeeklyScheduleDto> getTotalSalesYesterday() throws Exception {
        String today = DateUtil.formattedDate(-1);
        return getTotalSales(today);
    }

    public HashSet<SaleAuthorizationDto> getFirstSalesToday() throws Exception {
        String apiAccessToken = browserLocalStorage.getApiAccessToken();
        List<String> ecs = apiUserDetailsService.getEcs();

        String today = DateUtil.formattedDate(0);
        List<SaleAuthorizationDto> sales = bwaSales.getRealizedSales(apiAccessToken, ecs, today, today).vendas.stream()
                .map(SaleAuthorizationDto::new)
                .toList();

        List<SaleAuthorizationDto> authorizations = ecs.stream()
                .flatMap(ec -> getAuthorizationsToday(apiAccessToken, ec).stream())
                .map(SaleAuthorizationDto::new)
                .toList();

        List<SaleAuthorizationDto> salesAuthorizations = Stream.concat(sales.stream(), authorizations.stream()).toList();

        log.info("*All* sales/authorizations from api: total {}", salesAuthorizations.size());
        for(SaleAuthorizationDto s: salesAuthorizations) {
            log.info(s.toString());
        }
        return new HashSet<>(salesAuthorizations);
    }

    private List<AuthorizationsDto> getAuthorizationsToday(String apiAccessToken, String ec) {
        try {
            return bwaAuthorization.getAuthorizationsToday(apiAccessToken, ec).autorizacoes;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<SaleAuthorizationDto> limitSales(HashSet<SaleAuthorizationDto> sales, int numOfSales) {
        if (sales.size() <= numOfSales) return sales.stream().toList();

        List<LocalDateTime> firstDateTime = sales.stream()
                .sorted(Comparator.comparing(o -> o.dataHora))
                .toList()
                .subList(sales.size() - numOfSales, sales.size()).stream()
                .map(SaleAuthorizationDto::getDataHora)
                .toList();

        return sales.stream()
                .filter(dto -> firstDateTime.contains((dto.getDataHora())))
                .toList();
    }

    @NotNull
    private List<WeeklyScheduleDto> getTotalSales(String today) throws Exception {
        List<WeeklyScheduleDto> dto = getTotalRealizedSales(today, today);

        if (dto.isEmpty()) return List.of(WeeklyScheduleDto.NULL);

        return dto;
    }

    private List<WeeklyScheduleDto> getTotalRealizedSales(String initialDate, String endDate) throws Exception {
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
