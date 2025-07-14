package com.fiserv.qabrazil.pages.componentes.relatorios;

import com.microsoft.playwright.Download;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
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

    public static boolean validarColunasTipoArquivo(File arquivo, int linhaInicio, String colunas) throws IOException {
        boolean retorno = false;

        String nomeArquivo = arquivo.getName();

        if (nomeArquivo.endsWith(".xlsx"))
            retorno = validarColunasExcel(arquivo, linhaInicio, colunas);
        else if (nomeArquivo.endsWith(".csv"))
            retorno = validarColunasCSV(arquivo, colunas);

        return retorno;
    }

    private static boolean validarColunasExcel(File arquivo, int linhaInicio, String colunas) throws IOException {
        return false;
    }

    private static boolean validarColunasCSV(File arquivo, String colunas) throws IOException {
        return false;
    }
}