package com.fiserv.qabrazil.steps.receivable;

import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.receivables.ReceivableFuturePage;
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

public class ReceivableFutureSteps extends BasePage {
    @Autowired
    ReceivableFuturePage receivableFuturePage;
    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    ReceivableFuturePage.ReceivableFutureExportExcel receivableFutureExportExcel;

    @Given("Usuário acessou Recebimentos - Futuros")
    public void goTo() {
        receivableFuturePage.navigateTo();
    }

    @Then("A exportação do relatório 'Recibos Futuros' terá somente o EC selecionado no detalhamento")
    public void exportWillHaveOnlySelectedEcDetail() throws Exception {
        receivableFutureExportExcel = receivableFuturePage.getDownloadAsExcel();
        List<String> exportedEcColumn = receivableFutureExportExcel.getEcFromColumn().stream()
                .distinct()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs();

        assertThat(exportedEcColumn)
                .withFailMessage("Existem ECS na coluna gerados no excel que não são iguais ao selecionado. Esperado: '%s'. Atual '%s'.".formatted(selectedEcs, exportedEcColumn))
                .allMatch(selectedEcs::contains);
    }

    @Then("A exportação do relatório 'Recibos Futuros' terá exatamente os ECs selecionado no cabeçalho")
    public void exportWillHaveOnlySelectedEcHead() throws Exception {
        List<String> exportedEcCell = receivableFutureExportExcel.getEcsFromCell().stream()
                .filter(m -> !m.trim().isEmpty())
                .sorted()
                .toList();
        List<String> selectedEcs = selectECOrDtcoPage.getSelectedEcs().stream()
                .sorted()
                .toList();

        if (receivableFutureExportExcel == ReceivableFuturePage.ReceivableFutureExportExcel.NULL) return;

        assertArrayEquals("Valores da célula com EC é diferente dos ECs selecionados. Esperado: '%s', encontrado: '%s'".formatted(selectedEcs.toString(), exportedEcCell.toString()),
                exportedEcCell.toArray(new String[0]), selectedEcs.toArray(new String[0]));
    }

    @Then("Total líquido em 'Recibos Futuro' é igual ao exportado")
    public void totalReceived() throws IOException, ParseException {
        double sumColumn = receivableFutureExportExcel.getSumForeseen();
        double sumHeader = receivableFutureExportExcel.getForeseen();
        double sumFromPage = pageField.from("Recebimentos - Futuros - Total líquido").getAsCurrency().doubleValue();

        assertEquals(sumColumn, sumFromPage, 0.001);
        assertEquals(sumColumn, sumHeader, 0.001);
    }

    @Then("Quantidade vendas em 'Recibos Futuros' é igual ao exportado")
    public void quantityReceived() throws IOException {
        int countColumn = receivableFutureExportExcel.getCountQuantitySales();
        int quantityHeader = receivableFutureExportExcel.getQuantitySales();
        int quantityFromPage = pageField.from("Recebimentos - Futuros - Quantidade vendas").getAsNumber();

        assertEquals(countColumn, quantityFromPage);
        assertEquals(countColumn, quantityHeader);
    }
}
