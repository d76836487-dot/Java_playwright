package com.fiserv.qabrazil.util;

import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class CSVWrapper {
    private static final Logger log = LoggerFactory.getLogger(CSVWrapper.class);

    private final List<String[]> lines;

    public CSVWrapper(InputStream inputStream) throws Exception {
        CSVParser csvParser = new CSVParserBuilder().withSeparator(';').build();
        InputStreamReader streamReader = new InputStreamReader(inputStream, StandardCharsets.ISO_8859_1);

        CSVReader reader = new CSVReaderBuilder(streamReader)
                .withCSVParser(csvParser)
                .build();

        this.lines = reader.readAll();
    }

    public List<String> getColumnsAsText(String columnName) {
        final int columnIndex = getColumnIndex(columnName);

        return lines.stream()
                .skip(1)
                .map(cels -> cels[columnIndex])
                .toList();
    }

    private int getColumnIndex(String columnName) {
        String[] header = lines.get(0);

        for (int i = 0; i < header.length; i++) {
            if (header[i].equals(columnName)) {
                log.info("Found column at index {} with value: {}", i, header[i]);
                return i;
            }
        }

        throw new RuntimeException("Não foi encontrado a coluna %s no arquivo csv".formatted(columnName));
    }

    public String getCellAsText(int row, int column) {
        return lines.get(row)[column];
    }
}
