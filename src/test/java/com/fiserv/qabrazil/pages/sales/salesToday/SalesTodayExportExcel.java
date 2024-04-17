package com.fiserv.qabrazil.pages.sales.salesToday;

import com.fiserv.qabrazil.util.ExcelWrapper;

import java.io.IOException;
import java.util.List;

public final class SalesTodayExportExcel implements SalesTodayExport {
    public static final SalesTodayExportExcel NULL = new SalesTodayExportExcel(ExcelWrapper.NULL);

    private final ExcelWrapper excelWrapper;

    public SalesTodayExportExcel(ExcelWrapper excelWrapper) {
        this.excelWrapper = excelWrapper;
    }

    public boolean hasHeader() {
        return true;
    }

    public boolean isNull() {
        return this == NULL;
    }

    public String getGrossSales() throws IOException {
        String grossSales = excelWrapper.getCellAsText(13, 0);
        return grossSales.isEmpty() ? "R$ 0,00" : grossSales.replaceAll("Valor bruto: ", "");
    }

    public String getUnpaidSales() throws IOException {
        String grossSales = excelWrapper.getCellAsText(14, 0);
        return grossSales.isEmpty() ? "R$ 0,00" : grossSales.replaceAll("Valor não efetivadas: ", "");
    }

    public List<String> getEcFromColumn() throws IOException {
        return excelWrapper.getColumnsAsText("Número do estabelecimento").stream()
                .distinct()
                .sorted()
                .toList();
    }

    public Double getSumGrossValues() throws IOException {
        return excelWrapper.getColumnsAsDouble("Valor bruto").stream()
                .reduce(Double::sum)
                .orElse(0.0);
    }
}
