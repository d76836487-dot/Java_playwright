package com.fiserv.qabrazil.pages.receivables;

import com.fiserv.qabrazil.util.ExcelWrapper;

public class ReceivableExportExcel implements ReceivableExport {
    public static final ReceivableExport NULL = new ReceivableExportExcel(ExcelWrapper.NULL);

    private final ExcelWrapper excelWrapper;

    public ReceivableExportExcel(ExcelWrapper excelWrapper) {
        this.excelWrapper = excelWrapper;
    }

    @Override
    public String getResume() {
        return excelWrapper.getCell(0, 0).getText();
    }
}
