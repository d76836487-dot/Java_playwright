package com.fiserv.qabrazil.pages.sales;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;

@ScenarioComponent
public class SalesHistoryPage extends BasePage {
    public static class SalesHistoryExportExcel {
        public static final SalesHistoryExportExcel NULL = new SalesHistoryExportExcel(ExcelWrapper.NULL);

        private final ExcelWrapper excelWrapper;

        public SalesHistoryExportExcel(ExcelWrapper excelWrapper) {
            this.excelWrapper = excelWrapper;
        }

        public Currency getGrossSales() throws IOException, ParseException {
            String preText = "Valor bruto: ";
            return getCurrency(preText);
        }

        public Currency getNetSales() throws IOException, ParseException {
            String preText = "Valor líquido: ";
            return getCurrency(preText);
        }

        public Currency getCancelledSales() throws IOException, ParseException {
            String preText = "Valor cancelado: ";
            return getCurrency(preText);
        }

        public List<String> getEcsFromCell() throws IOException {
            int row = excelWrapper.lookForRowStartingWithValue("Estabelecimento comercial:");
            String cell = excelWrapper.getCellAsText(row, 0);
            return List.of(cell.replaceAll("Estabelecimento comercial: *", "").split(","));
        }

        private Currency getCurrency(String preText) throws IOException, ParseException {
            int row = excelWrapper.lookForRowStartingWithValue(preText);
            String cell = excelWrapper.getCellAsText(row, 0);
            cell = cell.isEmpty() ? "R$ 0,00" : cell.replaceAll(preText, "");
            cell = cell.replaceAll("(R\\$)\\D*", "$1 ");
            return Currency.parse(cell);
        }

        public List<String> getEcFromColumn() throws IOException {
            return excelWrapper.getColumnsAsText("Número do estabelecimento");
        }

        public Double getSumGrossValues() throws IOException {
            return getSum("Valor bruto");
        }

        public Double getSumNetValues() throws IOException {
            return getSum("Valor líquido");
        }

        public Double getSumCancelledValues() throws IOException {
            return getSum("Valor cancelado");
        }

        private Double getSum(String columnTitle) throws IOException {
            return excelWrapper.getColumnsAsCurrency(columnTitle).stream()
                    .reduce(Double::sum)
                    .orElse(0.0);
        }
    }

    @Autowired
    private SalesTodayPage salesTodayPage;

    public void navigateTo() {
        salesTodayPage.navigateTo();
        // TODO: change for data-testid
        page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Histórico de vendas")).first().click();
        startMonitoringRequests(page, contractConfig);
        page.waitForURL(Pattern.compile("^.*/HistoricodeVendas.*$"));
    }

    public SalesHistoryExportExcel getDownloadAsExcel() throws IOException {
        if (pageField.from("Vendas - Histórico de Vendas - Botão Cancelar Filtro").elementIsVisibleRightNow()) {
            pageField.from("Vendas Hoje - Botão Cancelar Filtro").click();
        }
        PageField exportButton = pageField.from("Vendas - Histórico de Vendas - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return SalesHistoryExportExcel.NULL;

        exportButton.click();

        Download download = page.waitForDownload(() ->
                pageField.from("Vendas - Histórico de Vendas - Exportar - Botão Gerar Arquivo").click());

        return new SalesHistoryExportExcel(
                new ExcelWrapper(download.createReadStream(), "Data da venda"));
    }
}
