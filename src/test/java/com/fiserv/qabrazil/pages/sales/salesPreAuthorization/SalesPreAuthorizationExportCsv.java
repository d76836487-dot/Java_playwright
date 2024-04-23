package com.fiserv.qabrazil.pages.sales.salesPreAuthorization;

import com.fiserv.qabrazil.util.CSVWrapper;

import java.io.IOException;
import java.util.List;

public class SalesPreAuthorizationExportCsv implements SalesPreAuthorizationExport {
    public static final SalesPreAuthorizationExportCsv NULL = new SalesPreAuthorizationExportCsv(CSVWrapper.NULL);

    private final CSVWrapper csvWrapper;

    public SalesPreAuthorizationExportCsv(CSVWrapper csvWrapper) {
        this.csvWrapper = csvWrapper;
    }

    public boolean hasHead() {
        return false;
    }

    public boolean isNull() {
        return this == NULL;
    }

    public double getSumGrossAuthorized() {
        int[] indexes = csvWrapper.getIndexWhereColumn("Status", txt -> txt.equals("Autorizar"));
        return csvWrapper.getColumnsAsDoubleByIndex("Valor autorizado", indexes).stream()
                .mapToDouble(Double::doubleValue)
                .sum();
    }

    public double getSumGrossToConfirm() {
        int[] indexes = csvWrapper.getIndexWhereColumn("Status", txt -> txt.equals("A Confirmar"));
        return csvWrapper.getColumnsAsDoubleByIndex("Valor autorizado", indexes).stream()
                .mapToDouble(Double::doubleValue)
                .sum();
    }

    public double getGrossAuthorized() {
        return getSumGrossAuthorized();
    }

    public double getGrossToConfirm() {
        return getSumGrossToConfirm();
    }

    public long getCountPre() {
        return csvWrapper.getColumnsAsText("Valor autorizado").stream()
                .filter(v -> !v.equals("0"))
                .count();
    }

    public long getCount() throws IOException {
        if (csvWrapper == CSVWrapper.NULL) return 0;

        return csvWrapper.getColumnsAsText("Valor autorizado").size();
    }

    public List<String> getEcsFromCell() throws IOException {
        throw new UnsupportedOperationException("Método não implementado.");
    }

    public List<String> getEcFromColumn() throws IOException {
        return csvWrapper.getColumnsAsText("Estabelecimento comercial");
    }
}
