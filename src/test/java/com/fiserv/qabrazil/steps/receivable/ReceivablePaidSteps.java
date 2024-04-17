package com.fiserv.qabrazil.steps.receivable;

import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.pages.receivables.paid.ReceivablePaidExport;
import com.fiserv.qabrazil.pages.receivables.paid.ReceivablePaidPage;
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

    ReceivablePaidExport receivablePaidExport;

    @Given("Usuário acessou Recebimentos - Pagos")
    public void goTo() {
        receivablePaidPage.navigateTo();
    }

    @Then("A exportação do relatório em {string} 'Recibos Pagos' terá somente o EC selecionado no detalhamento")
    public void exportWillHaveOnlySelectedEcDetail(String format) throws Exception {
        receivablePaidExport = downloadAndProcessExport(format);
        List<String> exportedEcColumn = receivablePaidExport.getEcFromColumn().stream()
                .distinct()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs();

        assertThat(exportedEcColumn)
                .withFailMessage("Existem ECS na coluna gerados no excel que não são iguais ao selecionado. Esperado: '%s'. Atual '%s'.".formatted(selectedEcs, exportedEcColumn))
                .allMatch(selectedEcs::contains);
    }

    @Then("A exportação do relatório 'Recibos Pagos' terá exatamente os ECs selecionado no cabeçalho")
    public void exportWillHaveOnlySelectedEcHead() throws Exception {
        if (!receivablePaidExport.hasHeader() || receivablePaidExport.isNull()) return;

        List<String> exportedEcCell = receivablePaidExport.getEcsFromCell().stream()
                .filter(m -> !m.trim().isEmpty())
                .sorted()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs().stream()
                .sorted()
                .toList();

        assertArrayEquals("Valores da célula com EC é diferente dos ECs selecionados. Esperado: '%s', encontrado: '%s'".formatted(selectedEcs.toString(), exportedEcCell.toString()),
                exportedEcCell.toArray(new String[0]), selectedEcs.toArray(new String[0]));
    }

    @Then("Total recebido em 'Recibos Pagos' é igual ao exportado")
    public void totalReceived() throws IOException, ParseException {
        double sumColumn = receivablePaidExport.getSumPaid();
        double sumHeader = receivablePaidExport.getPaid();
        double sumFromPage = pageField.from("Recebimentos - Pagos - Total recebido").getAsCurrency().doubleValue();

        assertEquals(sumColumn, sumFromPage, 0.001);
        assertEquals(sumColumn, sumHeader, 0.001);
    }

    @Then("Total agendado em 'Recibos Pagos' é igual ao exportado")
    public void totalScheduled() throws IOException, ParseException {
        double sumColumn = receivablePaidExport.getSumScheduled();
        double sumHeader = receivablePaidExport.getScheduled();
        double sumFromPage = pageField.from("Recebimentos - Pagos - Total agendado").getAsCurrency().doubleValue();

        assertEquals(sumColumn, sumFromPage, 0.001);
        assertEquals(sumColumn, sumHeader, 0.001);
    }
    @Then("Total cedido em 'Recibos Pagos' é igual ao exportado")
    public void totalTransferred() throws IOException, ParseException {
        double sumColumn = receivablePaidExport.getSumTransferred();
        double sumHeader = receivablePaidExport.getTransferred();
        double sumFromPage = pageField.from("Recebimentos - Pagos - Total cedido").getAsCurrency().doubleValue();

        assertEquals(sumColumn, sumFromPage, 0.001);
        assertEquals(sumColumn, sumHeader, 0.001);
    }

    @Then("Quantidade recebido em 'Recibos Pagos' é igual ao exportado")
    public void quantityReceived() throws IOException {
        int countColumn = receivablePaidExport.getCountQuantityPaid();
        int quantityHeader = receivablePaidExport.getQuantityPaid();
        String fromPage = pageField.from("Recebimentos - Pagos - Depósitos recebido").getAsText();
        int quantityFromPage = Integer.parseInt(fromPage.replaceAll(" depósito.*", ""));

        assertEquals(countColumn, quantityFromPage);
        assertEquals(countColumn, quantityHeader);
    }

    @Then("Quantidade agendado em 'Recibos Pagos' é igual ao exportado")
    public void quantityScheduled() throws IOException {
        int countColumn = receivablePaidExport.getCountQuantitySchedule();
        int quantityHeader = receivablePaidExport.getQuantityScheduled();
        String fromPage = pageField.from("Recebimentos - Pagos - Depósitos agendado").getAsText();
        int quantityFromPage = Integer.parseInt(fromPage.replaceAll(" depósito.*", ""));

        assertEquals(countColumn, quantityFromPage);
        assertEquals(countColumn, quantityHeader);
    }
    @Then("Quantidade cedido em 'Recibos Pagos' é igual ao exportado")
    public void quantityTransferred() throws IOException {
        int countColumn = receivablePaidExport.getCountQuantityTransferred();
        int quantityHeader = receivablePaidExport.getQuantityTransferred();
        String fromPage = pageField.from("Recebimentos - Pagos - Depósitos cedido").getAsText();
        int quantityFromPage = Integer.parseInt(fromPage.replaceAll(" depósito.*", ""));

        assertEquals(countColumn, quantityFromPage);
        assertEquals(countColumn, quantityHeader);
    }

    private ReceivablePaidExport downloadAndProcessExport(String format) throws Exception {
        return switch (format) {
            case "Excel Simplificado" -> receivablePaidPage.getDownloadAsExcelSimplified();
            case "Excel Detalhado" -> receivablePaidPage.getDownloadAsExcelDetailed();
            case "CSV Simplificado" -> receivablePaidPage.getDownloadAsCsvSimplified();
            case "CSV Detalhado" -> receivablePaidPage.getDownloadAsExcelSimplified();
            default -> throw new RuntimeException("Formato desconhecido.");
        };
    }
}
