package com.fiserv.qabrazil.pages.receipts;

import com.fiserv.qabrazil.pages.receivables.ReceivableExport;
import com.fiserv.qabrazil.util.CSVWrapper;

public class ReceivableExportCsv implements ReceivableExport {
    public static final ReceivableExport NULL = new ReceivableExportCsv(CSVWrapper.NULL);
    private final CSVWrapper csvWrapper;

    public ReceivableExportCsv(CSVWrapper csvWrapper) {
        this.csvWrapper = csvWrapper;
    }

    @Override
    public boolean looksHaveData() {
        return csvWrapper.getRow(0).length > 0;
    }
}
