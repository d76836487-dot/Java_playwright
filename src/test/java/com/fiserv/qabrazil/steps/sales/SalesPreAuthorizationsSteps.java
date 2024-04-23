package com.fiserv.qabrazil.steps.sales;

import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.sales.salesPreAuthorization.SalesPreAuthorizationExport;
import com.fiserv.qabrazil.pages.sales.salesPreAuthorization.SalesPreAuthorizationsPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.testng.AssertJUnit.assertEquals;
import static org.testng.internal.junit.ArrayAsserts.assertArrayEquals;

public class SalesPreAuthorizationsSteps extends BasePage {
    @Autowired
    SalesPreAuthorizationsPage salesPreAuthorizationsPage;
    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    private SalesPreAuthorizationExport salesPreAuthorizationExport;

    @Given("Usuário acessou Vendas - Pré Autorizações")
    public void goTo() {
        salesPreAuthorizationsPage.navigateTo();
    }

    @Then("A exportação do relatório em {string} 'Pré Autorizadas' terá somente o EC selecionado no detalhamento")
    public void exportWillHaveOnlySelectedEcDetails(String format) throws Exception {
        salesPreAuthorizationExport = downloadAndProcessExport(format);

        List<String> exportedEcColumn = salesPreAuthorizationExport.getEcFromColumn().stream()
                .distinct()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs();

        assertThat(exportedEcColumn)
                .withFailMessage("Existem ECS na coluna gerados no excel que não são iguais ao selecionado '%s': '%s'.".formatted(selectedEcs, exportedEcColumn))
                .allMatch(selectedEcs::contains);
    }
    @Then("A exportação do relatório 'Pré Autorizadas' terá exatamente os ECs selecionado no cabeçalho")
    public void exportWillHaveOnlySelectedEcHeader() throws Exception {
        if (!salesPreAuthorizationExport.hasHead() || salesPreAuthorizationExport.isNull()) return;

        List<String> exportedEcCell = salesPreAuthorizationExport.getEcsFromCell().stream()
                .filter(m -> !m.trim().isEmpty())
                .sorted()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs().stream()
                .sorted()
                .toList();


        assertArrayEquals("Valores da célula com EC é diferente da coluna. Esperado: '%s', encontrado: '%s'".formatted(selectedEcs.toString(), exportedEcCell.toString()),
                exportedEcCell.toArray(new String[0]), selectedEcs.toArray(new String[0]));
    }

    @Then("A soma de vendas autorizadas \\(confirmadas) é igual ao valor bruto autorizado")
    public void grossValueAuthorizedMatchesScreen() throws IOException, ParseException {
        double sumGross = salesPreAuthorizationExport.getSumGrossAuthorized();
        double gross = salesPreAuthorizationExport.getGrossAuthorized();
        double grossValuePage = pageField.from("Vendas - Pré Autorizações - Valor Bruto Autorizado").getAsCurrency().doubleValue();

        assertEquals("Valor vendas autorizadas da tela não é igual à planilha.",
                grossValuePage, sumGross);
        assertEquals("Valor vendas autorizadas da tela não é igual à contagem da planilha.",
                grossValuePage, gross);
    }

    @Then("A soma de vendas pré-autorizadas é igual ao valor bruto a confirmar")
    public void grossValueToConfirmMatchesScreen() throws IOException, ParseException {
        double sumGross = salesPreAuthorizationExport.getSumGrossToConfirm();
        double gross = salesPreAuthorizationExport.getGrossToConfirm();
        double grossValuePage = pageField.from("Vendas - Pré Autorizações - Valor Bruto A Confirmar").getAsCurrency().doubleValue();

        assertEquals("Valor vendas a confirmar da tela não é igual à planilha.",
                grossValuePage, sumGross);
        assertEquals("Valor vendas a confirmar da tela não é igual à contagem da planilha.",
                grossValuePage, gross);
    }

    @Then("A contagem de vendas pré-autorizadas é igual a Total de Vendas")
    public void countMatchesScreen() throws IOException {
        long countQuantityPre = salesPreAuthorizationExport.getCountPre();
        long quantityPre = salesPreAuthorizationExport.getCount();
        int quantitySalesFromPage = pageField.from("Vendas - Pré Autorizações - Total Vendas").getAsNumber();

        assertEquals("Quantidade vendas pré-autorizadas da tela não é igual à planilha.",
                quantitySalesFromPage, quantityPre);
        assertEquals("Quantidade vendas pré-autorizadas da tela não é igual à contagem da planilha.",
                quantitySalesFromPage, countQuantityPre);
    }

    private SalesPreAuthorizationExport downloadAndProcessExport(String format) throws Exception {
        return switch (format) {
            case "Excel" -> salesPreAuthorizationsPage.getDownloadAsExcel();
            case "CSV" -> salesPreAuthorizationsPage.getDownloadAsCsv();
            default -> throw new RuntimeException("Formato desconhecido.");
        };
    }
}
