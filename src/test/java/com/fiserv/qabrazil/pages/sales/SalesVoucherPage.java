package com.fiserv.qabrazil.pages.sales;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.components.FilesToAttachToScenario;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.sales.salesToday.SalesTodayPage;
import com.fiserv.qabrazil.util.CSVWrapper;
import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.fiserv.qabrazil.util.WaitUtil;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
public class SalesVoucherPage extends BasePage {
    @Autowired
    private FilesToAttachToScenario filesToAttachToScenario;

    public static class SalesVoucherExportExcel {
        public static final SalesVoucherExportExcel NULL = new SalesVoucherExportExcel(ExcelWrapper.NULL);

        private final ExcelWrapper excelWrapper;

        public SalesVoucherExportExcel(ExcelWrapper excelWrapper) {
            this.excelWrapper = excelWrapper;
        }

        public double getSumGross() throws IOException {
            return excelWrapper.getColumnsAsDouble("Valor bruto").stream()
                    .mapToDouble(Double::doubleValue)
                    .sum();
        }

        public double getGross() throws IOException, ParseException {
            String preText = "Valor bruto: ";
            int row = excelWrapper.lookForRowStartingWithValue(preText);
            String cell = excelWrapper.getCellAsText(row, 0).replaceAll(preText, "");
            cell = cell.isEmpty()? "R$ 0,00": cell.replace("R$", "R$ ");
            return Currency.parseCurrency(cell).doubleValue();
        }

        public long getCountPre() throws IOException {
            return excelWrapper.getColumnsAsText("Valor bruto").size();
        }

        public long getCount() throws IOException {
            String preText = "Total de vendas: ";
            int row = excelWrapper.lookForRowStartingWithValue(preText);
            String text = excelWrapper.getCellAsText(row, 0).replaceAll(preText, "");
            text = text.isEmpty()? "0": text;
            return Long.parseLong(text);

        }

        public List<String> getEcsFromCell() throws IOException {
            int row = excelWrapper.lookForRowStartingWithValue("Estabelecimento comercial:");
            String cell = excelWrapper.getCellAsText(row, 0).trim();
            return List.of(cell.replaceAll("Estabelecimento comercial: *", "").split(" "));
        }

        public List<String> getEcFromColumn() throws IOException {
            return excelWrapper.getColumnsAsText("Número do estabelecimento");
        }
    }

    @Autowired
    private SalesTodayPage salesTodayPage;

    public void navigateTo() {
        salesTodayPage.navigateTo();
        WaitUtil.retryIfGotException(() -> {
            // TODO: change for data-testid
            page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Voucher")).first().click();
            startMonitoringRequests(page, contractConfig);
            page.waitForURL(Pattern.compile("^.*/Voucher.*$"));
            closeAllPopups();
        });
        waitUntilTrue(360, this::hasNoLoadingBars);
    }

    public SalesVoucherExportExcel getDownloadAsExcel() throws IOException {
        PageField buttonCancelFilter = pageField.from("Vendas - Voucher - Botão Cancelar Filtro");
        if (buttonCancelFilter.elementIsVisibleRightNow()) {
            buttonCancelFilter.click();
        }
        PageField exportButton = pageField.from("Vendas - Voucher - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return SalesVoucherExportExcel.NULL;

        exportButton.click();

        Download download = page.waitForDownload(() ->
                pageField.from("Vendas - Voucher - Exportar - Botão Gerar Arquivo").click());

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(download.createReadStream(),
                CSVWrapper.CONTENT_TYPE, "Excel");

        return new SalesVoucherExportExcel(
                new ExcelWrapper(bufferedInputStream, "Data da venda", download.suggestedFilename()));
    }
}
