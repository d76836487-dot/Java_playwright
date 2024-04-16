package com.fiserv.qabrazil.pages.sales.salesHistory;

import com.fiserv.qabrazil.util.CSVWrapper;
import com.fiserv.qabrazil.util.Currency;

import java.io.IOException;
import java.util.List;

public class SalesHistoryExportCsvDetailed implements SalesHistoryExport {
    public static final SalesHistoryExportCsvDetailed NULL = new SalesHistoryExportCsvDetailed(CSVWrapper.NULL);

    private final CSVWrapper csvWrapper;

    public SalesHistoryExportCsvDetailed(CSVWrapper csvWrapper) {
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
        return csvWrapper.getColumnsAsCurrency("Valor bruto da parcela").stream()
                .mapToDouble(Currency::doubleValue)
                .sum();
    }

    public double getNetSales() {
        return csvWrapper.getColumnsAsCurrency("Valor líquido da parcela/transação").stream()
                .mapToDouble(Currency::doubleValue)
                .sum();
    }

    public double getCancelledSales() {
        int[] indexes = csvWrapper.getIndexWhereColumn("Status", txt -> txt.equals("Cancelada"));

        return csvWrapper.getColumnsAsCurrencyByIndex("Valor bruto da parcela", indexes).stream()
                .mapToDouble(Currency::doubleValue)
                .sum();
    }

    public List<String> getEcsFromCell() throws IOException {
        throw new UnsupportedOperationException("Método não implementado.");
    }

    public List<String> getEcFromColumn() throws IOException {
        return csvWrapper.getColumnsAsText("Código de estabelecimento");
    }
}
