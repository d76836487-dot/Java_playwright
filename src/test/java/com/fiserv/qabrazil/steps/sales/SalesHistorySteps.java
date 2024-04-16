package com.fiserv.qabrazil.steps.sales;

import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.sales.salesHistory.SalesHistoryExport;
import com.fiserv.qabrazil.pages.sales.salesHistory.SalesHistoryPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.testng.AssertJUnit.assertEquals;
import static org.testng.internal.junit.ArrayAsserts.assertArrayEquals;

public class SalesHistorySteps extends BasePage {
    @Autowired
    private SalesHistoryPage salesHistoryPage;
    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    private SalesHistoryExport salesHistoryExport;

    @Given("Usuário acessou Vendas - Histórico de Vendas")
    public void goTo() {
        salesHistoryPage.navigateTo();
    }

    @Then("A exportação do relatório em {string} 'Histórico de Vendas' terá somente o EC selecionado no detalhamento")
    public void exportWillHaveOnlySelectedEcDetails(String format) throws Exception {
        salesHistoryExport = downloadAndProcessExport(format);

        List<String> exportedEcColumn = salesHistoryExport.getEcFromColumn().stream()
                .distinct()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs();

        assertThat(exportedEcColumn)
                .withFailMessage("Existem ECS na coluna gerados no excel que não são iguais ao selecionado. Esperado '%s'. Atual '%s'.".formatted(selectedEcs, exportedEcColumn))
                .allMatch(selectedEcs::contains);
    }

    @Then("A exportação do relatório 'Histórico de Vendas' terá exatamente os ECs selecionado no cabeçalho")
    public void exportWillHaveOnlySelectedEcHeader() throws Exception {
        if (!salesHistoryExport.hasHeader() || salesHistoryExport.isNull()) return;

        List<String> exportedEcCell = salesHistoryExport.getEcsFromCell().stream()
                .filter(m -> !m.trim().isEmpty())
                .sorted()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs().stream()
                .sorted()
                .toList();

        assertArrayEquals("Valores da célula com EC é diferente dos ECs selecionados. Esperado: '%s', encontrado: '%s'".formatted(selectedEcs.toString(), exportedEcCell.toString()),
                exportedEcCell.toArray(new String[0]), selectedEcs.toArray(new String[0]));
    }

    @Then("A soma de todos valores Brutos é igual a \"Vendas Histórico - Valor Bruto\"")
    public void sumGrossValueMatchesScreen() throws IOException, ParseException {
        double sumGrossValue = salesHistoryExport.getSumGrossValues();
        double grossValue = salesHistoryExport.getGrossSales();
        double salesToday = pageField.from("Vendas - Histórico de Vendas - Resumo - Valor bruto").getAsCurrency().doubleValue();

        assertEquals("Valor bruto da tela não é igual à planilha.",
                salesToday, grossValue, 0.001);
        assertEquals("Soma do valor bruto da planilha não é igual à tela.",
                salesToday, sumGrossValue, 0.001);
    }

    @Then("A soma de todos valores Líquidos é igual a \"Vendas Histórico - Valor Líquido\"")
    public void sumNetValueMatchesScreen() throws IOException, ParseException {
        double sumNetValues = salesHistoryExport.getSumNetValues();
        double netValue = salesHistoryExport.getNetSales();
        double salesToday = pageField.from("Vendas - Histórico de Vendas - Resumo - Valor líquido").getAsCurrency().doubleValue();

        assertEquals("Valor líquido da tela não é igual à planilha.",
                salesToday, netValue, 0.001);
        assertEquals("Soma do valor líquido da planilha não é igual à tela.",
                salesToday, sumNetValues, 0.001);
    }

    @Then("A soma de todos valores Cancelados é igual a \"Vendas Histórico - Valor Cancelados\"")
    public void sumCancelledValueMatchesScreen() throws IOException, ParseException {
        double sumCancelledValues = salesHistoryExport.getSumCancelledValues();
        double cancelledValue = salesHistoryExport.getCancelledSales();
        double valueFromPage = pageField.from("Vendas - Histórico de Vendas - Resumo - Valor cancelado").getAsCurrency().doubleValue();

        assertEquals("Valor líquido da tela não é igual à planilha.",
                valueFromPage, cancelledValue, 0.001);
        assertEquals("Soma do valor líquido da planilha não é igual à tela.",
                valueFromPage, sumCancelledValues, 0.001);
    }

    private SalesHistoryExport downloadAndProcessExport(String format) throws Exception {
        return switch (format) {
            case "Excel Simplificado" -> salesHistoryExport = salesHistoryPage.getDownloadAsExcelSimplified();
            case "Excel Detalhado" -> salesHistoryExport = salesHistoryPage.getDownloadAsExcelDetailed();
            case "CSV Simplificado" -> salesHistoryExport = salesHistoryPage.getDownloadAsCsvSimplified();
            case "CSV Detalhado" -> salesHistoryExport = salesHistoryPage.getDownloadAsCsvDetailed();
            default -> throw new RuntimeException("Formato desconhecido.");
        };
    }
}
