package com.fiserv.qabrazil.pages.sales.salesHistory;

import com.fiserv.qabrazil.util.ExcelWrapper;
import org.joda.time.Instant;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

public class SalesHistoryExportExcelDetailed implements SalesHistoryExport {
    public static final SalesHistoryExportExcelDetailed NULL = new SalesHistoryExportExcelDetailed(ExcelWrapper.NULL);

    private final ExcelWrapper excelWrapper;

    public SalesHistoryExportExcelDetailed(ExcelWrapper excelWrapper) {
        this.excelWrapper = excelWrapper;
    }

    public boolean hasHeader() {
        return true;
    }

    public boolean isNull() {
        return this == NULL;
    }

    public double getGrossSales() throws IOException, ParseException {
        return getSumGrossValues();
    }

    public double getNetSales() throws IOException {
        return getSumNetValues();
    }

    public double getCancelledSales() throws IOException {
        return getSumCancelledValues();
    }

    public List<String> getEcsFromCell() throws IOException {
        int row = excelWrapper.lookForRowStartingWithValue("Documento/EC :  ");
        String cell = excelWrapper.getCellAsText(row, 0);
        return List.of(cell.replaceAll("Documento/EC : *", "").split(","));
    }

    public List<String> getEcFromColumn() throws IOException {
        long start = Instant.now().getMillis();
        List<String> códigoDoEstabelecimento = excelWrapper.getColumnsAsText("Código do estabelecimento");
        long end = Instant.now().getMillis();
        System.out.printf("elapsed time for getEcFromColumn: %d%n", end - start);
        return códigoDoEstabelecimento;
    }

    public Double getSumGrossValues() throws IOException {
        return getSum("Valor bruto da parcela");
    }

    public Double getSumNetValues() throws IOException {
        return getSum("Valor líquido da parcela/transação");
    }

    public Double getSumCancelledValues() throws IOException {
        int[] indexes = excelWrapper.getIndexWhereColumn("Status", txt -> txt.equals("Cancelada"));
        return excelWrapper.getColumnsAsDoubleByIndex("Valor bruto da transação", indexes).stream()
                .mapToDouble(v -> v)
                .sum();
    }

    private Double getSum(String columnTitle) throws IOException {
        return excelWrapper.getColumnsAsDouble(columnTitle).stream()
                .reduce(Double::sum)
                .orElse(0.0);
    }
}
