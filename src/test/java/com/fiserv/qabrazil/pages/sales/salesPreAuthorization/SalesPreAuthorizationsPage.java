package com.fiserv.qabrazil.pages.sales.salesPreAuthorization;

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

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;

@ScenarioComponent
public class SalesPreAuthorizationsPage extends BasePage {
    @Autowired
    private SalesTodayPage salesTodayPage;

    @Autowired
    private FilesToAttachToScenario filesToAttachToScenario;

    public void navigateTo() {
        salesTodayPage.navigateTo();
        // TODO: change for data-testid
        page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Pré-autorizações")).first().click();
        startMonitoringRequests(page, contractConfig);
        page.waitForURL(Pattern.compile("^.*/PreAutorizacoes.*$"));
        closeAllPopups();
    }

    public SalesPreAuthorizationExportExcel getDownloadAsExcel() throws IOException {
        String formatType = "Vendas - Pré Autorizações - Exportar - Dropdown Tipo Arquivo - Excel";
        ImmutablePair<InputStream, String> readStreamFilename = downloadReport(formatType);

        if (readStreamFilename == null) return SalesPreAuthorizationExportExcel.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFilename.getLeft(),
                CSVWrapper.CONTENT_TYPE, "Excel");

        return new SalesPreAuthorizationExportExcel(
                new ExcelWrapper(bufferedInputStream, "Data da venda", readStreamFilename.getRight()));
    }

    public SalesPreAuthorizationExportCsv getDownloadAsCsv() throws Exception {
        String formatType = "Vendas - Pré Autorizações - Exportar - Dropdown Tipo Arquivo - CSV";
        ImmutablePair<InputStream, String> readStreamFilename = downloadReport(formatType);

        if (readStreamFilename == null) return SalesPreAuthorizationExportCsv.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFilename.getLeft(),
                CSVWrapper.CONTENT_TYPE, "Csv");

        return new SalesPreAuthorizationExportCsv(new CSVWrapper(bufferedInputStream, readStreamFilename.getRight()));
    }

    private ImmutablePair<InputStream, String> downloadReport(String formatType) {
        PageField buttonCancelFilter = pageField.from("Vendas - Pré Autorizações - Botão Cancelar Filtro");
        if (buttonCancelFilter.elementIsVisibleRightNow()) {
            buttonCancelFilter.click();
        }
        PageField exportButton = pageField.from("Vendas - Pré Autorizações - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return null;

        exportButton.click();

        pageField.from("Vendas - Pré Autorizações - Exportar - Dropdown Tipo Arquivo").hoverOver();
        pageField.from("Vendas - Pré Autorizações - Exportar - Dropdown Tipo Arquivo").click();
        pageField.from(formatType).hoverOver();
        pageField.from(formatType).click();
        pageField.from(formatType).hoverAway();

        Download download = page.waitForDownload(() ->
                pageField.from("Vendas - Pré Autorizações - Exportar - Botão Gerar Arquivo").click());

        return new ImmutablePair<>(download.createReadStream(), download.suggestedFilename());
    }

}
