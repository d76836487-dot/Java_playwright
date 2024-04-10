package com.fiserv.qabrazil.steps.sales;

import com.fiserv.automation.api.dto.SaleAuthorizationDto;
import com.fiserv.automation.api.dto.WeeklyScheduleDto;
import com.fiserv.automation.api.service.ApiSalesService;
import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.qabrazil.dto.SalesDtoPage;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.components.FilterComponentPage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.fiserv.qabrazil.pages.sales.SalesTodayPage;
import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.Identifier;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.testng.AssertJUnit.*;

public class SalesTodayApiSteps extends BaseSteps {
    private static final Logger log = LoggerFactory.getLogger(SalesTodayApiSteps.class);

    @Autowired
    CommonsPage commonsPage;

    @Autowired
    private ApiSalesService apiSalesService;
    
    @Autowired
    private FilterComponentPage filterComponentPage;

    @Autowired
    private ApiUserDetailsService apiUserDetailsService;

    @Autowired
    private SalesTodayPage salesTodayPage;

    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    @Then("Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API")
    public void qtySalesSameApi() throws Exception {
        WeeklyScheduleDto dto = apiSalesService.getTotalSalesToday().get(0);
        log.info(dto.toString());

        PageField qtySalesId = pageField.from("Vendas Hoje - Resumo - Quantidade Vendas");
        PageField valueSalesId = pageField.from("Vendas Hoje - Resumo - Valor Vendas");
        String qtySales = qtySalesId.getAsText();
        Currency valueSales = valueSalesId.getAsCurrency();

        assertEquals("Valor de vendas não é igual a API", dto.getGrossValues(), valueSales.doubleValue(), 0.001);
        assertEquals("Quantidade de vendas não é igual a API", String.valueOf(dto.getOccurrences()), qtySales);
    }

    @Given("Usuário abriu a opção {string} no filtro de Vendas Hoje")
    public void userOpenedAccordion(String accordionName) {
        filterComponentPage.openAccordion(accordionName);
    }

    @Then("Opções do filtro corresponderão aos ECs da API")
    public void matchOptionsWithApi() throws Exception {
        List<String> ecs = apiUserDetailsService.getEcs().stream()
                .sorted()
                .toList();
        String testId = Identifier.from("Filter - Estabelecimentos (0)").testId();
        List<String> allTestIds = commonsPage.getAllDataTestIds(testId);

        List<String> ecNumber = allTestIds.stream()
                .map(id -> id.replaceAll("\\D", ""))
                .sorted()
                .toList();
        assertEquals("ECs do filtro não são iguais a API", ecs, ecNumber);
    }

    @Then("Primeira página do histórico de venda hoje serão equivalentes com a API")
    public void firstPageIsEquivalentToApi() throws Exception {
        List<SalesDtoPage> firstPageSalesTodayPage = salesTodayPage.getSalesAsDto();
        HashSet<SaleAuthorizationDto> hashSalesTodayApi = apiSalesService.getFirstSalesToday();
        List<SaleAuthorizationDto> salesTodayApi = apiSalesService.limitSales(hashSalesTodayApi, firstPageSalesTodayPage.size());

        log.info("*Unique* sales/authorizations from api: total {}", hashSalesTodayApi.size());
        for(SaleAuthorizationDto dto: hashSalesTodayApi) {
            log.info(dto.toString());
        }

        for(SalesDtoPage dtoPage: firstPageSalesTodayPage) {
            assertTrue("Venda hoje não retornada pela api: %s".formatted(dtoPage),
                    salesTodayApi.stream()
                            .anyMatch(dtoPage::compareToDtoApi));
        }

        if (!salesTodayApi.isEmpty() && firstPageSalesTodayPage.isEmpty()) {
            fail("A API trouxe %d vendas, e a página zero".formatted(salesTodayApi.size()));
        }
    }

    @Then("Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API do EC selecionado")
    public void qtySalesSameApiSelectedEc() throws Exception {
        WeeklyScheduleDto dto = apiSalesService.getTotalSalesTodayEc(selectECOrDtcoPage.getSelectedEcs()).get(0);
        log.info(dto.toString());

        PageField qtySalesId = pageField.from("Vendas Hoje - Resumo - Quantidade Vendas");
        PageField valueSalesId = pageField.from("Vendas Hoje - Resumo - Valor Vendas");
        String qtySales = qtySalesId.getAsText();
        Currency valueSales = valueSalesId.getAsCurrency();

        assertEquals("Valor de vendas não é igual a API", dto.getGrossValues(), valueSales.doubleValue(), 0.001);
        assertEquals("Quantidade de vendas não é igual a API", String.valueOf(dto.getOccurrences()), qtySales);
    }

    @Then("Opções do filtro tem somente os ECs selecionados")
    public void filterOptions() throws Exception {
        String[] expectedEcs = selectECOrDtcoPage.getSelectedEcs()
                .toArray(new String[0]);
        String[] actualEcs = filterComponentPage
                .getEcsAvailableForFilter("Filtros de relatório - Item Estabelecimentos")
                .toArray(new String[0]);

        assertThat(actualEcs).containsExactlyInAnyOrder(expectedEcs);
    }
}
