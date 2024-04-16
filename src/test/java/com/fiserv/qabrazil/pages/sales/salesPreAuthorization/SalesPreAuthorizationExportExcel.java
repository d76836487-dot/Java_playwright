package com.fiserv.qabrazil.pages.sales.salesPreAuthorization;

import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.ExcelWrapper;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

public class SalesPreAuthorizationExportExcel implements SalesPreAuthorizationExport {
    public static final SalesPreAuthorizationExportExcel NULL = new SalesPreAuthorizationExportExcel(ExcelWrapper.NULL);

    private final ExcelWrapper excelWrapper;

    public SalesPreAuthorizationExportExcel(ExcelWrapper excelWrapper) {
        this.excelWrapper = excelWrapper;
    }

    public boolean hasHead() {
        return true;
    }

    public boolean isNull() {
        return this == NULL;
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
