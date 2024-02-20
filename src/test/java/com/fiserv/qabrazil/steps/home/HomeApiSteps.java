package com.fiserv.qabrazil.steps.home;

import com.fiserv.automation.api.dto.AuthorizationsDto;
import com.fiserv.automation.api.dto.WeeklyScheduleDto;
import com.fiserv.automation.api.service.ApiAuthorizationsService;
import com.fiserv.automation.api.service.ApiPaymentsService;
import com.fiserv.automation.api.service.ApiReceivablesService;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.Identifier;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import static com.fiserv.automation.api.util.DateUtil.convertDateFromPageToDateApi;
import static com.fiserv.automation.api.util.DateUtil.convertTimeFromPageToDateApi;
import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class HomeApiSteps {
    @Autowired
    private CommonsPage commonsPage;
    @Autowired
    private ApiAuthorizationsService apiAuthorizationsService;
    @Autowired
    private ApiPaymentsService apiPaymentsService;
    @Autowired
    private ApiReceivablesService apiReceivablesService;

    @Then("'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API")
    public void lastSalesMatchApi() throws Exception {
        List<AuthorizationsDto> lastSalesApi = apiAuthorizationsService.getValueLastSales();
        List<AuthorizationsDto> lastSalesPage = getLastSalesAsDto();

        boolean allSalesInPageMatchApi = lastSalesPage.stream()
                .allMatch(dto -> lastSalesApi.stream()
                        .anyMatch(dto::equals));

        String message = String.format("Valor das últimas vendas da página é diferente da api.\n Esperado: %s\n retornado %s",
                lastSalesApi, lastSalesPage);
        assertTrue(message, allSalesInPageMatchApi);
    }

    private List<AuthorizationsDto> getLastSalesAsDto() {
        String saleTypesId = TestIdsConfig.getTestId("Home - Card Últimas Vendas - Tipo");
        String saleValuesId = TestIdsConfig.getTestId("Home - Card Últimas Vendas - Valor");
        String saleDateId = TestIdsConfig.getTestId("Home - Card Últimas Vendas - Data");
        String saleTimeId = TestIdsConfig.getTestId("Home - Card Últimas Vendas - Hora");

        List<String> salesTypes = commonsPage.getAllTextsFromElement(saleTypesId);
        List<Number> salesValues = commonsPage.getAllNumbersFromCurrencyElement(saleValuesId);
        List<String> saleDate = commonsPage.getAllTextsFromElement(saleDateId);
        List<String> saleTime = commonsPage.getAllTextsFromElement(saleTimeId);

        List<AuthorizationsDto> lastSalesPage = new ArrayList<>();
        for(int i = 0; i < salesTypes.size(); i++) {
            AuthorizationsDto dto = new AuthorizationsDto()
                    .setTipoAutorizacao(salesTypes.get(i))
                    .setValorTransacao(String.valueOf(salesValues.get(i)))
                    .setData(convertDateFromPageToDateApi(saleDate.get(i)))
                    .setHora(convertTimeFromPageToDateApi(saleTime.get(i)));
            lastSalesPage.add(dto);
        }

        return lastSalesPage;
    }

    @Then("Total de 'Home - Recebimentos - Recebimentos hoje' será igual à API")
    public void comparePaymentApi() throws Exception {
        BigDecimal todayPaymentApi = apiPaymentsService.getPaymentToday();
        Currency todayPaymentPage = PageField.from("Home - Card Recebimento - Recebimento Hoje").getAsCurrency();

        assertEquals("Total de recebíveis hoje da página é diferente da api", todayPaymentApi.doubleValue(), todayPaymentPage.doubleValue(), 0.001);
    }

    @Then("Total de 'Home - Card Recebimento - Recebimento Previsto' será igual à API")
    public void compareReceivableApi() throws Exception {
        BigDecimal receivableApi = apiReceivablesService.getTotalSalesReceivables();
        Currency receivablePage = PageField.from("Home - Card Recebimento - Recebimento Previsto").getAsCurrency();

        assertEquals("Total de recebíveis futuros da página é diferente da api", receivableApi.doubleValue(), receivablePage.doubleValue(), 0.001);
    }

    @Then("Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API")
    public void compareTotalSalesPageAndApi() throws Exception {
        Number salesTodayApi = apiAuthorizationsService.getGrossSalesTodayAllEcs();
        Number salesTodayPage = PageField.from("Home - Card Vendas Hoje - Valor Vendas Hoje").getAsCurrency().doubleValue();

        assertEquals("Total de vendas da página é diferente da api", salesTodayApi, salesTodayPage);
    }

    @Then("'Home - Card agenda semana' será igual a API")
    public void compareWeeklyScheduleWithApi() throws Exception {
        List<WeeklyScheduleDto> weeklySchedule = getScheduleThisWeek();

        compareValueAndDepositsForOneDay("Segunda", weeklySchedule);
        compareValueAndDepositsForOneDay("Terça", weeklySchedule);
        compareValueAndDepositsForOneDay("Quarta", weeklySchedule);
        compareValueAndDepositsForOneDay("Quinta", weeklySchedule);
        compareValueAndDepositsForOneDay("Sexta", weeklySchedule);
    }

    private void compareValueAndDepositsForOneDay(String weekDay, List<WeeklyScheduleDto> weeklySchedule) {
        String dayPage = commonsPage.getTextFromElement(
                Identifier.from("Home - Agenda Recebimento - Dia " + weekDay));
        Number valuePage = PageField.from("Home - Agenda Recebimento - Valor " + weekDay).getAsCurrency().doubleValue();
        int qtyDepositsPage = getQtyDeposits(weekDay);
        Number valueApi = getValueForDay(weeklySchedule, dayPage);
        int qtyDepositsApi = getQuantityDepositsForDay(weeklySchedule, dayPage);

        assertEquals("Os valores de recebimento da agenda semanal não é igual para %s".formatted(weekDay),
                valueApi.doubleValue(), valuePage.doubleValue(), 0.001);
        assertEquals("O número de depósitos da agenda semanal não é igual para %s".formatted(weekDay),
                qtyDepositsApi, qtyDepositsPage);
    }

    private int getQtyDeposits(String weekDay) {
        Identifier identifier = Identifier.from("Home - Agenda Recebimento - Qtd Depósitos " + weekDay);
        String qtyDepositsPageId = identifier.testId();
        if (!commonsPage.elementIsVisibleNoWait(qtyDepositsPageId)) return 0;
        return Integer.parseInt(
                    commonsPage.getTextFromElement(identifier).replaceAll("\\D", ""));
    }

    private Number getValueForDay(List<WeeklyScheduleDto> weeklySchedule, String dayPage) {
        return weeklySchedule.stream()
                .filter(weeklyScheduleDto -> weeklyScheduleDto.monthDay.equals(dayPage))
                .mapToDouble(WeeklyScheduleDto::getGrossValues)
                .sum();
    }

    private int getQuantityDepositsForDay(List<WeeklyScheduleDto> weeklySchedule, String dayPage) {
        return weeklySchedule.stream()
                .filter(weeklyScheduleDto -> weeklyScheduleDto.monthDay.equals(dayPage))
                .mapToInt(WeeklyScheduleDto::getOccurrences)
                .sum();
    }

    private List<WeeklyScheduleDto> getScheduleThisWeek() throws Exception {
        List<WeeklyScheduleDto> payments = apiPaymentsService.getPaymentMondayUntilToday();
        List<WeeklyScheduleDto> sales = apiReceivablesService.getTotalReceivableSalesUntilEndOfWeek();
        for (WeeklyScheduleDto payment : payments) {
            System.out.println(payment);
        }
        for (WeeklyScheduleDto sale : sales) {
            System.out.println(sale);
        }

        return Stream.concat(payments.stream(),sales.stream()).toList();
    }
}
