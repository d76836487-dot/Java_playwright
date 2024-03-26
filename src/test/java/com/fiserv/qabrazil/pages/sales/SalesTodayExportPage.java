package com.fiserv.qabrazil.pages.sales;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;

import java.io.IOException;
import java.util.List;

@ScenarioComponent
public class SalesTodayExportPage extends BasePage {
    public static class SalesTodayExportExcel {
        public static final SalesTodayExportExcel NULL = new SalesTodayExportExcel(ExcelWrapper.NULL);

        private final ExcelWrapper excelWrapper;

        public SalesTodayExportExcel(ExcelWrapper excelWrapper) {
            this.excelWrapper = excelWrapper;
        }

        public String getGrossSales() throws IOException {
            String grossSales = excelWrapper.getCellAsText(13, 0);
            return grossSales.isEmpty()? "R$ 0,00": grossSales.replaceAll("Valor bruto: ", "");
        }

        public String getUnpaidSales() throws IOException {
            String grossSales = excelWrapper.getCellAsText(14, 0);
            return grossSales.isEmpty()? "R$ 0,00": grossSales.replaceAll("Valor não efetivadas: ", "");
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

    public SalesTodayExportExcel getDownloadAsExcel() throws IOException {
        if (pageField.from("Home - Card Vendas Hoje - Ver Tudo").elementIsVisibleRightNow()) {
            pageField.from("Home - Card Vendas Hoje - Ver Tudo").click();
        }
        PageField exportButton = pageField.from("Vendas Hoje - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return SalesTodayExportExcel.NULL;

        exportButton.click();
        pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo").hoverOver();
        pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo").click();
        pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo - Excel").hoverOver();
        pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo - Excel").click();
        pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo - Excel").hoverAway();

        Download download = page.waitForDownload(() ->
                pageField.from("Vendas Hoje - Exportar - Dropdown Tipo Arquivo - Gerar arquivo").click());

        return new SalesTodayExportExcel(new ExcelWrapper(download.createReadStream(), 16));
    }
}