package com.fiserv.qabrazil.steps.sales;

import com.fiserv.automation.api.dto.WeeklyScheduleDto;
import com.fiserv.automation.api.service.ApiSalesService;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.testng.AssertJUnit.assertEquals;

public class SalesHistoryApiSteps extends BaseSteps {
    @Autowired
    private ApiSalesService apiSalesService;

    List<WeeklyScheduleDto> weeklyScheduleDtos = null;

    @Then("Valor bruto será igual a API")
    public void grossSalesSameYesterday() throws Exception {
        List<WeeklyScheduleDto> weeklyScheduleDtos = getTotalSalesYesterday();
        double grossSales = pageField.from("Vendas - Histórico Vendas - Valor Bruto Total").getAsCurrency().doubleValue();
        assertEquals("Valor bruto de vendas não é igual a API",
                weeklyScheduleDtos.get(0).grossValues, grossSales, 0.001);
    }

    @Then("Valor líquido será igual a API")
    public void netSalesSameYesterday() throws Exception {
        List<WeeklyScheduleDto> weeklyScheduleDtos = getTotalSalesYesterday();
        double netSales = pageField.from("Vendas - Histórico Vendas - Valor Líquido Total").getAsCurrency().doubleValue();
        assertEquals("Valor líquido de vendas não é igual a API",
                weeklyScheduleDtos.get(0).netValues, netSales, 0.001);
    }

    @Then("Total de vendas será igual a API")
    public void qtySalesSameYesterday() throws Exception {
        List<WeeklyScheduleDto> weeklyScheduleDtos = getTotalSalesYesterday();
        String qtySales = pageField.from("Vendas - Histórico Vendas - Total de vendas").getAsText();
        assertEquals("Total de vendas de vendas não é igual a API",
                String.valueOf(weeklyScheduleDtos.get(0).occurrences), qtySales);
    }

    private List<WeeklyScheduleDto> getTotalSalesYesterday() throws Exception {
        if (weeklyScheduleDtos == null) {
            weeklyScheduleDtos = apiSalesService.getTotalSalesYesterday();
        }

        return weeklyScheduleDtos;
    }
}
