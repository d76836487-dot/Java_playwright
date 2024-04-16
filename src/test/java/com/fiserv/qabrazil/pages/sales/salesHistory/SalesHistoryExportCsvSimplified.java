package com.fiserv.qabrazil.pages.sales.salesHistory;

import com.fiserv.qabrazil.util.CSVWrapper;
import com.fiserv.qabrazil.util.Currency;

import java.io.IOException;
import java.util.List;

public class SalesHistoryExportCsvSimplified implements SalesHistoryExport {
    public static final SalesHistoryExportCsvSimplified NULL = new SalesHistoryExportCsvSimplified(CSVWrapper.NULL);

    private final CSVWrapper csvWrapper;

    public SalesHistoryExportCsvSimplified(CSVWrapper csvWrapper) {
        this.csvWrapper = csvWrapper;
    }

    public boolean hasHeader() {
        return false;
    }

    public boolean isNull() {
        return this == NULL;
    }

    public Double getSumGrossValues() {
        return getGrossSales();
    }

    public Double getSumNetValues() {
        return getNetSales();
    }

    public Double getSumCancelledValues() {
        return getCancelledSales();
    }

    public double getGrossSales() {
        return csvWrapper.getColumnsAsCurrency("Valor bruto").stream()
                .mapToDouble(Currency::doubleValue)
                .sum();
    }

    public double getNetSales() {
        return csvWrapper.getColumnsAsCurrency("Valor líquido").stream()
                .mapToDouble(Currency::doubleValue)
                .sum();
    }

    public double getCancelledSales() {
        return csvWrapper.getColumnsAsCurrency("Valor cancelado").stream()
                .mapToDouble(Currency::doubleValue)
                .sum();
    }

    public List<String> getEcsFromCell() throws IOException {
        throw new UnsupportedOperationException("Método não implementado.");
    }

    public List<String> getEcFromColumn() throws IOException {
        return csvWrapper.getColumnsAsText("Número do estabelecimento");
    }
}
