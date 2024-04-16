package com.fiserv.qabrazil.pages.sales.salesUnmade;

import com.fiserv.qabrazil.util.CSVWrapper;

import java.io.IOException;
import java.util.List;

public class SalesUnmadeExportCsv implements SalesUnmadeExport {
    public static final SalesUnmadeExportCsv NULL = new SalesUnmadeExportCsv(CSVWrapper.NULL);

    private final CSVWrapper csvWrapper;

    public SalesUnmadeExportCsv(CSVWrapper csvWrapper) {
        this.csvWrapper = csvWrapper;
    }

    public boolean hasHeader() {
        return false;
    }

    public boolean isNull() {
        return this == NULL;
    }

    public int getRefused() {
        return getRefusedDetailsCount();
    }

    public int getUnmade() {
        return getUnmadeDetailsCount();
    }

    public List<String> getEcsFromCell() throws IOException {
        throw new UnsupportedOperationException("Método não implementado.");
    }

    public List<String> getEcFromColumn() throws IOException {
        return csvWrapper.getColumnsAsText("Número do estabelecimento");
    }

    public int getRefusedDetailsCount() {
        return csvWrapper.getColumnsSizeWhere("Status", txt -> txt.equals("Recusada"));
    }

    public int getUnmadeDetailsCount() {
        return csvWrapper.getColumnsSizeWhere("Status", txt -> txt.equals("Estornada"));
    }
}
