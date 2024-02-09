package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.dto.AuthorizationsDto;
import com.fiserv.automation.api.service.ApiAuthorizationsService;
import com.fiserv.automation.api.service.ApiReceivableService;
import com.fiserv.automation.api.service.ApiSalesService;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.pages.CommonsPage;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

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
    private ApiReceivableService apiReceivableService;
    @Autowired
    private ApiSalesService apiPrepaymentService;

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
        String todayReceivableId = TestIdsConfig.getTestId("Home - Card Recebimento - Recebimento Hoje");

        BigDecimal todayPaymentApi = apiReceivableService.getPaymentToday();
        Number todayPaymentPage = commonsPage.getNumberFromCurrencyElement(todayReceivableId);

        assertEquals("Total de recebíveis hoje da página é diferente da api", todayPaymentApi.doubleValue(), todayPaymentPage.doubleValue(), 0.001);
    }

    @Then("Total de 'Home - Card Recebimento - Recebimento Previsto' será igual à API")
    public void compareReceivableApi() throws Exception {
        String receivablePageId = TestIdsConfig.getTestId("Home - Card Recebimento - Recebimento Previsto");

        BigDecimal receivableApi = apiPrepaymentService.getTotalSalesReceivables();
        Number receivablePage = commonsPage.getNumberFromCurrencyElement(receivablePageId);

        assertEquals("Total de recebíveis futuros da página é diferente da api", receivableApi.doubleValue(), receivablePage.doubleValue(), 0.001);
    }

    @Then("Total de 'Home - Card Vendas Hoje - Valor Vendas Hoje' será igual à API")
    public void compareTotalSalesPageAndApi() throws Exception {
        String testId = TestIdsConfig.getTestId("Home - Card Vendas Hoje - Valor Vendas Hoje");

        Number salesTodayApi = apiAuthorizationsService.getSalesTodayAllEcs();
        Number salesTodayPage = commonsPage.getNumberFromCurrencyElement(testId);

        assertEquals("Total de vendas da página é diferente da api", salesTodayApi, salesTodayPage);
    }
}
