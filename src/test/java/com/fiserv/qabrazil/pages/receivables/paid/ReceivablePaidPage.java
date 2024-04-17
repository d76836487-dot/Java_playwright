package com.fiserv.qabrazil.pages.receivables.paid;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.CSVWrapper;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;

@ScenarioComponent
public class ReceivablePaidPage extends BasePage {

    public void navigateTo() {
        pageField.from("Menu Lateral - Recebimentos").click();
        pageField.from("Menu Lateral - Recebimentos Resumo").click();
        startMonitoringRequests(page, contractConfig);
        page.waitForURL(Pattern.compile("^.*/RecebimentosPagosV2$"));
        closeAllPopups();
    }

    public ReceivablePaidExportExcelSimplified getDownloadAsExcelSimplified() throws IOException {
        String formatType = "Recebimentos - Pagos - Exportar - Dropdown Tipo Arquivo - Excel";
        String simpleAdvancedButton = "Recebimentos - Pagos - Exportar - Relatório Simplificado";
        InputStream readStream = downloadReport(formatType, simpleAdvancedButton);

        if (readStream == null) return ReceivablePaidExportExcelSimplified.NULL;

        return new ReceivablePaidExportExcelSimplified(
                new ExcelWrapper(readStream, "Data do pagamento"));
    }

    public ReceivablePaidExport getDownloadAsExcelDetailed() {
        throw new UnsupportedOperationException("Aguardando definições para codificar este teste.");
//        String formatType = "Recebimentos - Pagos - Exportar - Dropdown Tipo Arquivo - Excel";
//        String simpleAdvancedButton = "Recebimentos - Pagos - Exportar - Relatório Detalhado";
//        InputStream readStream = downloadReport(formatType, simpleAdvancedButton);
//
//        if (readStream == null) return ReceivablePaidExportExcelDetailed.NULL;
//
//        return new ReceivablePaidExportExcelDetailed(
//                new ExcelWrapper(readStream, "Data de pagamento"));
    }

    public ReceivablePaidExport getDownloadAsCsvSimplified() throws Exception {
        String formatType = "Recebimentos - Pagos - Exportar - Dropdown Tipo Arquivo - CSV";
        String simpleAdvancedButton = "Recebimentos - Pagos - Exportar - Relatório Simplificado";
        InputStream readStream = downloadReport(formatType, simpleAdvancedButton);

        if (readStream == null) return ReceivablePaidExportCsvSimplified.NULL;

        return new ReceivablePaidExportCsvSimplified(new CSVWrapper(readStream));
    }

    private InputStream downloadReport(String formatType, String simpleAdvancedButton) {
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

        download.saveAs(Paths.get("target/" + download.suggestedFilename()));

        return download.createReadStream();
    }
}
