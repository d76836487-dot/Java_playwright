package com.fiserv.qabrazil.util;

import org.apache.commons.lang3.StringUtils;
import org.dhatim.fastexcel.reader.*;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.IntStream;

public class ExcelWrapper implements AutoCloseable {
    public static final ExcelWrapper NULL = new ExcelWrapper();
    public static final String CONTENT_TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    private final InputStream inputStream;
    private final ReadableWorkbook workbook;
    private Sheet sheet;
    private int rowTableStart;
    private final String filename;

    private List<Row> rows;

    private ExcelWrapper() {
        inputStream = null;
        workbook = null;
        sheet = null;
        rowTableStart = 0;
        filename = "NULL";
        rows = Collections.emptyList();
    }

    public ExcelWrapper(InputStream inputStream, int rowTableStart) throws IOException {
        this.inputStream = inputStream;
        workbook = new ReadableWorkbook(inputStream, new ReadingOptions(true, false));
        sheet = workbook.getFirstSheet();
        rows = sheet.read();
        this.rowTableStart = rowTableStart;
        filename = "";
    }

    public ExcelWrapper(InputStream inputStream, String rowTableStartName, String filename) throws IOException {
        this.filename = filename;
        this.inputStream = inputStream;
        workbook = new ReadableWorkbook(inputStream, new ReadingOptions(true, false));
        sheet = workbook.getFirstSheet();
        rows = sheet.read();
        this.rowTableStart = lookForRowStartingWithValue(rowTableStartName, 0);
    }

    public int lookForRowStartingWithValue(String rowTableStartName) throws IOException {
        return lookForRowStartingWithValue(rowTableStartName, 0);
    }

    public int lookForRowStartingWithValue(String rowTableStartName, int col) throws IOException {
        if (sheet == null) return 0;

        for (int row = 0; row < rows.size(); row++) {
            if (getCellAsText(row, col).contains(rowTableStartName)) return row;
        }

        throw new RuntimeException("Não encontrei onde inicia a tabela de valores com texto '%s' no Excel %s".formatted(rowTableStartName, filename));
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

    public List<String> getColumnsFormatForNotEmptyCells(String columnName) {
        if (sheet == null) return List.of();

        int col = getHeaderColumn(columnName);

        return IntStream.range(rowTableStart + 1, rows.size())
                .parallel()
                .mapToObj(row -> getCell(row, col))
                .filter(cell -> cellIsNotEmpty(cell) && StringUtils.isNotEmpty(cell.getDataFormatString()))
                .map(Cell::getDataFormatString)
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

        return IntStream.range(rowTableStart + 1, rows.size())
                .parallel()
                .mapToObj(row -> getCellAsText(row, col))
                .filter(cell -> !cell.isEmpty())
                .toList();
    }

    private int getHeaderColumn(String columnName) {
        for (int col = 0; col < rows.get(0).getCellCount(); col++) {
            if (getCellAsText(rowTableStart, col).equals(columnName)) return col;
        }

        throw new RuntimeException("Coluna %s do excel não foi encontrada no Excel %s".formatted(columnName, filename));
    }

    public String[] getTableHeaderCells() {
        return getRow(rowTableStart);
    }

    public String[] getRow(int row) {
        return rows.get(row).stream()
                .map(Cell::getText)
                .filter(StringUtils::isNotEmpty)
                .toArray(String[]::new);
    }

    public double getCellAsDouble(int row, int column) {
        return Double.parseDouble(getCellAsText(row, column));
    }
    public String getCellAsText(int row, int column)  {
        Cell cell = getCell(row, column);
        if (cell == null) return "";
        return cell.getText();
    }

    private Cell getCell(Row row, int column) {
        return getCell(row.getRowNum() - 1, column);
    }

    public Cell getCell(int row, int column) {
        if (cellDoesNotExist(row, column)) return null;

        return rows.get(row).getCell(column);
    }

    private boolean cellDoesNotExist(int row, int column) {
        return sheet == null
                || rows.size() <= row
                || rows.get(row) == null
                || !rows.get(row).hasCell(column);
    }

    private static boolean cellIsNotEmpty(Cell cell) {
        return cell != null
                && cell.getType() != CellType.EMPTY
                && StringUtils.isNotEmpty(cell.getRawValue());
    }

    public List<Cell> getColumnsCell(String columnName) {
        if (sheet == null) return Collections.emptyList();

        int col = getHeaderColumn(columnName);

        return rows.stream()
                .skip(rowTableStart + 1)
                .map(row -> getCell(row, col))
                .filter(ExcelWrapper::cellIsNotEmpty)
                .toList();
    }

    public boolean allValuesMatchForColumn(String header, Predicate<String> predicate) {
        return getColumnsCell(header).stream().map(Cell::getRawValue).allMatch(predicate);
    }

    public void goToSheet(String sheetName, String rowTableStartName) throws IOException {
        sheet = workbook.findSheet(sheetName).orElse(null);
        if (sheet == null) {
            throw new RuntimeException("Não encontrei aba " + sheetName);
        }
        rows = sheet.read();
        this.rowTableStart = lookForRowStartingWithValue(rowTableStartName, 0);
    }
}
