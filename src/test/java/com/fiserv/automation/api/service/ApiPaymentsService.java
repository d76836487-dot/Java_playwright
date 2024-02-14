package com.fiserv.automation.api.service;

import com.fiserv.automation.api.dto.PagedPaymentDto;
import com.fiserv.automation.api.dto.PaymentSummaryDto;
import com.fiserv.automation.api.dto.WeeklyScheduleDto;
import com.fiserv.automation.api.rest.BwaPayment;
import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.browser.BrowserLocalStorage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

import static com.fiserv.automation.api.util.DateUtil.convertDateFromPageToLocale;
import static com.fiserv.automation.api.util.DateUtil.dateAndMonth;

@Component
public class ApiPaymentsService {
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
                .flatMap(ec -> getPaymentSummarized(apiAccessToken, ec).sumarizacao.stream())
                .toList();

        String today = DateUtil.formattedDate(0);
        return payments.stream()
                .filter(pay -> pay.dataEfetivaPgto.equals(today))
                .map(pay -> pay.pagamentoLiquidoTotal)
                .reduce(BigDecimal::add)
                .orElse(new BigDecimal(0));
    }

    public List<WeeklyScheduleDto> getPaymentMondayUntilToday() throws Exception {
        String apiAccessToken = browserLocalStorage.getApiAccessToken();
        List<String> ecs = apiUserDetailsService.getEcs();

        String monday = DateUtil.formattedDate(getDaysAgoUntilMonday());
        String today = DateUtil.formattedDate(0);

        List<PaymentSummaryDto> payments = ecs.parallelStream()
                .flatMap(ec -> getPayments(apiAccessToken, ec, monday, today).sumarizacao.stream())
                .toList();

        Map<String, List<PaymentSummaryDto>> groupByDay = payments.stream()
                .collect(Collectors.groupingBy(PaymentSummaryDto::getDataEfetivaPgto));

        return groupByDay.entrySet().stream()
                .map(this::createNewDailySchedule)
                .toList();
    }

    private WeeklyScheduleDto createNewDailySchedule(Map.Entry<String, List<PaymentSummaryDto>> dailyPayment)  {
        String paymentDate = dailyPayment.getKey();
        double totalPayment = dailyPayment.getValue().stream()
                .mapToDouble(PaymentSummaryDto::getPagamentoLiquidoTotal)
                .sum();
        String[] weekDayMonth = dateAndMonth(convertDateFromPageToLocale(paymentDate));

        return new WeeklyScheduleDto(
                paymentDate.substring(6, 8),
                weekDayMonth[1], weekDayMonth[0], totalPayment, dailyPayment.getValue().size());
    }

    private PagedPaymentDto getPayments(String apiAccessToken, String ec, String monday, String today) {
        try {
            return bwaReceivable.getPaymentSummarized(apiAccessToken, ec, monday, today);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private int getDaysAgoUntilMonday() {
        return (LocalDate.now().getDayOfWeek().getValue() - 1) * -1;
    }

    private PagedPaymentDto getPaymentSummarized(String apiAccessToken, String ec)  {
        try {
            return bwaReceivable.getPaymentSummarizedToday(apiAccessToken, ec);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
