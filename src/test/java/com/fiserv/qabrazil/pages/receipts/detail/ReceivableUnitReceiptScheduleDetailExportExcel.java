package com.fiserv.qabrazil.pages.receipts.detail;

import com.fiserv.qabrazil.util.ExcelWrapper;

import java.io.IOException;

public class ReceivableUnitReceiptScheduleDetailExportExcel {
    private final ExcelWrapper excelWrapper;

    public ReceivableUnitReceiptScheduleDetailExportExcel(ExcelWrapper excelWrapper) {
        this.excelWrapper = excelWrapper;
    }

    public double getField(String excelField) throws IOException {
        int row = excelWrapper.lookForRowStartingWithValue(excelField);
        return excelWrapper.getCellAsDouble(row, 1);
    }
}
