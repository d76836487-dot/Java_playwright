package com.fiserv.qabrazil.pages.sales;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;

@ScenarioComponent
public class SalesUnmadePage extends BasePage {
    public static class SalesUnmadeExportExcel {
        public static final SalesUnmadeExportExcel NULL = new SalesUnmadeExportExcel(ExcelWrapper.NULL);

        private final ExcelWrapper excelWrapper;

        public SalesUnmadeExportExcel(ExcelWrapper excelWrapper) {
            this.excelWrapper = excelWrapper;
        }

        public int getRefused() throws IOException {
            String preText = "Total de Vendas Recusadas: ";
            return getValue(preText);
        }

        public int getUnmade() throws IOException {
            String preText = "Total de Vendas Estornadas: ";
            return getValue(preText);
        }

        public List<String> getEcsFromCell() throws IOException {
            int row = excelWrapper.lookForRowStartingWithValue("Estabelecimento comercial:");
            String cell = excelWrapper.getCellAsText(row, 0);
            return List.of(cell.replaceAll("Estabelecimento comercial: *", "").split(","));
        }

        private int getValue(String preText) throws IOException {
            int row = excelWrapper.lookForRowStartingWithValue(preText);
            String cell = excelWrapper.getCellAsText(row, 0);
            cell = cell.isEmpty() ? "0" : cell.replaceAll(preText, "");
            return Integer.parseInt(cell);
        }

        public List<String> getEcFromColumn() throws IOException {
            return excelWrapper.getColumnsAsText("Número do estabelecimento");
        }

        public int getRefusedDetailsCount() throws IOException {
            return excelWrapper.getColumnsSizeWhere("Status", txt->txt.equals("Recusadas"));
        }

        public int getUnmadeDetailsCount() throws IOException {
            return excelWrapper.getColumnsSizeWhere("Status", txt->txt.equals("Estornadas"));
        }
    }

    @Autowired
    private SalesTodayPage salesTodayPage;

    public void navigateTo() {
        salesTodayPage.navigateTo();
        // TODO: change for data-testid
        page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Não Efetivadas")).first().click();
        startMonitoringRequests(page, contractConfig);
        page.waitForURL(Pattern.compile("^.*/NaoEfetivadas.*$"));
    }

    public SalesUnmadeExportExcel getDownloadAsExcel() throws IOException {
        PageField buttonCancelFilter = pageField.from("Vendas - Não Efetivadas - Botão Cancelar Filtro");
        if (buttonCancelFilter.elementIsVisibleRightNow()) {
            buttonCancelFilter.click();
        }
        PageField exportButton = pageField.from("Vendas - Não Efetivadas - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return SalesUnmadeExportExcel.NULL;

        exportButton.click();

        Download download = page.waitForDownload(() ->
                pageField.from("Vendas - Não Efetivadas - Exportar - Botão Gerar Arquivo").click());

        return new SalesUnmadeExportExcel(new ExcelWrapper(download.createReadStream(), "Data da venda"));
    }
}
