package com.fiserv.qabrazil.steps.receivable;

import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.receivables.ReceivablePaidPage;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.testng.AssertJUnit.assertEquals;
import static org.testng.internal.junit.ArrayAsserts.assertArrayEquals;

public class ReceivablePaidSteps extends BasePage {
    @Autowired
    ReceivablePaidPage receivablePaidPage;
    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    ReceivablePaidPage.ReceivablePaidExportExcel receivablePaidExportExcel;

    @Given("Usuário acessou Recebimentos - Pagos")
    public void goTo() {
        receivablePaidPage.navigateTo();
    }

    @Then("A exportação do relatório 'Recibos Pagos' terá somente o EC selecionado no detalhamento")
    public void exportWillHaveOnlySelectedEcDetail() throws Exception {
        receivablePaidExportExcel = receivablePaidPage.getDownloadAsExcel();
        List<String> exportedEcColumn = receivablePaidExportExcel.getEcFromColumn().stream()
                .distinct()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs();

        assertThat(exportedEcColumn)
                .withFailMessage("Existem ECS na coluna gerados no excel que não são iguais ao selecionado. Esperado: '%s'. Atual '%s'.".formatted(selectedEcs, exportedEcColumn))
                .allMatch(selectedEcs::contains);
    }

    @Then("A exportação do relatório 'Recibos Pagos' terá exatamente os ECs selecionado no cabeçalho")
    public void exportWillHaveOnlySelectedEcHead() throws Exception {
        List<String> exportedEcCell = receivablePaidExportExcel.getEcsFromCell().stream()
                .filter(m -> !m.trim().isEmpty())
                .sorted()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs().stream()
                .sorted()
                .toList();

        if (receivablePaidExportExcel == ReceivablePaidPage.ReceivablePaidExportExcel.NULL) return;

        assertArrayEquals("Valores da célula com EC é diferente dos ECs selecionados. Esperado: '%s', encontrado: '%s'".formatted(selectedEcs.toString(), exportedEcCell.toString()),
                exportedEcCell.toArray(new String[0]), selectedEcs.toArray(new String[0]));
    }

    @Then("Total recebido em 'Recibos Pagos' é igual ao exportado")
    public void totalReceived() throws IOException, ParseException {
        double sumColumn = receivablePaidExportExcel.getSumPaid();
        double sumHeader = receivablePaidExportExcel.getPaid();
        double sumFromPage = pageField.from("Recebimentos - Pagos - Total recebido").getAsCurrency().doubleValue();

        assertEquals(sumColumn, sumFromPage, 0.001);
        assertEquals(sumColumn, sumHeader, 0.001);
    }

    @Then("Total agendado em 'Recibos Pagos' é igual ao exportado")
    public void totalScheduled() throws IOException, ParseException {
        double sumColumn = receivablePaidExportExcel.getSumScheduled();
        double sumHeader = receivablePaidExportExcel.getScheduled();
        double sumFromPage = pageField.from("Recebimentos - Pagos - Total agendado").getAsCurrency().doubleValue();

        assertEquals(sumColumn, sumFromPage, 0.001);
        assertEquals(sumColumn, sumHeader, 0.001);
    }
    @Then("Total cedido em 'Recibos Pagos' é igual ao exportado")
    public void totalTransferred() throws IOException, ParseException {
        double sumColumn = receivablePaidExportExcel.getSumTransferred();
        double sumHeader = receivablePaidExportExcel.getTransferred();
        double sumFromPage = pageField.from("Recebimentos - Pagos - Total cedido").getAsCurrency().doubleValue();

        assertEquals(sumColumn, sumFromPage, 0.001);
        assertEquals(sumColumn, sumHeader, 0.001);
    }

    @Then("Quantidade recebido em 'Recibos Pagos' é igual ao exportado")
    public void quantityReceived() throws IOException {
        int countColumn = receivablePaidExportExcel.getCountQuantityPaid();
        int quantityHeader = receivablePaidExportExcel.getQuantityPaid();
        String fromPage = pageField.from("Recebimentos - Pagos - Depósitos recebido").getAsText();
        int quantityFromPage = Integer.parseInt(fromPage.replaceAll(" depósito.*", ""));

        assertEquals(countColumn, quantityFromPage);
        assertEquals(countColumn, quantityHeader);
    }

    @Then("Quantidade agendado em 'Recibos Pagos' é igual ao exportado")
    public void quantityScheduled() throws IOException {
        int countColumn = receivablePaidExportExcel.getCountQuantitySchedule();
        int quantityHeader = receivablePaidExportExcel.getQuantityScheduled();
        String fromPage = pageField.from("Recebimentos - Pagos - Depósitos agendado").getAsText();
        int quantityFromPage = Integer.parseInt(fromPage.replaceAll(" depósito.*", ""));

        assertEquals(countColumn, quantityFromPage);
        assertEquals(countColumn, quantityHeader);
    }
    @Then("Quantidade cedido em 'Recibos Pagos' é igual ao exportado")
    public void quantityTransferred() throws IOException {
        int countColumn = receivablePaidExportExcel.getCountQuantityTransferred();
        int quantityHeader = receivablePaidExportExcel.getQuantityTransferred();
        String fromPage = pageField.from("Recebimentos - Pagos - Depósitos cedido").getAsText();
        int quantityFromPage = Integer.parseInt(fromPage.replaceAll(" depósito.*", ""));

        assertEquals(countColumn, quantityFromPage);
        assertEquals(countColumn, quantityHeader);
    }
}
