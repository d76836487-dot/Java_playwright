package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;

import java.io.IOException;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.List;
import java.util.function.Predicate;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;

@ScenarioComponent
public class ReceivablePaidPage extends BasePage {
    public static class ReceivablePaidExportExcel {
        public static final ReceivablePaidExportExcel NULL = new ReceivablePaidExportExcel(ExcelWrapper.NULL);

        private final ExcelWrapper excelWrapper;

        public ReceivablePaidExportExcel(ExcelWrapper excelWrapper) {
            this.excelWrapper = excelWrapper;
        }

        public double getSumPaid() throws IOException {
            return sumBasedOnStatus(txt -> txt.equals("Pago"));
        }

        public double getSumScheduled() throws IOException {
            return sumBasedOnStatus(txt -> txt.equals("Enviado"));
        }
        public double getSumTransferred() throws IOException {
            return sumBasedOnStatus(txt -> !txt.equals("Enviado") && !txt.equals("Pago"));
        }

        private double sumBasedOnStatus(Predicate<String> statusLookingFor) throws IOException {
            int[] indexesToSum = excelWrapper.getIndexWhereColumn("Status", statusLookingFor);

            return excelWrapper.getColumnsAsCurrencyByIndex("Valor pagamento", indexesToSum).stream()
                    .mapToDouble(Double::doubleValue)
                    .sum();
        }

        public double getPaid() throws IOException, ParseException {
            return getValueHeader("Total recebido", 0);
        }

        public double getScheduled() throws IOException, ParseException {
            return getValueHeader("Total agendado", 1);
        }

        public double getTransferred() throws IOException, ParseException {
            return getValueHeader("Total cedido", 2);
        }

        private double getValueHeader(String preText, int col) throws IOException, ParseException {
            int row = excelWrapper.lookForRowStartingWithValue(preText, col);
            String cell = excelWrapper.getCellAsText(row + 1, col).trim().replace("R$", "R$ ");
            cell = cell.isEmpty()? "R$ 0,00": cell;
            return Currency.parseCurrency(cell).doubleValue();
        }

        public List<String> getEcsFromCell() throws IOException {
            int row = excelWrapper.lookForRowStartingWithValue("Estabelecimento comercial", 2);
            String cell = excelWrapper.getCellAsText(row + 1, 2).trim();
            return List.of(cell.split(","));
        }

        public List<String> getEcFromColumn() throws IOException {
            return excelWrapper.getColumnsAsText("EC");
        }
    }

    public void navigateTo() {
        pageField.from("Menu Lateral - Recebimentos").click();
        pageField.from("Menu Lateral - Recebimentos Resumo").click();
        startMonitoringRequests(page, contractConfig);
        page.waitForURL(Pattern.compile("^.*/RecebimentosPagosV2$"));
    }

    public ReceivablePaidExportExcel getDownloadAsExcel() throws IOException {
        PageField buttonCancelFilter = pageField.from("Recebimentos - Pagos - Botão Cancelar Filtro");
        if (buttonCancelFilter.elementIsVisibleRightNow()) {
            buttonCancelFilter.click();
        }
        PageField exportButton = pageField.from("Recebimentos - Pagos - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return ReceivablePaidExportExcel.NULL;

        exportButton.click();

        Download download = page.waitForDownload(() ->
                pageField.from("Recebimentos - Pagos - Exportar - Botão Gerar Arquivo").click());

        download.saveAs(Paths.get("target/" + download.suggestedFilename()));

        return new ReceivablePaidExportExcel(
                new ExcelWrapper(download.createReadStream(), "Data do pagamento"));
    }
}
