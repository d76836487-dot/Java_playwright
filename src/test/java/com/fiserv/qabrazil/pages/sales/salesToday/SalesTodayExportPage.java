package com.fiserv.qabrazil.pages.sales.salesToday;

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
import java.io.InputStream;

@ScenarioComponent
public class SalesTodayExportPage extends BasePage {
    @Autowired
    FilesToAttachToScenario filesToAttachToScenario;

    public SalesTodayExportExcel getDownloadAsExcel() throws Exception {
        String formatType = "Vendas Hoje - Exportar - Dropdown Tipo Arquivo - Excel";
        ImmutablePair<InputStream, String> readStreamFilename = download(formatType);

        if (readStreamFilename == null) return SalesTodayExportExcel.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFilename.getLeft(),
                ExcelWrapper.CONTENT_TYPE, "Excel");

        return new SalesTodayExportExcel(
                new ExcelWrapper(bufferedInputStream, "Data da venda", readStreamFilename.getRight()));
    }

    public SalesTodayExportCsv getDownloadAsCsv() throws Exception {
        ImmutablePair<InputStream, String> readStreamFilename = download("Vendas Hoje - Exportar - Dropdown Tipo Arquivo - CSV");

        if (readStreamFilename == null) return SalesTodayExportCsv.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFilename.getLeft(),
                CSVWrapper.CONTENT_TYPE, "Excel");

        return new SalesTodayExportCsv(new CSVWrapper(bufferedInputStream, readStreamFilename.getRight()));
    }

    private ImmutablePair<InputStream, String> download(String formatType) {
        if (pageField.from("Home - Card Vendas Hoje - Ver Tudo").elementIsVisibleAndEnabledRightNow()) {
            pageField.from("Home - Card Vendas Hoje - Ver Tudo").click();
        }
        if (pageField.from("Vendas Hoje - Botão Cancelar Filtro").elementIsVisibleAndEnabledRightNow()) {
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

        return new ImmutablePair<>(download.createReadStream(), download.suggestedFilename());
    }
}