package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.dto.WeeklyScheduleDto;
import com.fiserv.automation.api.service.ApiSalesService;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.util.Identifier;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertEquals;

public class SalesTodayApiSteps {
    @Autowired
    CommonsPage commonsPage;

    @Autowired
    private ApiSalesService apiSalesService;

    @Then("Total de 'Vendas Hoje - Resumo - Quantidade Vendas' será igual à API")
    public void qtySalesSameApi() throws Exception {
        WeeklyScheduleDto dto = apiSalesService.getTotalSalesToday().get(0);
        System.out.println(dto);

        Identifier qtySalesId = Identifier.from("Vendas Hoje - Resumo - Quantidade Vendas");
        Identifier valueSalesId = Identifier.from("Vendas Hoje - Resumo - Valor Vendas");
        String qtySales = commonsPage.getTextFromElement(qtySalesId);
        Number valueSales = commonsPage.getNumberFromCurrencyElement(valueSalesId);

        assertEquals("Valor de vendas não é igual a API", dto.getValues(), valueSales.doubleValue(), 0.001);
        assertEquals("Quantidade de vendas não é igual a API", String.valueOf(dto.getOccurrences()), qtySales);
    }
}
