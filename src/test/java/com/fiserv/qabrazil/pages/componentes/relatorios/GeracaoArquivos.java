package com.fiserv.qabrazil.pages.componentes.relatorios;

import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Download;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
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

    private static String getCountAndSumFromColumnExcel(Sheet sheet, String chosenCell) {
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

        // XLSX = Célula -1 -> Ex.: A2 = A1
        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje"))
            cellList = "A12_Total de vendas: ;A13_Valor bruto: ;A14_Valor não efetivadas: ;I17_Valor bruto".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
            if (tipoRelatorio.equalsIgnoreCase("simplificado"))
                cellList = "A9_Total de vendas: ;A10_Valor bruto: ;A11_Valor líquido: ;A12_Valor cancelado: ;G16_Valor bruto;I16_Valor líquido;J16_Valor cancelado".split(";");
            else if (tipoRelatorio.equalsIgnoreCase("detalhado"))
                cellList = "P5_Valor bruto da parcela;Q5_Valor da taxa (MDR);R5_Valor líquido da parcela/transação".split(";");
        } else if (abaRelatorio.equalsIgnoreCase("Não efetivadas"))
            cellList = "A8_Total de Vendas Recusadas: ;A9_Total de Vendas Estornadas: ;I12_Valor bruto;J12_Status".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Pré-autorizações"))
            cellList = "A9_Total de vendas: ;A10_Valor bruto: /Valor bruto autorizado: /Valor bruto a confirmar: ;G13_Valor autorizado;H13_Valor confirmado".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Voucher"))
            cellList = "A9_Total de vendas: ;A10_Valor bruto: ;I14_Valor bruto".split(";");

        // Recebimentos
        else if (abaRelatorio.equalsIgnoreCase("Pagos")) {
            if (tipoRelatorio.equalsIgnoreCase("simplificado"))
                cellList = "A10_Total recebido: ;B10_Total agendado: ;C10_Total cedido: ;J14_Valor pagamento".split(";");
            else if (tipoRelatorio.equalsIgnoreCase("detalhado"))
                cellList = "R5_Valor bruto;S5_Bruto da parcela;T5_Desconto MDR;U5_Líquido da venda".split(";");
        } else if (abaRelatorio.equalsIgnoreCase("Futuros"))
            cellList = "A9_Total de vendas: ;A10_Valor líquido previsto: ;G14_Valor bruto;H14_Valor bruto parcela;J14_Valor líquido".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Débitos e ajustes"))
            cellList = "B12_Valor do aluguel".split(";");

        // Antecipação
        else if (abaRelatorio.equalsIgnoreCase("Histórico"))
            cellList = "A10_Total de antecipações pagas: ;A11_Valor líquido pago: ;C14_Valor bruto solicitado;D14_Valor do desconto;E14_Valor líquido solicitado;F14_Valor líquido aprovado".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Relatório de antecipações")) {
            if (tipoRelatorio.equalsIgnoreCase("simplificado"))
                cellList = "B4_Valor bruto das vendas;B5_Total de desconto das vendas;B6_Valor líquido das vendas;B7_Total de desconto antecipação;B8_Valor antecipado pago;D12_Valor bruto das vendas;E12_Valor desconto MDR;F12_Valor líquido das vendas;G12_Valor desconto antecipação;H12_Valor pago".split(";");
            else if (tipoRelatorio.equalsIgnoreCase("detalhado"))
                cellList = "B4_Valor bruto das vendas;B5_Total de desconto das vendas;B6_Valor líquido das vendas;B7_Total de desconto antecipação;B8_Valor antecipado pago;G11_Valor bruto das vendas;H11_Valor desconto MDR;I11_Valor líquido das vendas;J11_Valor desconto antecipação;K11_Valor pago".split(";");
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
                        countSumColumn = getCountAndSumFromColumnExcel(sheet, chosenCell).split(";");
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
                            countSumColumn = getCountAndSumFromColumnExcel(sheet, chosenCell).split(";");
                            countTotal01 = GeneralUtils.convertToInt(countSumColumn[0]);
                            countValor04 = GeneralUtils.convertToDouble(countSumColumn[1]);
                        } else if (title.equalsIgnoreCase("Valor líquido")) {
                            countSumColumn = getCountAndSumFromColumnExcel(sheet, chosenCell).split(";");
                            countValor05 = GeneralUtils.convertToDouble(countSumColumn[1]);
                        } else if (title.equalsIgnoreCase("Valor cancelado")) {
                            countSumColumn = getCountAndSumFromColumnExcel(sheet, chosenCell).split(";");
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
                            countSumColumn = getCountAndSumFromColumnExcel(sheet, chosenCell).split(";");
                            countValor01 = GeneralUtils.convertToDouble(countSumColumn[1]);
                        } else if (title.equalsIgnoreCase("Valor da taxa (MDR)")) {
                            countSumColumn = getCountAndSumFromColumnExcel(sheet, chosenCell).split(";");
                            countValor02 = GeneralUtils.convertToDouble(countSumColumn[1]);
                        } else if (title.equalsIgnoreCase("Valor líquido da parcela/transação")) {
                            countSumColumn = getCountAndSumFromColumnExcel(sheet, chosenCell).split(";");
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

    private static String getCountAndSumFromColumnCSV(String chosenCell, List<CSVRecord> records) {
        int count = 0;
        double sum = 0;

        int columnIndex = chosenCell.charAt(0) - 'A';
        int startingLine = GeneralUtils.convertToInt(chosenCell.substring(1)) - 1;

        for (int i = startingLine; i < records.size(); i++) {
            CSVRecord record = records.get(i);
            String cellValue = record.get(columnIndex);

            if (!cellValue.isEmpty()) {
                count++;
                sum += GeneralUtils.convertToDouble(cellValue);
            }
        }

        return count + ";" + sum;
    }

    private static boolean validarColunasCSV(String abaRelatorio, String tipoRelatorio, File arquivo) throws IOException {
        boolean verificacaoTotalizadoresArquivo = false;

        String[] cellAndTitle;
        String chosenCell;
        String title;
        String[] countSumColumn;

        // Totalizadores
        double valor01 = 0;
        int countValor01 = 0;

        String[] cellList = new String[0];

        // CSV = Célula exata -> Ex.: A2 = A2
        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje"))
            cellList = "I2_Valor bruto".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
            if (tipoRelatorio.equalsIgnoreCase("simplificado"))
                cellList = "G2_Valor bruto;I2_Valor líquido;J2_Valor cancelado".split(";");
            else if (tipoRelatorio.equalsIgnoreCase("detalhado"))
                cellList = "P2_Valor bruto da parcela;Q2_Valor da taxa (MDR);R2_Valor líquido da parcela/transação".split(";");
        } else if (abaRelatorio.equalsIgnoreCase("Não efetivadas"))
            cellList = "I2_Valor bruto;J2_Status".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Pré-autorizações"))
            cellList = "G2_Valor autorizado;H2_Valor confirmado".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Voucher"))
            cellList = "I2_Valor bruto".split(";");

        // Recebimentos
        else if (abaRelatorio.equalsIgnoreCase("Pagos")) {
            if (tipoRelatorio.equalsIgnoreCase("simplificado"))
                cellList = "J2_Valor do pagamento".split(";");
            else if (tipoRelatorio.equalsIgnoreCase("detalhado"))
                cellList = "R2_Valor bruto;S2_Bruto da parcela;T2_Desconto MDR;U2_Líquido da venda".split(";");
        } else if (abaRelatorio.equalsIgnoreCase("Futuros"))
            cellList = "G2_Valor bruto;H2_Valor bruto parcela;I2_Valor da taxa;J2_Valor líquido".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Débitos e ajustes"))
            cellList = "B2_Valor do aluguel".split(";");

        // Antecipação
        else if (abaRelatorio.equalsIgnoreCase("Histórico"))
            cellList = "C2_Valor bruto solicitado;D2_Valor do desconto;E2_Valor líquido solicitado;F2_Valor líquido aprovado".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Relatório de antecipações")) {
            if (tipoRelatorio.equalsIgnoreCase("simplificado"))
                cellList = "D2_Valor bruto das vendas;E2_Valor desconto MDR;F2_Valor líquido das vendas;G2_Valor desconto antecipação;H2_Valor pago".split(";");
            else if (tipoRelatorio.equalsIgnoreCase("detalhado"))
                cellList = "G2_Valor bruto das vendas;H2_Valor desconto MDR;I2_Valor líquido das vendas;J2_Valor desconto antecipação;K2_Valor pago".split(";");
        }

        try (Reader reader = new InputStreamReader(new FileInputStream(arquivo), StandardCharsets.ISO_8859_1);
        CSVParser csvParser = new CSVParser(
             reader
            ,CSVFormat.DEFAULT.withFirstRecordAsHeader()
        )) {
            List<CSVRecord> records = csvParser.getRecords();

            for (String cell : cellList) {
                cellAndTitle = cell.split("_");
                chosenCell = cellAndTitle[0];
                title = cellAndTitle[1];

                // Vendas
                if (abaRelatorio.equalsIgnoreCase("Hoje")) {
                    if (title.equalsIgnoreCase("Valor bruto")) {
                        countSumColumn = getCountAndSumFromColumnCSV(chosenCell, records).split(";");
                        countValor01 = GeneralUtils.convertToInt(countSumColumn[0]);
                        valor01 = GeneralUtils.convertToDouble(countSumColumn[1]);
                    }

                    verificacaoTotalizadoresArquivo = (valor01 > 0 && countValor01 > 0);
                }
            }
        }

        return verificacaoTotalizadoresArquivo;
    }
}