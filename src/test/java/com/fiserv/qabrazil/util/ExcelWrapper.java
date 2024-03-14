package com.fiserv.qabrazil.util;

import org.dhatim.fastexcel.reader.ReadableWorkbook;
import org.dhatim.fastexcel.reader.Sheet;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

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

    @Override
    public void close() throws Exception {
        if (workbook != null) workbook.close();
        if (inputStream != null) inputStream.close();
    }

    public List<String> getColumnsAsText(String columnName) throws IOException {
        if (sheet == null) return List.of();

        List<String> values = new ArrayList<>();
        int col = getHeaderColumn(columnName);

        for(int row = rowTableStart + 1; row < sheet.read().size(); row++) {
            values.add(getCellAsText(row, col));
        }

        return values;
    }

    private int getHeaderColumn(String columnName) throws IOException {
        for(int col = 0; col < sheet.read().get(0).getCellCount(); col++) {
            if (getCellAsText(rowTableStart, col).equals(columnName)) return col;
        }

        throw new RuntimeException("Coluna %s do excel não foi encontrada".formatted(columnName));
    }

    public String getCellAsText(int row, int column) throws IOException {
        if (sheet == null) return "";

        return sheet.read().get(row).getCell(column).getText();
    }
}
