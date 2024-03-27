package com.fiserv.qabrazil.pages.sales;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;
import static com.fiserv.qabrazil.util.WaitUtil.retryUntilTrue;

@ScenarioComponent
public class SalesHistoryPage extends BasePage {
    public static class SalesHistoryExportExcel {
        public static final SalesHistoryExportExcel NULL = new SalesHistoryExportExcel(ExcelWrapper.NULL);

        private final ExcelWrapper excelWrapper;

        public SalesHistoryExportExcel(ExcelWrapper excelWrapper) {
            this.excelWrapper = excelWrapper;
        }

        public Currency getGrossSales() throws IOException, ParseException {
            String grossSales = excelWrapper.getCellAsText(11, 0);
            grossSales = grossSales.isEmpty() ? "R$ 0,00" : grossSales.replaceAll("Valor bruto: ", "");
            return Currency.parse(grossSales);
        }

        public String getNetSales() throws IOException {
            String grossSales = excelWrapper.getCellAsText(12, 0);
            return grossSales.isEmpty()? "R$ 0,00": grossSales.replaceAll("Valor líquido: ", "");
        }

        public String getCancelledSales() throws IOException {
            String grossSales = excelWrapper.getCellAsText(13, 0);
            return grossSales.isEmpty()? "R$ 0,00": grossSales.replaceAll("Valor cancelado: ", "");
        }

        public List<String> getECs() throws IOException {
            return excelWrapper.getColumnsAsText("Número do estabelecimento");
        }

        public Double getSumGrossValues() throws IOException {
            return excelWrapper.getColumnsAsCurrency("Valor bruto").stream()
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

    public void selectLastMonth() {
        retryUntilTrue(() -> page.getByLabel("toggle tooltip").getByRole(AriaRole.IMG).click(),
                () -> page.getByLabel("toggle tooltip").getByRole(AriaRole.IMG).isVisible());
        retryUntilTrue(() -> page.locator("div").filter(new Locator.FilterOptions().setHasText(Pattern.compile("^Mês Atual$"))).click(),
                () -> page.locator("div").filter(new Locator.FilterOptions().setHasText(Pattern.compile("^Mês Atual$"))).isVisible());
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

        return new SalesHistoryExportExcel(new ExcelWrapper(download.createReadStream(), 15));
    }
}
