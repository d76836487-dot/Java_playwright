package com.fiserv.qabrazil.pages.sales.salesHistory;

import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.ExcelWrapper;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

public class SalesHistoryExportExcel implements SalesHistoryExport {
    public static final SalesHistoryExportExcel NULL = new SalesHistoryExportExcel(ExcelWrapper.NULL);

    private final ExcelWrapper excelWrapper;

    public SalesHistoryExportExcel(ExcelWrapper excelWrapper) {
        this.excelWrapper = excelWrapper;
    }

    public boolean hasHeader() {
        return true;
    }

    public boolean isNull() {
        return this == NULL;
    }

    public double getGrossSales() throws IOException, ParseException {
        String preText = "Valor bruto: ";
        return getCurrency(preText).doubleValue();
    }

    public double getNetSales() throws IOException, ParseException {
        String preText = "Valor líquido: ";
        return getCurrency(preText).doubleValue();
    }

    public double getCancelledSales() throws IOException, ParseException {
        String preText = "Valor cancelado: ";
        return getCurrency(preText).doubleValue();
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
        return excelWrapper.getColumnsAsDouble(columnTitle).stream()
                .reduce(Double::sum)
                .orElse(0.0);
    }
}
