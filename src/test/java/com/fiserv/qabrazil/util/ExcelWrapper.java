package com.fiserv.qabrazil.util;

import org.apache.commons.lang3.StringUtils;
import org.dhatim.fastexcel.reader.Cell;
import org.dhatim.fastexcel.reader.ReadableWorkbook;
import org.dhatim.fastexcel.reader.ReadingOptions;
import org.dhatim.fastexcel.reader.Sheet;

import java.io.*;
import java.text.ParseException;
import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.IntStream;

public class ExcelWrapper implements AutoCloseable {
    public static final ExcelWrapper NULL = new ExcelWrapper();
    private final InputStream inputStream;
    private final ReadableWorkbook workbook;
    private final Sheet sheet;
    private final int rowTableStart;

    private ExcelWrapper() {
        inputStream = null;
        workbook = null;
        sheet = null;
        rowTableStart = 0;
    }

    public ExcelWrapper(InputStream inputStream, int rowTableStart) throws IOException {
        this.inputStream = inputStream;
        workbook = new ReadableWorkbook(inputStream);
        sheet = workbook.getFirstSheet();
        this.rowTableStart = rowTableStart;
    }

    public ExcelWrapper(InputStream inputStream, String rowTableStartName) throws IOException {
        this.inputStream = inputStream;
        workbook = new ReadableWorkbook(inputStream, new ReadingOptions(true, false));
        sheet = workbook.getFirstSheet();
        this.rowTableStart = lookForRowStartingWithValue(rowTableStartName, 0);
    }

    public int lookForRowStartingWithValue(String rowTableStartName) throws IOException {
        return lookForRowStartingWithValue(rowTableStartName, 0);
    }

    public int lookForRowStartingWithValue(String rowTableStartName, int col) throws IOException {
        if (sheet == null) return 0;

        for (int row = 0; row < sheet.read().size(); row++) {
            if (getCellAsText(row, col).contains(rowTableStartName)) return row;
        }

        throw new RuntimeException("Não encontrei onde inicia a tabela de valores com texto '%s'".formatted(rowTableStartName));
    }

    @Override
    public void close() throws Exception {
        if (workbook != null) workbook.close();
        if (inputStream != null) inputStream.close();
    }

    public List<Double> getColumnsAsDoubleByIndex(String columnName, int[] indexes) throws IOException {
        List<String> texts = getColumnsAsText(columnName);
        return Arrays.stream(indexes)
                .mapToObj(texts::get)
                .map(this::convertToDouble)
                .toList();
    }

    public List<Double> getColumnsAsDouble(String columnName) throws IOException {
        return getColumnsAsText(columnName).stream()
                .map(this::convertToDouble)
                .toList();
    }

    private double convertToDouble(String value) {
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException e) {
            try {
                return Currency.parseCurrency(value).doubleValue();
            } catch (ParseException ignore) {
                throw new RuntimeException("Falha ao converter moeda %s".formatted(value));
            }
        }
    }

    public int[] getIndexWhereColumn(String columnName, Predicate<String> predicate) throws IOException {
        List<String> texts = getColumnsAsText(columnName);
        return IntStream.range(0, texts.size())
                .filter(i -> predicate.test(texts.get(i)))
                .toArray();
    }

    public int getColumnsSizeWhere(String columnName, Predicate<String> predicate) throws IOException {
        return (int) getColumnsAsText(columnName).stream()
                .filter(predicate)
                .count();
    }

    public List<String> getColumnsAsText(String columnName) throws IOException {
        if (sheet == null) return List.of();

        int col = getHeaderColumn(columnName);

        return IntStream.range(rowTableStart + 1, sheet.read().size())
                .parallel()
                .mapToObj(row -> getCellAsText(row, col))
                .filter(cell -> !cell.isEmpty())
                .toList();
    }

    private int getHeaderColumn(String columnName) throws IOException {
        for (int col = 0; col < sheet.read().get(0).getCellCount(); col++) {
            if (getCellAsText(rowTableStart, col).equals(columnName)) return col;
        }

        throw new RuntimeException("Coluna %s do excel não foi encontrada".formatted(columnName));
    }

    public String[] getTableHeaderCells() throws Exception {
        return getRow(rowTableStart);
    }

    public String[] getRow(int row) throws Exception {
        return sheet.read().get(row).stream()
                .map(Cell::getText)
                .filter(StringUtils::isNotEmpty)
                .toArray(String[]::new);
    }

    public String getCellAsText(int row, int column)  {
        try {
            if (sheet == null) return "";
            if (sheet.read().get(row) == null) return "";
            if (sheet.read().get(row).getCell(column) == null) return "";

            return sheet.read().get(row).getCell(column).getText();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
