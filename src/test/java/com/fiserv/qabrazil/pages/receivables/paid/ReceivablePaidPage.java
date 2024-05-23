package com.fiserv.qabrazil.pages.receivables.paid;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.components.FilesToAttachToScenario;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.CSVWrapper;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;

@ScenarioComponent
public class ReceivablePaidPage extends BasePage {

    @Autowired
    private FilesToAttachToScenario filesToAttachToScenario;

    public void navigateTo() {
        pageField.from("Menu Lateral - Recebimentos").click();
        pageField.from("Menu Lateral - Recebimentos Resumo").click();
        startMonitoringRequests(page, contractConfig);
        page.waitForURL(Pattern.compile("^.*/Recebimentos$"));
        closeAllPopups();
    }

    public ReceivablePaidExportExcelSimplified getDownloadAsExcelSimplified() throws IOException {
        String formatType = "Recebimentos - Pagos - Exportar - Dropdown Tipo Arquivo - Excel";
        String simpleAdvancedButton = "Recebimentos - Pagos - Exportar - Relatório Simplificado";
        ImmutablePair<InputStream, String> readStreamFileName = downloadReport(formatType, simpleAdvancedButton);

        if (readStreamFileName == null) return ReceivablePaidExportExcelSimplified.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFileName.getLeft(),
                CSVWrapper.CONTENT_TYPE, "Excel");

        return new ReceivablePaidExportExcelSimplified(
                new ExcelWrapper(bufferedInputStream, "Data do pagamento", readStreamFileName.getRight()));
    }

    public ReceivablePaidExport getDownloadAsCsvSimplified() throws Exception {
        String formatType = "Recebimentos - Pagos - Exportar - Dropdown Tipo Arquivo - CSV";
        String simpleAdvancedButton = "Recebimentos - Pagos - Exportar - Relatório Simplificado";
        ImmutablePair<InputStream, String> readStreamFileName = downloadReport(formatType, simpleAdvancedButton);

        if (readStreamFileName == null) return ReceivablePaidExportCsvSimplified.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFileName.getLeft(),
                CSVWrapper.CONTENT_TYPE, "Csv");

        return new ReceivablePaidExportCsvSimplified(
                new CSVWrapper(bufferedInputStream, readStreamFileName.getRight()));
    }

    private ImmutablePair<InputStream, String> downloadReport(String formatType, String simpleAdvancedButton) {
        PageField buttonCancelFilter = pageField.from("Recebimentos - Pagos - Botão Cancelar Filtro");
        if (buttonCancelFilter.elementIsVisibleRightNow()) {
            buttonCancelFilter.click();
        }
        PageField exportButton = pageField.from("Recebimentos - Pagos - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return null;

        exportButton.click();
        pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo").hoverOver();
        pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo").click();
        pageField.from(formatType).hoverOver();
        pageField.from(formatType).click();
        pageField.from(formatType).hoverAway();

        pageField.from(simpleAdvancedButton).click();

        Download download = page.waitForDownload(() ->
                pageField.from("Recebimentos - Pagos - Exportar - Botão Gerar Arquivo").click());

        return new ImmutablePair<>(download.createReadStream(), download.suggestedFilename());
    }
}
