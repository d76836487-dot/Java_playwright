package com.fiserv.qabrazil.pages.sales.salesUnmade;

import com.fiserv.qabrazil.util.ExcelWrapper;

import java.io.IOException;
import java.util.List;

public non-sealed class SalesUnmadeExportExcel implements SalesUnmadeExport {
    public static final SalesUnmadeExportExcel NULL = new SalesUnmadeExportExcel(ExcelWrapper.NULL);

    private final ExcelWrapper excelWrapper;

    public SalesUnmadeExportExcel(ExcelWrapper excelWrapper) {
        this.excelWrapper = excelWrapper;
    }

    public boolean hasHeader() {
        return true;
    }

    public boolean isNull() {
        return this == NULL;
    }

    public int getRefused() throws IOException {
        String preText = "Total de Vendas Recusadas: ";
        return getValue(preText);
    }

    public int getUnmade() throws IOException {
        String preText = "Total de Vendas Estornadas: ";
        return getValue(preText);
    }

    public List<String> getEcsFromCell() throws IOException {
        int row = excelWrapper.lookForRowStartingWithValue("Estabelecimento comercial:");
        String cell = excelWrapper.getCellAsText(row, 0);
        return List.of(cell.replaceAll("Estabelecimento comercial: *", "").split(","));
    }

    private int getValue(String preText) throws IOException {
        int row = excelWrapper.lookForRowStartingWithValue(preText);
        String cell = excelWrapper.getCellAsText(row, 0);
        cell = cell.isEmpty() ? "0" : cell.replaceAll(preText, "");
        return Integer.parseInt(cell);
    }

    public List<String> getEcFromColumn() throws IOException {
        return excelWrapper.getColumnsAsText("Número do estabelecimento");
    }

    public int getRefusedDetailsCount() throws IOException {
        return excelWrapper.getColumnsSizeWhere("Status", txt -> txt.equals("Recusada"));
    }

    public int getUnmadeDetailsCount() throws IOException {
        return excelWrapper.getColumnsSizeWhere("Status", txt -> txt.equals("Estornada"));
    }
}
