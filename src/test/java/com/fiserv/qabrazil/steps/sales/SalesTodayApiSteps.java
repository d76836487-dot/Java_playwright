package com.fiserv.qabrazil.steps.sales;

import com.fiserv.automation.api.dto.WeeklyScheduleDto;
import com.fiserv.automation.api.service.ApiSalesService;
import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.FilterComponentPage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.Identifier;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.testng.AssertJUnit.assertEquals;

public class SalesTodayApiSteps {
    @Autowired
    CommonsPage commonsPage;

    @Autowired
    private ApiSalesService apiSalesService;
    
    @Autowired
    private FilterComponentPage filterComponentPage;

    @Autowired
    private ApiUserDetailsService apiUserDetailsService;

    @Then("Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API")
    public void qtySalesSameApi() throws Exception {
        WeeklyScheduleDto dto = apiSalesService.getTotalSalesToday().get(0);
        System.out.println(dto);

        PageField qtySalesId = PageField.from("Vendas Hoje - Resumo - Quantidade Vendas");
        PageField valueSalesId = PageField.from("Vendas Hoje - Resumo - Valor Vendas");
        String qtySales = qtySalesId.getAsText();
        Currency valueSales = valueSalesId.getAsCurrency();

        assertEquals("Valor de vendas não é igual a API", dto.getValues(), valueSales.doubleValue(), 0.001);
        assertEquals("Quantidade de vendas não é igual a API", String.valueOf(dto.getOccurrences()), qtySales);
    }

    @Given("Usuário abriu a opção {string} no filtro de Vendas Hoje")
    public void userOpenedAccordion(String accordionName) {
        filterComponentPage.openAccordion(accordionName);
    }

    @Then("Opções do filtro correspondem aos ECs da API")
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
}
