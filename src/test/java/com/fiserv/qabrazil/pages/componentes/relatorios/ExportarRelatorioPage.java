package com.fiserv.qabrazil.pages.componentes.relatorios;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.testng.Assert;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;

@ScenarioComponent
public class ExportarRelatorioPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
    private Locator btnGerarArquivo;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[contains(@id, '-Titulo')]/*[contains(text(), 'Exportar')]");
        this.btnGerarArquivo = page.locator("//*[contains(@data-testid, '-gerar-arquivo')]");
    }

    public void gerarArquivo(String abaRelatorio, String tipoArquivo, String tipoRelatorio) throws IOException {
        waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS);

        // Campo: Tipo de arquivo (hover event)
        page.locator("//*[contains(@id, '-FormatoArquivo')]").hover();

        String optArquivo = switch (tipoArquivo) {
            case "Excel" -> "-excel";
            case "CSV" -> "-csv";
            default -> "";
        };

        // Click na opção do Tipo de arquivo escolhido
        if (!optArquivo.equalsIgnoreCase(""))
            click(page.locator("//*[contains(@data-testid, '" + optArquivo + "')]"));

        String rbRelatorio = switch (tipoRelatorio) {
            case "simplificado" -> "_Simplificado-";
            case "detalhado" -> "_Detalhado-";
            default -> "";
        };

        // Check no tipo de relatório escolhido
        if (!rbRelatorio.equalsIgnoreCase(""))
            page.locator("//*[contains(@id, '" + rbRelatorio + "')]").check();

        // Aguarda o download ao realizar o click no botão Gerar arquivo
        Download download = page.waitForDownload(() -> click(this.btnGerarArquivo));

        // Validar nome do arquivo
        boolean validacaoNomeArquivo = GeracaoArquivos.validarNomeTipoArquivo(abaRelatorio, tipoArquivo, tipoRelatorio, download);
        Assert.assertTrue(validacaoNomeArquivo);

        String extensao = GeracaoArquivos.getExtensao(tipoArquivo);
        Path arquivoBaixado = download.path();
        File copiaArquivoBaixado = GeracaoArquivos.copiarArquivoAtribuirExtensao(arquivoBaixado.toFile(), extensao);

        // Cria a lista de colunas do arquivo
        String colunas = GeracaoArquivos.atribuirColunasArquivo(abaRelatorio, tipoArquivo, tipoRelatorio);
        List<String> listaColunas = List.of(colunas.split(";"));

        // Validar cabeçalho do arquivo
        boolean validacaoCabecalho = GeracaoArquivos.validarCabecalhoTipoArquivo(abaRelatorio, tipoRelatorio, copiaArquivoBaixado, listaColunas);
        Assert.assertTrue(validacaoCabecalho);

        // Validar valores das colunas do arquivo
        boolean ValidacaoValoresColunasArquivo = GeracaoArquivos.validarColunasTipoArquivo(abaRelatorio, tipoRelatorio, copiaArquivoBaixado);
        Assert.assertTrue(ValidacaoValoresColunasArquivo);
    }
}