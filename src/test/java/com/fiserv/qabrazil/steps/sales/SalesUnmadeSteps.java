package com.fiserv.qabrazil.steps.sales;

import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;
import static org.testng.internal.junit.ArrayAsserts.assertArrayEquals;
import com.fiserv.qabrazil.pages.sales.SalesUnmadePage;

public class SalesUnmadeSteps extends BasePage {
    @Autowired
    SalesUnmadePage salesUnmadePage;
    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    private SalesUnmadePage.SalesUnmadeExportExcel salesUnmadeExportExcel;

    @Given("Usuário acessou Vendas - Não Realizadas")
    public void goTo() {
        salesUnmadePage.navigateTo();
    }

    @Then("A exportação do relatório 'Não Efetivadas' terá somente o EC selecionado")
    public void exportWillHaveOnlySelectedEc() throws IOException {
        salesUnmadeExportExcel = salesUnmadePage.getDownloadAsExcel();
        List<String> exportedEcColumn = salesUnmadeExportExcel.getEcFromColumn();
        List<String> exportedEcCell = salesUnmadeExportExcel.getEcsFromCell();
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

    @Then("A soma de vendas recusadas é igual a \"Não Efetivadas - Recusadas\"")
    public void refusedMatchesScreen() throws IOException {
        int refusedDetailsCount = salesUnmadeExportExcel.getRefusedDetailsCount();
        int refusedValue = salesUnmadeExportExcel.getRefused();
        int refusedFromPage = pageField.from("Vendas - Não Efetivadas - Total Recusadas").getAsNumber();

        assertEquals("Valor vendas recusadas da tela não é igual à planilha.",
                refusedFromPage, refusedValue);
        assertEquals("Valor vendas recusadas da tela não é igual à contagem da planilha.",
                refusedFromPage, refusedDetailsCount);
    }

    @Then("A soma de vendas estornadas é igual a \"Não Efetivadas - Estornadas\"")
    public void unmadeMatchesScreen() throws IOException {
        int unmadeDetailsCount = salesUnmadeExportExcel.getUnmadeDetailsCount();
        int unmade = salesUnmadeExportExcel.getUnmade();
        int unmadeFromPage = pageField.from("Vendas - Não Efetivadas - Total Estornadas").getAsNumber();

        assertEquals("Valor vendas estornadas da tela não é igual à planilha.",
                unmadeFromPage, unmade, 0.001);
        assertEquals("Valor vendas estornadas da tela não é igual à contagem da planilha.",
                unmadeFromPage, unmadeDetailsCount, 0.001);
    }
}
