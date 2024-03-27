package com.fiserv.qabrazil.steps.sales;

import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.sales.SalesHistoryPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class SalesHistorySteps extends BasePage {
    @Autowired
    private SalesHistoryPage salesHistoryPage;
    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    private SalesHistoryPage.SalesHistoryExportExcel salesHistoryExportExcel;

    @Given("Usuário acessou Vendas - Histórico de Vendas")
    public void goTo() {
        salesHistoryPage.navigateTo();
    }

    @Then("A exportação do relatório 'Histórico de Vendas' terá somente o EC selecionado")
    public void exportWillHaveOnlySelectedEc() throws IOException {
        salesHistoryExportExcel = salesHistoryPage.getDownloadAsExcel();
        List<String> exportedEcs = salesHistoryExportExcel.getECs();
        boolean allSameEcs = exportedEcs.stream()
                .allMatch(ec -> ec.equals(selectECOrDtcoPage.getSelectedEc()));

        assertTrue("Existem ECS gerados no excel que não são iguais ao selecionado <%s>: <%s>.".formatted(selectECOrDtcoPage.getSelectedEc(), exportedEcs),
                allSameEcs);
    }

    @Then("A soma de todos valores Brutos é igual a \"Vendas Histórico - Valor Bruto\"")
    public void sumGrossValueMatchesScreen() throws IOException, ParseException {
        double sumGrossValue = salesHistoryExportExcel.getSumGrossValues();
        double grossValue = salesHistoryExportExcel.getGrossSales().doubleValue();
        double salesToday = pageField.from("Vendas - Histórico Vendas - Valor Bruto Total").getAsCurrency().doubleValue();

        assertEquals("Valor bruto da tela não é igual à planilha.",
                salesToday, grossValue, 0.001);
        assertEquals("Soma do valor bruto da planilha não é igual à tela.",
                salesToday, sumGrossValue, 0.001);
    }
}
