package com.fiserv.qabrazil.pages.sales.salesHistory;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.sales.salesToday.SalesTodayPage;
import com.fiserv.qabrazil.util.CSVWrapper;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.WaitUtil.retryIfGotException;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
public class SalesHistoryPage extends BasePage {

    @Autowired
    private SalesTodayPage salesTodayPage;

    public void navigateTo() {
        salesTodayPage.navigateTo();
        retryIfGotException(() -> {
            // TODO: change for data-testid
            page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Histórico de vendas")).first().click();
            page.waitForURL(Pattern.compile("^.*/HistoricodeVendas.*$"));
            closeAllPopups();
        });
        waitUntilTrue(360, this::hasNoLoadingBars);
    }

    public SalesHistoryExportExcelSimplified getDownloadAsExcelSimplified() throws IOException {
        String formatType = "Vendas - Histórico de Vendas - Exportar - Dropdown Tipo Arquivo - Excel";
        String simpleAdvancedButton = "Vendas - Histórico de Vendas - Exportar - Relatório Simplificado";
        InputStream readStream = downloadReport(formatType, simpleAdvancedButton);

        if (readStream == null) return SalesHistoryExportExcelSimplified.NULL;

        return new SalesHistoryExportExcelSimplified(new ExcelWrapper(readStream, "Data da venda"));
    }

    public SalesHistoryExportExcelDetailed getDownloadAsExcelDetailed() throws IOException {
        String formatType = "Vendas - Histórico de Vendas - Exportar - Dropdown Tipo Arquivo - Excel";
        String simpleAdvancedButton = "Vendas - Histórico de Vendas - Exportar - Relatório Detalhado";
        InputStream readStream = downloadReport(formatType, simpleAdvancedButton);

        if (readStream == null) return SalesHistoryExportExcelDetailed.NULL;

        return new SalesHistoryExportExcelDetailed(new ExcelWrapper(readStream, "Data da venda"));
    }

    public SalesHistoryExportCsvSimplified getDownloadAsCsvSimplified() throws Exception {
        String formatType = "Vendas - Histórico de Vendas - Exportar - Dropdown Tipo Arquivo - CSV";
        String simpleAdvancedButton = "Vendas - Histórico de Vendas - Exportar - Relatório Simplificado";
        InputStream readStream = downloadReport(formatType, simpleAdvancedButton);

        if (readStream == null) return SalesHistoryExportCsvSimplified.NULL;

        return new SalesHistoryExportCsvSimplified(new CSVWrapper(readStream));
    }

    public SalesHistoryExportCsvDetailed getDownloadAsCsvDetailed() throws Exception {
        String formatType = "Vendas - Histórico de Vendas - Exportar - Dropdown Tipo Arquivo - CSV";
        String simpleAdvancedButton = "Vendas - Histórico de Vendas - Exportar - Relatório Detalhado";
        InputStream readStream = downloadReport(formatType, simpleAdvancedButton);

        if (readStream == null) return SalesHistoryExportCsvDetailed.NULL;

        return new SalesHistoryExportCsvDetailed(new CSVWrapper(readStream));
    }

    private InputStream downloadReport(String formatType, String simpleAdvancedButton) {
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

        download.saveAs(Paths.get("target/" + download.suggestedFilename()));

        return download.createReadStream();
    }
}
