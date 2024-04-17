package com.fiserv.qabrazil.pages.receivables.paid;

import com.fiserv.qabrazil.util.CSVWrapper;

import java.io.IOException;
import java.util.List;
import java.util.function.Predicate;

public non-sealed class ReceivablePaidExportCsvSimplified implements ReceivablePaidExport {
    public static final ReceivablePaidExportCsvSimplified NULL = new ReceivablePaidExportCsvSimplified(CSVWrapper.NULL);

    private final CSVWrapper csvWrapper;

    public ReceivablePaidExportCsvSimplified(CSVWrapper csvWrapper) {
        this.csvWrapper = csvWrapper;
    }

    public boolean hasHeader() {
        return false;
    }

    public boolean isNull() {
        return this == NULL;
    }

    public double getSumPaid() {
        return sumBasedOnStatus(txt -> txt.equals("Pago"));
    }

    public double getSumScheduled() {
        return sumBasedOnStatus(txt -> txt.equals("Enviado"));
    }

    public double getSumTransferred() {
        return sumBasedOnStatus(txt -> !txt.equals("Enviado") && !txt.equals("Pago"));
    }

    private double sumBasedOnStatus(Predicate<String> statusLookingFor) {
        int[] indexesToSum = csvWrapper.getIndexWhereColumn("Status", statusLookingFor);

        return csvWrapper.getColumnsAsDoubleByIndex("Valor do pagamento", indexesToSum).stream()
                .mapToDouble(Double::doubleValue)
                .sum();
    }

    public int getCountQuantityPaid() {
        return csvWrapper.getColumnsSizeWhere("Status", txt -> txt.equals("Pago"));
    }

    public int getCountQuantitySchedule() {
        return csvWrapper.getColumnsSizeWhere("Status", txt -> txt.equals("Enviado"));
    }

    public int getCountQuantityTransferred() {
        return csvWrapper.getColumnsSizeWhere("Status", txt -> !txt.equals("Enviado") && !txt.equals("Pago"));
    }

    public double getPaid() {
        return getSumPaid();
    }

    public double getScheduled() {
        return getSumScheduled();
    }

    public double getTransferred() {
        return getSumTransferred();
    }

    public int getQuantityPaid() {
        return getCountQuantityPaid();
    }

    public int getQuantityScheduled() {
        return getCountQuantitySchedule();
    }

    public int getQuantityTransferred() {
        return getCountQuantityTransferred();
    }

    public List<String> getEcsFromCell() throws IOException {
        throw new UnsupportedOperationException("Método não implementado.");
    }

    public List<String> getEcFromColumn() throws IOException {
        return csvWrapper.getColumnsAsText("EC");
    }
}
