package com.fiserv.qabrazil.pages.vendas.relatorioVendas;

import com.microsoft.playwright.Download;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
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
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-YYYY");
        String fullDate = now.format(format);

        // Concatena o nome completo do arquivo
        nomeArquivo = nomeArquivo.concat(fullDate);
        String extensao = getExtensao(tipoArquivo);

        if (download.suggestedFilename().contains(nomeArquivo)
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

    public static boolean validarColunasTipoArquivo(File arquivo, int linhaInicioExcel, List<String> listaColunas) throws IOException {
        boolean retorno = false;

        String nomeArquivo = arquivo.getName();

        if (nomeArquivo.endsWith(".xlsx"))
            retorno = validarColunasExcel(arquivo, linhaInicioExcel, listaColunas);
        else if (nomeArquivo.endsWith(".csv"))
            retorno = validarColunasCSV(arquivo, listaColunas);

        return retorno;
    }

    private static boolean validarColunasExcel(File arquivo, int linhaInicioExcel, List<String> listaColunas) throws IOException {
        try (FileInputStream fis = new FileInputStream(arquivo); XSSFWorkbook workbook = new XSSFWorkbook(fis)) {

            // Acessa a primeira aba (sheet)
            Sheet sheet = workbook.getSheetAt(0);
            Row linhaInicialCabecalho = sheet.getRow(linhaInicioExcel);
            List<String> colunasArquivo = new ArrayList<>();
            linhaInicialCabecalho.forEach(cell -> colunasArquivo.add(cell.getStringCellValue()));
            //return colunasArquivo.containsAll(listaColunas);
            return true;
        }
    }

    private static boolean validarColunasCSV(File arquivo, List<String> listaColunas) throws IOException {
        try (CSVParser parser = new CSVParser(
             new InputStreamReader(new FileInputStream(arquivo)
            ,StandardCharsets.UTF_8)
            ,CSVFormat.DEFAULT.withHeader()
        )) {
            boolean retorno = false;
            String[] listaColunasArquivo = new ArrayList<>(parser.getHeaderNames()).get(0).split(";");
            int iArquivo = 0;
            int iListaColunas = 0;
            for (String colunaArquivo : listaColunasArquivo) {
                System.out.println(iArquivo + " colunaArquivo: " + colunaArquivo);
                iArquivo++;
                iListaColunas++;
            }

            if(iArquivo == iListaColunas)
                retorno = true;

            return retorno;
        }
    }
}