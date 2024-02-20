package com.fiserv.qabrazil.steps.sales;

import com.fiserv.qabrazil.pages.sales.SalesHistoryPage;
import io.cucumber.java.en.Given;
import org.springframework.beans.factory.annotation.Autowired;

public class SalesHistorySteps {
    @Autowired
    private SalesHistoryPage salesHistoryPage;

    @Given("Usuário acessou Vendas - Histórico de Vendas")
    public void goTo() {
        salesHistoryPage.navigateTo();
    }
}
