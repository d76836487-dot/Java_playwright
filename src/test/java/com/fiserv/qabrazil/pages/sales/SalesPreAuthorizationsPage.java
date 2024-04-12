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
public class SalesPreAuthorizationsPage extends BasePage {
    @Autowired
    private SalesTodayPage salesTodayPage;

    public void navigateTo() {
        salesTodayPage.navigateTo();
        // TODO: change for data-testid
        page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Pré-autorizações")).first().click();
        startMonitoringRequests(page, contractConfig);
        page.waitForURL(Pattern.compile("^.*/PreAutorizacoes.*$"));
        closeAllPopups();
    }

    public SalesPreAuthorizationExportExcel getDownloadAsExcel() throws IOException {
        PageField buttonCancelFilter = pageField.from("Vendas - Pré Autorizações - Botão Cancelar Filtro");
        if (buttonCancelFilter.elementIsVisibleRightNow()) {
            buttonCancelFilter.click();
        }
        PageField exportButton = pageField.from("Vendas - Pré Autorizações - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return SalesPreAuthorizationExportExcel.NULL;

        exportButton.click();

        Download download = page.waitForDownload(() ->
                pageField.from("Vendas - Pré Autorizações - Exportar - Botão Gerar Arquivo").click());

        return new SalesPreAuthorizationExportExcel(
                new ExcelWrapper(download.createReadStream(), "Data da venda"));
    }

    public static class SalesPreAuthorizationExportExcel {
        public static final SalesPreAuthorizationExportExcel NULL = new SalesPreAuthorizationExportExcel(ExcelWrapper.NULL);

        private final ExcelWrapper excelWrapper;

        public SalesPreAuthorizationExportExcel(ExcelWrapper excelWrapper) {
            this.excelWrapper = excelWrapper;
        }

        public double getSumGrossAuthorized() throws IOException {
            int[] idx = excelWrapper.getIndexWhereColumn("Status", txt -> txt.equals("Autorizada"));
            return excelWrapper.getColumnsAsDoubleByIndex("Valor autorizado", idx).stream()
                    .mapToDouble(Double::doubleValue)
                    .sum();
        }

        public double getSumGrossToConfirm() throws IOException {
            int[] idx = excelWrapper.getIndexWhereColumn("Status", txt -> txt.equals("A Confirmar"));
            return excelWrapper.getColumnsAsDoubleByIndex("Valor autorizado", idx).stream()
                    .mapToDouble(Double::doubleValue)
                    .sum();
        }

        public double getGrossAuthorized() throws IOException, ParseException {
            return getValueAsDouble(2);
        }

        public double getGrossToConfirm() throws IOException, ParseException {
            return getValueAsDouble(3);
        }

        private double getValueAsDouble(int idx) throws IOException, ParseException {
            if (excelWrapper == ExcelWrapper.NULL) return 0.00;

            int row = excelWrapper.lookForRowStartingWithValue("Valor bruto: ");
            String cell = excelWrapper.getCellAsText(row, 0);
            String value = cell.replaceAll("[^\\d.,]+", "_")
//                    .replaceAll("\\.", "")
//                    .replaceAll(",", ".")
                    .split("_")[idx];
            return Currency.parse("R$ " + value).doubleValue();
        }

        public long getCountPre() throws IOException {
            return excelWrapper.getColumnsAsText("Valor autorizado").size();
        }

        public long getCount() throws IOException {
            if (excelWrapper == ExcelWrapper.NULL) return 0;

            String preText = "Total de vendas: ";
            int row = excelWrapper.lookForRowStartingWithValue(preText);
            String text = excelWrapper.getCellAsText(row, 0).replaceAll(preText, "");
            return Long.parseLong(text);

        }

        public List<String> getEcsFromCell() throws IOException {
            int row = excelWrapper.lookForRowStartingWithValue("Estabelecimento comercial:  ");
            String cell = excelWrapper.getCellAsText(row, 0).trim();
            return List.of(cell.replaceAll("Estabelecimento comercial: *", "")
                    .trim()
                    .split(" "));
        }

        public List<String> getEcFromColumn() throws IOException {
            return excelWrapper.getColumnsAsText("Estabelecimento comercial");
        }
    }
}
