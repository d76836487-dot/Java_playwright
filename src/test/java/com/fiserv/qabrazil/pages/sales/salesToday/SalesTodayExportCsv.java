package com.fiserv.qabrazil.pages.sales.salesToday;

import com.fiserv.qabrazil.util.CSVWrapper;

import java.util.List;

public final class SalesTodayExportCsv implements SalesTodayExport {
    public static final SalesTodayExportCsv NULL = new SalesTodayExportCsv(CSVWrapper.NULL);

    private final CSVWrapper csvWrapper;

    public SalesTodayExportCsv(CSVWrapper csvWrapper) {
        this.csvWrapper = csvWrapper;
    }

    public String getGrossSales() {
        return "R$ " + getSumGrossValues();
    }

    public String getUnpaidSales() {
        throw new UnsupportedOperationException("Método não implementado.");
    }

    public List<String> getECs() {
        return csvWrapper.getColumnsAsText("Número do Estabelecimento").stream()
                .distinct()
                .sorted()
                .toList();
    }

    public Double getSumGrossValues() {
        return csvWrapper.getColumnsAsDouble("Valor bruto").stream()
                .mapToDouble(Double::doubleValue)
                .sum();
    }
}
