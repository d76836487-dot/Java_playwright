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
import java.text.ParseException;
import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.IntStream;

public class CSVWrapper {
    public static final CSVWrapper NULL = new CSVWrapper();
    private static final Logger log = LoggerFactory.getLogger(CSVWrapper.class);

    private final List<String[]> lines;
    private final boolean isNull;
    private final String filename;

    private CSVWrapper() {
        lines = List.of();
        isNull = true;
        filename = "NULL";
    }

    public CSVWrapper(InputStream inputStream) throws Exception {
        this(inputStream, "");
    }

    public CSVWrapper(InputStream inputStream, String filename) throws Exception {
        CSVParser csvParser = new CSVParserBuilder().withSeparator(';').build();
        InputStreamReader streamReader = new InputStreamReader(inputStream, StandardCharsets.ISO_8859_1);

        CSVReader reader = new CSVReaderBuilder(streamReader)
                .withCSVParser(csvParser)
                .build();

        this.lines = reader.readAll();
        isNull = false;
        this.filename = filename;
    }

    public int[] getIndexWhereColumn(String columnName, Predicate<String> predicate) {
        List<String> texts = getColumnsAsText(columnName);
        return IntStream.range(0, texts.size())
                .filter(i -> predicate.test(texts.get(i)))
                .toArray();
    }

    public List<Currency> getColumnsAsCurrencyByIndex(String columnName, int[] indexes) {
        List<Currency> currencies = getColumnsAsCurrency(columnName);
        return Arrays.stream(indexes)
                .mapToObj(currencies::get)
                .toList();

    }

    public List<Double> getColumnsAsDoubleByIndex(String columnName, int[] indexes) {
        List<Double> values = getColumnsAsDouble(columnName);
        return Arrays.stream(indexes)
                .mapToObj(values::get)
                .toList();
    }

    public int getColumnsSizeWhere(String columnName, Predicate<String> predicate) {
        return (int) getColumnsAsText(columnName).stream()
                .filter(predicate)
                .count();
    }

    public List<Currency> getColumnsAsCurrency(String columnName) {
        return getColumnsAsText(columnName).stream()
                .map(CSVWrapper::getParseCurrency)
                .toList();
    }

    private static Currency getParseCurrency(String v) {
        try {
            return Currency.parse(v);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Double> getColumnsAsDouble(String columnName) {
        return getColumnsAsText(columnName).stream()
                .map(CSVWrapper::textToDouble)
                .toList();
    }

    private static double textToDouble(String value) {
        String fromBrazilianValue = value
                .replace("R$", "")
                .replace(".", "")
                .replace(",", ".");
        return Double.parseDouble(fromBrazilianValue);
    }

    public List<String> getColumnsAsText(String columnName) {
        if (isNull) return List.of();

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

        throw new RuntimeException("Não foi encontrado a coluna %s no arquivo csv %s".formatted(columnName, filename));
    }

    public String[] getRow(int row) {
        return lines.get(row);
    }
}
