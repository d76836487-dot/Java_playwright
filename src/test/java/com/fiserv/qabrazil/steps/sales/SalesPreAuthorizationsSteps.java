package com.fiserv.qabrazil.steps.sales;

import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.sales.SalesPreAuthorizationsPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.List;

import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;
import static org.testng.internal.junit.ArrayAsserts.assertArrayEquals;

public class SalesPreAuthorizationsSteps extends BasePage {
    @Autowired
    SalesPreAuthorizationsPage salesPreAuthorizationsPage;
    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    private SalesPreAuthorizationsPage.SalesPreAuthorizationExportExcel salesPreAuthorizationExportExcel;

    @Given("Usuário acessou Vendas - Pré Autorizações")
    public void goTo() {
        salesPreAuthorizationsPage.navigateTo();
    }

    @Then("A exportação do relatório 'Pré Autorizadas' terá somente o EC selecionado")
    public void exportWillHaveOnlySelectedEc() throws IOException {
        salesPreAuthorizationExportExcel = salesPreAuthorizationsPage.getDownloadAsExcel();
        List<String> exportedEcColumn = salesPreAuthorizationExportExcel.getEcFromColumn();
        List<String> exportedEcCell = salesPreAuthorizationExportExcel.getEcsFromCell();
        boolean allSameEcs = exportedEcColumn.stream()
                .allMatch(ec -> ec.equals(selectECOrDtcoPage.getSelectedEc()));
        String[] uniqueEcsFromColum = exportedEcColumn.stream()
                .distinct()
                .sorted()
                .toList()
                .toArray(new String[0]);
        String[] ecsFromCell = exportedEcCell.stream()
                .filter(m -> !m.isEmpty())
                .sorted()
                .toList()
                .toArray(new String[0]);

        assertTrue("Existem ECS na coluna gerados no excel que não são iguais ao selecionado '%s': '%s'.".formatted(selectECOrDtcoPage.getSelectedEc(), exportedEcColumn),
                allSameEcs);
        assertArrayEquals("Valores da célula com EC é diferente da coluna. Column: '%s', cell: '%s'".formatted(Arrays.toString(uniqueEcsFromColum), Arrays.toString(ecsFromCell)),
                uniqueEcsFromColum, ecsFromCell);
    }

    @Then("A soma de vendas pré-autorizadas é igual ao valor bruto autorizado")
    public void grossValueAuthorizedMatchesScreen() throws IOException, ParseException {
        double sumGross = salesPreAuthorizationExportExcel.getSumGrossAuthorized();
        double gross = salesPreAuthorizationExportExcel.getGrossAuthorized();
        double grossValuePage = pageField.from("Vendas - Pré Autorizações - Valor Bruto Autorizado").getAsCurrency().doubleValue();

        assertEquals("Valor vendas autorizadas da tela não é igual à planilha.",
                grossValuePage, sumGross);
        assertEquals("Valor vendas autorizadas da tela não é igual à contagem da planilha.",
                grossValuePage, gross);
    }

    @Then("A contagem de vendas pré-autorizadas é igual a Total de Vendas")
    public void countMatchesScreen() throws IOException, ParseException {
        long countQuantityPre = salesPreAuthorizationExportExcel.getCountPre();
        long quantityPre = salesPreAuthorizationExportExcel.getCount();
        int quantitySalesFromPage = pageField.from("Vendas - Pré Autorizações - Total Vendas").getAsNumber();

        assertEquals("Quantidade vendas pré-autorizadas da tela não é igual à planilha.",
                quantitySalesFromPage, quantityPre);
        assertEquals("Quantidade vendas pré-autorizadas da tela não é igual à contagem da planilha.",
                quantitySalesFromPage, countQuantityPre);
    }
}
