package com.fiserv.qabrazil.pages.sales.salesUnmade;

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
import static com.fiserv.qabrazil.util.WaitUtil.retryIfGotException;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
public class SalesUnmadePage extends BasePage {
    @Autowired
    private SalesTodayPage salesTodayPage;
    @Autowired
    private FilesToAttachToScenario filesToAttachToScenario;

    public void navigateTo() {
        salesTodayPage.navigateTo();
        retryIfGotException(() -> {
            // TODO: change for data-testid
            page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Não Efetivadas")).first().click();
            startMonitoringRequests(page, contractConfig);
            page.waitForURL(Pattern.compile("^.*/NaoEfetivadas.*$"));
            closeAllPopups();
        });
        waitUntilTrue(360, () -> !hasNoLoadingBars());
    }

    public SalesUnmadeExportExcel getDownloadAsExcel() throws IOException {
        String formatType = "Vendas - Não Efetivadas - Exportar - Dropdown Tipo Arquivo - Excel";
        ImmutablePair<InputStream, String> readStreamFilename = downloadReport(formatType);

        if (readStreamFilename == null) return SalesUnmadeExportExcel.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFilename.getLeft(),
                CSVWrapper.CONTENT_TYPE, "Excel");

        return new SalesUnmadeExportExcel(
                new ExcelWrapper(bufferedInputStream, "Data da venda",readStreamFilename.getRight()));
    }

    public SalesUnmadeExportCsv getDownloadAsCsv() throws Exception {
        String formatType = "Vendas - Não Efetivadas - Exportar - Dropdown Tipo Arquivo - CSV";
        ImmutablePair<InputStream, String> readStreamFilename = downloadReport(formatType);

        if (readStreamFilename == null) return SalesUnmadeExportCsv.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFilename.getLeft(),
                CSVWrapper.CONTENT_TYPE, "Csv");

        return new SalesUnmadeExportCsv(new CSVWrapper(bufferedInputStream, readStreamFilename.getRight()));
    }

    private ImmutablePair<InputStream, String> downloadReport(String formatType) {
        PageField buttonCancelFilter = pageField.from("Vendas - Não Efetivadas - Botão Cancelar Filtro");
        if (buttonCancelFilter.elementIsVisibleRightNow()) {
            buttonCancelFilter.click();
        }
        PageField exportButton = pageField.from("Vendas - Não Efetivadas - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return null;

        exportButton.click();

        pageField.from("Vendas - Não Efetivadas - Exportar - Dropdown Tipo Arquivo").hoverOver();
        pageField.from("Vendas - Não Efetivadas - Exportar - Dropdown Tipo Arquivo").click();
        pageField.from(formatType).hoverOver();
        pageField.from(formatType).click();
        pageField.from(formatType).hoverAway();

        Download download = page.waitForDownload(() ->
                pageField.from("Vendas - Não Efetivadas - Exportar - Botão Gerar Arquivo").click());

        return new ImmutablePair<>(download.createReadStream(), download.suggestedFilename());
    }

}
