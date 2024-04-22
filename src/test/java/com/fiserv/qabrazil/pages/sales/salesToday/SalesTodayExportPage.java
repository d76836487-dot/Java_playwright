package com.fiserv.qabrazil.pages.sales.salesToday;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.CSVWrapper;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;
import org.apache.commons.lang3.tuple.ImmutablePair;

import java.io.InputStream;
import java.nio.file.Paths;

@ScenarioComponent
public class SalesTodayExportPage extends BasePage {

    public SalesTodayExportExcel getDownloadAsExcel() throws Exception {
        String formatType = "Vendas Hoje - Exportar - Dropdown Tipo Arquivo - Excel";
        ImmutablePair<InputStream, String> readStreamFilename = download(formatType);

        if (readStreamFilename == null) return SalesTodayExportExcel.NULL;

        return new SalesTodayExportExcel(
                new ExcelWrapper(readStreamFilename.getLeft(), "Comprovante da venda", readStreamFilename.getRight()));
    }

    public SalesTodayExportCsv getDownloadAsCsv() throws Exception {
        ImmutablePair<InputStream, String> readStreamFilename = download("Vendas Hoje - Exportar - Dropdown Tipo Arquivo - CSV");

        if (readStreamFilename == null) return SalesTodayExportCsv.NULL;

        return new SalesTodayExportCsv(new CSVWrapper(readStreamFilename.getLeft(), readStreamFilename.getRight()));
    }

    private ImmutablePair<InputStream, String> download(String formatType) {
        if (pageField.from("Home - Card Vendas Hoje - Ver Tudo").elementIsVisibleRightNow()) {
            pageField.from("Home - Card Vendas Hoje - Ver Tudo").click();
        }
        if (pageField.from("Vendas Hoje - Botão Cancelar Filtro").elementIsVisibleRightNow()) {
            pageField.from("Vendas Hoje - Botão Cancelar Filtro").click();
        }
        PageField exportButton = pageField.from("Vendas Hoje - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return null;

        exportButton.click();
        pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo").hoverOver();
        pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo").click();
        pageField.from(formatType).hoverOver();
        pageField.from(formatType).click();
        pageField.from(formatType).hoverAway();

        Download download = page.waitForDownload(() ->
                pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo - Gerar arquivo").click());

        download.saveAs(Paths.get("target/" + download.suggestedFilename()));

        return new ImmutablePair<>(download.createReadStream(), download.suggestedFilename());
    }
}