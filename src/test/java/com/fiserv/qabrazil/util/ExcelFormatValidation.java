package com.fiserv.qabrazil.util;

import com.fiserv.automation.api.util.DateUtil;
import org.dhatim.fastexcel.reader.Cell;

import java.util.Arrays;
import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.collection.IsIn.oneOf;
import static org.testng.AssertJUnit.assertTrue;

public class ExcelFormatValidation {
    public static void validateFormatForCellsInTable(ExcelWrapper excel) {
        String[] headers = excel.getTableHeaderCells();

        for(String header: headers) {
            if(header.toLowerCase().contains("data")) {
                validateForDateColumn(header, excel);
            }

            if(header.toLowerCase().contains("valor")){
                validateForCurrencyColumn(header, excel);
            }

            List<String> formatsDistinct = excel.getColumnsFormatForNotEmptyCells(header).stream().distinct().toList();

            assertTrue("Mais de um formato para a coluna %s. \nEncontrado: %s".formatted(header, formatsDistinct),
                    formatsDistinct.size() <= 1);
        }
    }

    private static void validateForCurrencyColumn(String header, ExcelWrapper excel) {
        String[] expectedFormats = new String[]{"\"R$\"\\ #,##0.00",
                "\"[$R$ -416]#,##0.00\"",
                "_-[$R$-416]\\ * #,##0.00_-;\\-[$R$-416]\\ * #,##0.00_-;_-[$R$-416]\\ * \"-\"??_-;_-@_-"};
        List<String> actualFormats = excel.getColumnsCell(header).stream()
                .map(Cell::getDataFormatString)
                .toList();

        for(String actual: actualFormats) {
            assertThat("As células da coluna %s deveriam ter a formatação '%s'. Encontrado '%s'".formatted(header, Arrays.toString(expectedFormats), actual),
                    actual, oneOf(expectedFormats));
        }
    }

    private static void validateForDateColumn(String header, ExcelWrapper excel) {
        assertTrue("Coluna %s possui datas fora do padrão esperado".formatted(header),
                excel.allValuesMatchForColumn(header, t -> DateUtil.isInFormat(t, "dd/MM/yyyy")
                        || DateUtil.isInFormat(t, "dd/MM/yyyy 'às' HH:mm:ss")));
    }
}
