package com.fiserv.qabrazil.pages.componentes.relatorios;

import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Download;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class GeracaoArquivos {
    private static final DataFormatter dataFormatter = new DataFormatter();

    public static String getExtensao(String tipoArquivo) {
        String extensao = "";
        if (tipoArquivo.equalsIgnoreCase("Excel"))
            extensao = ".xlsx";
        else if (tipoArquivo.equalsIgnoreCase("CSV"))
            extensao = ".csv";

        return extensao;
    }

    public static boolean validarNomeTipoArquivo(String tipoArquivo, String nomeArquivo, Download download) {
        boolean retorno = false;

        // Captura e formata a data atual
        LocalDate now = LocalDate.now();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        String fullDate = now.format(format);

        // Concatena o nome completo do arquivo
        nomeArquivo = nomeArquivo.concat(fullDate);
        String extensao = getExtensao(tipoArquivo);

        if (
            download.suggestedFilename().contains(nomeArquivo)
            && download.suggestedFilename().contains(extensao)
        )
            retorno = true;

        return retorno;
    }

    public static File copiarArquivoAtribuirExtensao(File arquivoBaixado, String extensao) throws IOException {
        // Caminho original do arquivo
        Path diretorio = arquivoBaixado.toPath();

        // Atribui a extensão ao arquivo
        String novoArquivo = diretorio.toFile().getName() + extensao;
        Path novoDiretorio = diretorio.getParent().resolve(novoArquivo);

        // Faz uma copia do arquivo
        Files.copy(diretorio, novoDiretorio, StandardCopyOption.REPLACE_EXISTING);

        return novoDiretorio.toFile();
    }

    public static boolean validarCabecalhoTipoArquivo(File arquivo, int linhaInicio, List<String> listaColunas) throws IOException {
        boolean retorno = false;

        String nomeArquivo = arquivo.getName();

        if (nomeArquivo.endsWith(".xlsx"))
            retorno = validarCabecalhoExcel(arquivo, linhaInicio, listaColunas);
        else if (nomeArquivo.endsWith(".csv"))
            retorno = validarCabecalhoCSV(arquivo, listaColunas);

        return retorno;
    }

    private static boolean validarCabecalhoExcel(File arquivo, int linhaInicio, List<String> listaColunas) throws IOException {
        try (FileInputStream fis = new FileInputStream(arquivo);
        Workbook workbook = new XSSFWorkbook(fis)) {
            Sheet sheet = workbook.getSheetAt(0);
            Row row = sheet.getRow(linhaInicio);

            List<String> colunasArquivo = new ArrayList<>();
            for (Cell cell : row) {
                colunasArquivo.add(cell.getStringCellValue());

                // Se o tamanho da lista colunasArquivo é igual ao tamanho da lista listaColunas, interrompe o loop
                if (colunasArquivo.size() == listaColunas.size())
                    break;
            }

            return colunasArquivo.containsAll(listaColunas);
        }
    }

    private static boolean validarCabecalhoCSV(File arquivo, List<String> listaColunas) throws IOException {
        try (Reader reader = new InputStreamReader(new FileInputStream(arquivo), StandardCharsets.ISO_8859_1);
         CSVParser csvParser = new CSVParser(
             reader
            ,CSVFormat.DEFAULT.withFirstRecordAsHeader()
         )) {
            boolean retorno = true;
            String[] listaColunasArquivo = new ArrayList<>(csvParser.getHeaderNames()).get(0).split(";");
            int i = 0;

            for (String colunaArquivo : listaColunasArquivo) {
                if (!colunaArquivo.equalsIgnoreCase(listaColunas.get(i))) {
                    retorno = false;
                    break;
                }
                i++;
            }

            return retorno;
        }
    }

    public static boolean validarColunasTipoArquivo(String abaRelatorio, String tipoRelatorio, File arquivo) throws IOException {
        boolean retorno = false;

        String nomeArquivo = arquivo.getName();

        if (nomeArquivo.endsWith(".xlsx"))
            retorno = validarColunasExcel(abaRelatorio, tipoRelatorio, arquivo);
        else if (nomeArquivo.endsWith(".csv"))
            retorno = validarColunasCSV(abaRelatorio, tipoRelatorio, arquivo);

        return retorno;
    }

    private static String getCountAndSumFromColumn(Sheet sheet, String chosenCell) {
        String columnLetter = chosenCell.substring(0, 1);
        int startingLine = GeneralUtils.convertToInt(
            chosenCell.replace(
                 chosenCell.substring(0, 1)
                , ""
            )
        );

        int count = 0;
        double sum = 0;
        int columnIndex = CellReference.convertColStringToIndex(columnLetter);

        for (int i = startingLine; i <= sheet.getLastRowNum(); i++){
            Row row = sheet.getRow(i);
            if (row != null) {
                Cell cell = row.getCell(columnIndex);
                if (cell != null && cell.getCellType() == CellType.STRING) {
                    count++;
                    sum += GeneralUtils.convertToDouble(
                        dataFormatter.formatCellValue(cell)
                    );
                }
            }
        }

        return count + ";" + sum;
    }

    private static boolean validarColunasExcel(String abaRelatorio, String tipoRelatorio, File arquivo) throws IOException {
        boolean verificacaoTotalizadoresArquivo = false;

        String[] cellList = new String[0];
        String[] cellAndTitle;
        String chosenCell;
        String title;
        String[] countSumColumn;

        // Totalizadores
        int total01 = 0;
        int countTotal01 = 0;
        double valor01 = 0;
        double countValor01 = 0;
        double valor02 = 0;
        double countValor02 = 0;
        double valor03 = 0;
        double countValor03 = 0;
        double valor04 = 0;
        double countValor04 = 0;
        double valor05 = 0;
        double countValor05 = 0;
        double valor06 = 0;
        double countValor06 = 0;

        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje"))
            cellList = "A12_Total de vendas: ;A13_Valor bruto: ;A14_Valor não efetivadas: ;I17_Valor bruto".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
            if (tipoRelatorio.equalsIgnoreCase("simplificado"))
                cellList = "A9_Total de vendas: ;A10_Valor bruto: ;A11_Valor líquido: ;A12_Valor cancelado: ;G16_Valor bruto;I16_Valor líquido;J16_Valor cancelado".split(";");
            else if (tipoRelatorio.equalsIgnoreCase("detalhado"))
                cellList = "P5_Valor bruto da parcela;Q5_Valor da taxa (MDR);R5_Valor líquido da parcela/transação".split(";");
        }

        try (FileInputStream fis = new FileInputStream(arquivo);
        Workbook workbook = new XSSFWorkbook(fis)) {
            Sheet sheet = workbook.getSheetAt(0);
            for (String coluna : cellList) {
                cellAndTitle = coluna.split("_");
                chosenCell = cellAndTitle[0];
                title = cellAndTitle[1];

                CellReference cellReference = new CellReference(chosenCell);
                Row row = sheet.getRow(cellReference.getRow());
                Cell cell = row.getCell(cellReference.getCol());

                String cellValue = dataFormatter.formatCellValue(cell);

                // Vendas
                if (abaRelatorio.equalsIgnoreCase("Hoje")) {
                    if (title.equalsIgnoreCase("Total de vendas: ")) {
                        cellValue = cellValue.replace(title, "");
                        total01 = GeneralUtils.convertToInt(cellValue);
                    } else if (title.equalsIgnoreCase("Valor bruto: ")) {
                        cellValue = cellValue.replace(title, "");
                        valor01 = GeneralUtils.convertToDouble(cellValue);
                    } else if (title.equalsIgnoreCase("Valor não efetivadas: ")) {
                        cellValue = cellValue.replace(title, "");
                        valor02 = GeneralUtils.convertToDouble(cellValue);
                    } else if (title.equalsIgnoreCase("Valor bruto")) {
                        countSumColumn = getCountAndSumFromColumn(sheet, chosenCell).split(";");
                        countTotal01 = GeneralUtils.convertToInt(countSumColumn[0]);
                        countValor03 = GeneralUtils.convertToDouble(countSumColumn[1]);
                    }

                    verificacaoTotalizadoresArquivo = (
                        total01 == countTotal01
                        && (valor01 + valor02) == countValor03
                    );
                } else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
                    if (tipoRelatorio.equalsIgnoreCase("simplificado")) {
                        if (title.equalsIgnoreCase("Total de vendas: ")) {
                            cellValue = cellValue.replace(title, "");
                            total01 = GeneralUtils.convertToInt(cellValue);
                        } else if (title.equalsIgnoreCase("Valor bruto: ")) {
                            cellValue = cellValue.replace(title, "");
                            valor01 = GeneralUtils.convertToInt(cellValue);
                        } else if (title.equalsIgnoreCase("Valor líquido: ")) {
                            cellValue = cellValue.replace(title, "");
                            valor02 = GeneralUtils.convertToInt(cellValue);
                        } else if (title.equalsIgnoreCase("Valor cancelado: ")) {
                            cellValue = cellValue.replace(title, "");
                            valor03 = GeneralUtils.convertToInt(cellValue);
                        } else if (title.equalsIgnoreCase("Valor bruto")) {
                            countSumColumn = getCountAndSumFromColumn(sheet, chosenCell).split(";");
                            countTotal01 = GeneralUtils.convertToInt(countSumColumn[0]);
                            countValor04 = GeneralUtils.convertToDouble(countSumColumn[1]);
                        } else if (title.equalsIgnoreCase("Valor líquido")) {
                            countSumColumn = getCountAndSumFromColumn(sheet, chosenCell).split(";");
                            countValor05 = GeneralUtils.convertToDouble(countSumColumn[1]);
                        } else if (title.equalsIgnoreCase("Valor cancelado")) {
                            countSumColumn = getCountAndSumFromColumn(sheet, chosenCell).split(";");
                            countValor06 = GeneralUtils.convertToDouble(countSumColumn[1]);
                        }

                        verificacaoTotalizadoresArquivo = (
                            total01 == countTotal01
                            && valor01 == countValor04
                            && valor02 == countValor05
                            && valor03 == countValor06
                        );
                    } else if (tipoRelatorio.equalsIgnoreCase("detalhado")) {
                        if (title.equalsIgnoreCase("Valor bruto da parcela")) {
                            countSumColumn = getCountAndSumFromColumn(sheet, chosenCell).split(";");
                            countValor01 = GeneralUtils.convertToDouble(countSumColumn[1]);
                        } else if (title.equalsIgnoreCase("Valor da taxa (MDR)")) {
                            countSumColumn = getCountAndSumFromColumn(sheet, chosenCell).split(";");
                            countValor02 = GeneralUtils.convertToDouble(countSumColumn[1]);
                        } else if (title.equalsIgnoreCase("Valor líquido da parcela/transação")) {
                            countSumColumn = getCountAndSumFromColumn(sheet, chosenCell).split(";");
                            countValor03 = GeneralUtils.convertToDouble(countSumColumn[1]);
                        }

                        verificacaoTotalizadoresArquivo = (
                            countValor01 == (countValor02 + countValor03)
                        );
                    }
                }
            }
        }

        return verificacaoTotalizadoresArquivo;
    }

    private static boolean validarColunasCSV(String abaRelatorio, String tipoRelatorio, File arquivo) throws IOException {
        // Vendas
        // Hoje
        //  = "I1_Valor bruto".split(";");

        return false;
    }
}