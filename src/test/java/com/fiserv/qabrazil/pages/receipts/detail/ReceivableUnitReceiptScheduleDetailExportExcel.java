package com.fiserv.qabrazil.pages.receipts.detail;

import com.fiserv.qabrazil.util.ExcelWrapper;

import java.io.IOException;

public class ReceivableUnitReceiptScheduleDetailExportExcel {
    private final ExcelWrapper excelWrapper;

    private final String fileName;

    public ReceivableUnitReceiptScheduleDetailExportExcel(ExcelWrapper excelWrapper, String fileName) {
        this.excelWrapper = excelWrapper;
        this.fileName = fileName;
    }

    public String getFileName() {
        return fileName;
    }

    public double getFieldFirstColAsDouble(String excelField) throws IOException {
        int row = excelWrapper.lookForRowStartingWithValue(excelField);
        return excelWrapper.getCellAsDouble(row, 1);
    }

    public String getFieldFirstColAsText(String excelField) throws IOException {
        int row = excelWrapper.lookForRowStartingWithValue(excelField);
        return excelWrapper.getCellAsText(row, 1);
    }

    public String getFieldFirstColFormat(String excelField) throws IOException {
        int row = excelWrapper.lookForRowStartingWithValue(excelField);
        return excelWrapper.getCell(row, 1).getDataFormatString();
    }

    public void goToSheet(String sheetName) throws IOException {
        String rowTableStartName = getStartTableName(sheetName);
        excelWrapper.goToSheet(sheetName, rowTableStartName);
    }

    private String getStartTableName(String sheetName) {
        return switch (sheetName) {
            case "Vendas vinculadas" -> "Produto ";
            case "Pagamentos", "Créditos e Deduções", "Contratos" -> "Produto";
            default -> throw new RuntimeException("Nome de aba %s desconhecida".formatted(sheetName));
        };
    }

    public String[] getTableHeaderCells() {
        return excelWrapper.getTableHeaderCells();
    }

    public ExcelWrapper getExcelWrapper() {
        return excelWrapper;
    }
}
