package com.fiserv.qabrazil.steps.sales;

import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.testng.AssertJUnit.assertEquals;
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

    @Then("A exportação do relatório 'Não Efetivadas' terá somente o EC selecionado no detalhamento")
    public void exportWillHaveOnlySelectedEcDetails() throws Exception {
        salesUnmadeExportExcel = salesUnmadePage.getDownloadAsExcel();
        List<String> exportedEcColumn = salesUnmadeExportExcel.getEcFromColumn().stream()
                .distinct()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs();

        assertThat(exportedEcColumn)
                .withFailMessage("Existem ECS na coluna gerados no excel que não são iguais ao selecionado. Esperado: '%s'. Atual '%s'.".formatted(selectedEcs.toString(), exportedEcColumn.toString()))
                .allMatch(selectedEcs::contains);
    }
    @Then("A exportação do relatório 'Não Efetivadas' terá somente o EC selecionado no cabeçalho")
    public void exportWillHaveOnlySelectedEcHeader() throws Exception {
        List<String> exportedEcCell = salesUnmadeExportExcel.getEcsFromCell().stream()
                .filter(m -> !m.trim().isEmpty())
                .sorted()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs().stream()
                .sorted()
                .toList();

        if (salesUnmadeExportExcel == SalesUnmadePage.SalesUnmadeExportExcel.NULL) return;

        assertArrayEquals("Valores da célula com EC é diferente da coluna. Esperado: '%s', atual: '%s'".formatted(selectedEcs.toString(), exportedEcCell.toString()),
                exportedEcCell.toArray(new String[0]), selectedEcs.toArray(new String[0]));
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
