package com.fiserv.qabrazil.pages.receivables;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.receivables.paid.ReceivablePaidPage;
import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;

@ScenarioComponent
public class ReceivableFuturePage extends BasePage {
    public static class ReceivableFutureExportExcel {
        public static final ReceivableFutureExportExcel NULL = new ReceivableFutureExportExcel(ExcelWrapper.NULL);

        private final ExcelWrapper excelWrapper;

        public ReceivableFutureExportExcel(ExcelWrapper excelWrapper) {
            this.excelWrapper = excelWrapper;
        }

        public double getSumForeseen() throws IOException {
            return excelWrapper.getColumnsAsDouble("Valor líquido").stream()
                    .mapToDouble(Double::doubleValue)
                    .sum();
        }

        public int getCountQuantitySales() throws IOException {
            return excelWrapper.getColumnsAsText("Valor líquido").size();
        }

        public List<String> getEcsFromCell() throws IOException {
            String cell = getTextFromHeader("Estabelecimento comercial: ").trim();
            return List.of(cell.split(" "));
        }

        public double getForeseen() throws IOException, ParseException {
            String cell = getTextFromHeader("Valor líquido previsto: ");
            return Currency.parseCurrency(cell.replace("R$", "R$ ")).doubleValue();
        }

        public int getQuantitySales() throws IOException {
            String cell = getTextFromHeader("Total de vendas: ");
            return Integer.parseInt(cell);
        }

        private String getTextFromHeader(String preText) throws IOException {
            int row = excelWrapper.lookForRowStartingWithValue(preText);
            return excelWrapper.getCellAsText(row, 0).replace(preText, "");
        }

        public List<String> getEcFromColumn() throws IOException {
            return excelWrapper.getColumnsAsText("Número do estabelecimento");
        }
    }

    @Autowired
    ReceivablePaidPage receivablePaidPage;
    public void navigateTo() {
        receivablePaidPage.navigateTo();

        // TODO: selecionar tab aqui
        page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Futuros")).first().click();
        startMonitoringRequests(page, contractConfig);
        page.waitForURL(Pattern.compile("^.*/RecebimentosFuturos.*$"));
        closeAllPopups();
    }

    public ReceivableFutureExportExcel getDownloadAsExcel() throws IOException {
        PageField buttonCancelFilter = pageField.from("Recebimentos - Futuros - Botão Cancelar Filtro");
        if (buttonCancelFilter.elementIsVisibleRightNow()) {
            buttonCancelFilter.click();
        }
        PageField exportButton = pageField.from("Recebimentos - Futuros - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return ReceivableFutureExportExcel.NULL;

        exportButton.click();

        Download download = page.waitForDownload(() ->
                pageField.from("Recebimentos - Futuros - Exportar - Botão Gerar Arquivo").click());

        download.saveAs(Paths.get("target/" + download.suggestedFilename()));

        return new ReceivableFutureExportExcel(
                new ExcelWrapper(download.createReadStream(), "Data prevista de pagamento"));
    }
}
