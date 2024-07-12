package com.fiserv.qabrazil.pages.sales.salesHistory;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.components.FilesToAttachToScenario;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.sales.salesToday.SalesTodayPage;
import com.fiserv.qabrazil.util.CSVWrapper;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.WaitUtil.retryIfGotException;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
public class SalesHistoryPage extends BasePage {

    @Autowired
    private SalesTodayPage salesTodayPage;

    @Autowired
    private FilesToAttachToScenario filesToAttachToScenario;

    public void navigateTo() {
       // salesTodayPage.navigateTo();
      //  retryIfGotException(() -> {
            // TODO: change for data-testid
            page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Histórico de vendas")).first().click();
        //    page.waitForURL(Pattern.compile("^.*/HistoricodeVendas.*$"));
            closeAllPopups();
      //  });
        waitUntilTrue(360, this::hasNoLoadingBars);
    }

    public SalesHistoryExportExcelSimplified getDownloadAsExcelSimplified() throws IOException {
        String formatType = "Vendas - Histórico de Vendas - Exportar - Dropdown Tipo Arquivo - Excel";
        String simpleAdvancedButton = "Vendas - Histórico de Vendas - Exportar - Relatório Simplificado";
        ImmutablePair<InputStream, String> readStreamFilename = downloadReport(formatType, simpleAdvancedButton);

        if (readStreamFilename == null) return SalesHistoryExportExcelSimplified.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFilename.getLeft(), ExcelWrapper.CONTENT_TYPE, "Excel simplificado");

        return new SalesHistoryExportExcelSimplified(
                new ExcelWrapper(bufferedInputStream, "Data da venda", readStreamFilename.getRight()));
    }

    public SalesHistoryExportExcelDetailed getDownloadAsExcelDetailed() throws IOException {
        String formatType = "Vendas - Histórico de Vendas - Exportar - Dropdown Tipo Arquivo - Excel";
        String simpleAdvancedButton = "Vendas - Histórico de Vendas - Exportar - Relatório Detalhado";
        ImmutablePair<InputStream, String> readStreamFilename = downloadReport(formatType, simpleAdvancedButton);

        if (readStreamFilename == null) return SalesHistoryExportExcelDetailed.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFilename.getLeft(),
                ExcelWrapper.CONTENT_TYPE, "Excel detalhado");

        return new SalesHistoryExportExcelDetailed(
                new ExcelWrapper(bufferedInputStream, "Data da venda", readStreamFilename.getRight()));
    }

    public SalesHistoryExportCsvSimplified getDownloadAsCsvSimplified() throws Exception {
        String formatType = "Vendas - Histórico de Vendas - Exportar - Dropdown Tipo Arquivo - CSV";
        String simpleAdvancedButton = "Vendas - Histórico de Vendas - Exportar - Relatório Simplificado";
        ImmutablePair<InputStream, String> readStreamFilename = downloadReport(formatType, simpleAdvancedButton);

        if (readStreamFilename == null) return SalesHistoryExportCsvSimplified.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFilename.getLeft(),
                CSVWrapper.CONTENT_TYPE, "Csv simplificado");

        return new SalesHistoryExportCsvSimplified(
                new CSVWrapper(bufferedInputStream, readStreamFilename.getRight()));
    }

    public SalesHistoryExportCsvDetailed getDownloadAsCsvDetailed() throws Exception {
        String formatType = "Vendas - Histórico de Vendas - Exportar - Dropdown Tipo Arquivo - CSV";
        String simpleAdvancedButton = "Vendas - Histórico de Vendas - Exportar - Relatório Detalhado";
        ImmutablePair<InputStream, String> readStreamFilename = downloadReport(formatType, simpleAdvancedButton);

        if (readStreamFilename == null) return SalesHistoryExportCsvDetailed.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFilename.getLeft(),
                CSVWrapper.CONTENT_TYPE, "Csv detalhado");

        return new SalesHistoryExportCsvDetailed(
                new CSVWrapper(bufferedInputStream, readStreamFilename.getRight()));
    }

    private ImmutablePair<InputStream, String> downloadReport(String formatType, String simpleAdvancedButton) {
        if (pageField.from("Vendas - Histórico de Vendas - Botão Cancelar Filtro").elementIsVisibleRightNow()) {
            pageField.from("Vendas Hoje - Botão Cancelar Filtro").click();
        }
        PageField exportButton = pageField.from("Vendas - Histórico de Vendas - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return null;

        exportButton.click();
        pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo").hoverOver();
        pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo").click();
        pageField.from(formatType).hoverOver();
        pageField.from(formatType).click();
        pageField.from(formatType).hoverAway();

        pageField.from(simpleAdvancedButton).click();

        Download download = page.waitForDownload(() ->
                pageField.from("Vendas - Histórico de Vendas - Exportar - Botão Gerar Arquivo").click());

        return new ImmutablePair<>(download.createReadStream(), download.suggestedFilename());
    }
}
