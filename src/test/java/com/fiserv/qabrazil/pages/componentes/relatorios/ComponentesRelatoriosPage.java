package com.fiserv.qabrazil.pages.componentes.relatorios;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.antecipacao.*;
import com.fiserv.qabrazil.pages.recebimentos.resumoRecebimentos.*;
import com.fiserv.qabrazil.pages.vendas.relatorioVendas.*;
import com.fiserv.qabrazil.util.*;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.testng.Assert;

import java.io.File; 
import java.io.IOException;
import java.nio.file.Path;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.List;
import java.util.Locale;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class ComponentesRelatoriosPage extends GeneralUtils {
    @Autowired
    private Page page;

    // Abas: Vendas
    private Locator abaHoje;
    private Locator abaHistoricoVendas;

    // Botões abas de Recebimentos
    private Locator abaPagos;
    private Locator subAbaMeusDomicilios;
    private Locator subAbaValoresCedidos;
    private Locator abaFuturos;
    private Locator abaDebitosAjustes;

    // Botões abas de Antecipação
    private Locator abaSolicitarAntecipacao;
    private Locator abaHistorico;
    private Locator abaRelatorioAntecipacoes;

    // Títulos das abas de Recebimentos
    private Locator titlePagos;
    private Locator titleMeusDomicilios;
    private Locator titleValoresCedidos;
    private Locator titleFuturos;
    private Locator titleDebitosAjustes;

    // Títulos das abas de Antecipação
    private Locator titleHistorico;
    private Locator titleRelatorioAntecipacoes;

    // Período
    private Locator iconeCalendario;

    // Filtros
    private Locator titleFiltros;
    private Locator btnMostrarResultados;

    // Valores
    private Locator linkValores;
    private Locator txtValoresDe;
    private Locator txtValoresAte;

    // Personalizar Colunas
    private Locator titlePersonalizarColunas;
    private Locator linkVoltarPadrao;
    private Locator btnAplicarPersonalizacao;

    // Registros
    private Locator nenhumResultadoEncontrado;

    // Gerar arquivo
    private Locator titleExportar;
    private Locator slcTipoArquivo;
    private Locator optExcel;
    private Locator optCSV;
    private Locator relatorioSimplificado;
    private Locator relatorioDetalhado;
    private Locator btnGerarArquivo;

    @Autowired
    ExportarRelatorioPage exportarRelatorioPage;

    // Vendas
    @Autowired
    HojePage hojePage;
    @Autowired
    HistoricoVendasPage historicoVendasPage;

    // Recebimentos
    @Autowired
    PagosPage pagosPage;
    @Autowired
    FuturosPage futurosPage;
    @Autowired
    DebitosAjustesPage debitosAjustesPage;

    // Antecipação
    @Autowired
    SolicitarAntecipacaoPage solicitarAntecipacaoPage;
    @Autowired
    HistoricoPage historicoPage;
    @Autowired
    RelatorioAntecipacoesPage relatorioAntecipacoesPage;

    @PostConstruct
    private void loadLocators() {
        // Botões abas de Vendas
        this.abaHoje = page.locator("//*[text()='Hoje' and contains(@class, 'new-vendas-tab')]");
        this.abaHistoricoVendas = page.locator("//*[text()='Histórico' and contains(@class, 'new-vendas-tab')]");

        // Botões abas de Recebimentos
        this.abaPagos = page.locator("//*[@id='RecebimentosPagos']/button");
        this.subAbaMeusDomicilios = page.locator("//*[contains(@aria-controls, '-MeusDomicilios')]");
        this.subAbaValoresCedidos = page.locator("//*[contains(@aria-controls, '-ValoresCedidos')]");
        this.abaFuturos = page.locator("//*[@id='RecebimentosFuturos']/button");
        this.abaDebitosAjustes = page.locator("//*[@id='RecebimentoDebitos']/button");

        // Botões abas de Antecipação
        this.abaSolicitarAntecipacao = page.locator("//*[text()='Solicitar antecipação']");
        this.abaHistorico = page.locator("//*[@data-testid='tab-historico-text']");
        this.abaRelatorioAntecipacoes = page.locator("//*[text()='Relatório de antecipações']");

        // Títulos das abas de Recebimentos
        this.titlePagos = page.locator("//*[contains(text(), 'Consulte os seus recebimentos pagos')]");
        this.titleMeusDomicilios = page.locator("//*[contains(text(), 'domicílios bancários')]");
        this.titleValoresCedidos = page.locator("//*[contains(text(), 'contrato de cessão')]");
        this.titleFuturos = page.locator("//*[contains(text(), 'Consulte o saldo futuro de suas vendas a receber')]");
        this.titleDebitosAjustes = page.locator("//*[contains(text(), 'Filtre por tipo de ajuste e consulte as informações')]");

        // Títulos das abas de Antecipação
        this.titleHistorico = page.locator("//*[text()='Historico']");
        this.titleRelatorioAntecipacoes = page.locator("//*[text()='Relatorio de antecipação']");

        // Período
        this.iconeCalendario = page.locator("//*[@data-testid='calendar-trigger-icon']");

        // Filtros
        this.titleFiltros = page.locator("//*[text()='Os itens selecionados serão aplicados na pesquisa.']");
        this.btnMostrarResultados = page.locator("//*[@data-testid='generic-filter-btn-resultados']");

        // Valores
        this.linkValores = page.locator("//*[@data-testid='generic-filter-accordion-title-valores']");
        this.txtValoresDe = page.locator("//*[@data-testid='generic-filter-input-valor-de']");
        this.txtValoresAte = page.locator("//*[@data-testid='generic-filter-input-valor-ate']");

        // Personalizar Colunas
        this.titlePersonalizarColunas = page.locator("//*[contains(text(), 'Personalize a visualização das colunas')]");
        this.linkVoltarPadrao = page.locator("//*[text()='Voltar ao padrão']");
        this.btnAplicarPersonalizacao = page.locator("//span[text()='Aplicar']");

        // Registros
        this.nenhumResultadoEncontrado = page.locator("//*[contains(text(), 'Nenhum resultado encontrado')]");

        // Gerar arquivo
        this.titleExportar = page.locator("//*[text()='Escolha como deseja exportar o relatório']");
        this.slcTipoArquivo = page.locator("//*[@data-testid='simple-dropdown-select--text-label']");
        this.optExcel = page.locator("//*[@data-testid='simple-dropdown-select--item-excel']");
        this.optCSV = page.locator("//*[@data-testid='simple-dropdown-select--item-csv']");
        this.relatorioSimplificado = page.locator("//*[contains(@id, '-RadioButton_Simplificado-input')]");
        this.relatorioDetalhado = page.locator("//*[contains(@id, '-RadioButton_Detalhado-input')]");
        this.btnGerarArquivo = page.locator("//*[contains(text(), 'Gerar arquivo')]");
    }

    // Valida os títulos das abas
    public void validarCarregamentoAbaRelatorio(@NotNull String abaRelatorio) {
        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje")) {
            waitIsVisibleForSeconds(this.abaHoje, Config.WAIT_5_SECONDS);
            click(this.abaHoje);
        } else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
            waitIsVisibleForSeconds(this.abaHistoricoVendas, Config.WAIT_5_SECONDS);
            click(this.abaHistoricoVendas);
        }

        // Recebimentos
        else if (
            abaRelatorio.equalsIgnoreCase("Pagos")
            || abaRelatorio.equalsIgnoreCase("Pagos_Meus Domicílios")
            || abaRelatorio.equalsIgnoreCase("Pagos_Valores Cedidos")
        ) {
            click(this.abaPagos);
            waitIsVisibleForSeconds(titlePagos, Config.WAIT_20_SECONDS);

            if (abaRelatorio.equalsIgnoreCase("Pagos_Meus Domicílios")) {
                click(this.subAbaMeusDomicilios);
                waitIsVisibleForSeconds(titleMeusDomicilios, Config.WAIT_20_SECONDS);
            } else if (abaRelatorio.equalsIgnoreCase("Pagos_Valores Cedidos")) {
                click(this.subAbaValoresCedidos);
                waitIsVisibleForSeconds(titleValoresCedidos, Config.WAIT_20_SECONDS);
            }
        } else if (abaRelatorio.equalsIgnoreCase("Futuros")) {
            click(this.abaFuturos);
            waitIsVisibleForSeconds(titleFuturos, Config.WAIT_20_SECONDS);
        } else if (abaRelatorio.equalsIgnoreCase("Débitos e ajustes")) {
            click(this.abaDebitosAjustes);
            waitIsVisibleForSeconds(titleDebitosAjustes, Config.WAIT_20_SECONDS);
        }

        // Antecipação
        else if (abaRelatorio.equalsIgnoreCase("Solicitar antecipação")) {
            click(this.abaSolicitarAntecipacao);
            solicitarAntecipacaoPage.waitForLoadSolicitarAntecipacao();
        } else if (abaRelatorio.equalsIgnoreCase("Histórico")) {
            waitForSeconds(Config.WAIT_10_SECONDS);
            click(this.abaHistorico);
            waitIsVisibleForSeconds(titleHistorico, Config.WAIT_10_SECONDS);
        } else if (abaRelatorio.equalsIgnoreCase("Relatório de antecipações")) {
            waitForSeconds(Config.WAIT_10_SECONDS);
            click(this.abaRelatorioAntecipacoes);
            waitIsVisibleForSeconds(titleRelatorioAntecipacoes, Config.WAIT_10_SECONDS);
        }
    }

    // Visualiza lista de campos por aba
    public void verificarCampos(String campos, @NotNull String abaRelatorio) {
        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje"))
            hojePage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas"))
            historicoVendasPage.verificarCampos(campos);

        // Recebimentos
        else if (abaRelatorio.equalsIgnoreCase("Pagos"))
            pagosPage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Futuros"))
            futurosPage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Débitos e ajustes"))
            debitosAjustesPage.verificarCampos(campos);

        // Antecipação
        else if (abaRelatorio.equalsIgnoreCase("Histórico"))
            historicoPage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Relatório de antecipações"))
            relatorioAntecipacoesPage.verificarCampos(campos);
    }

    public void exportarRelatorio(String abaRelatorio, String tipoArquivo, String tipoRelatorio) throws IOException {
        waitForSeconds(Config.WAIT_5_SECONDS);

        // Click botão Exportar relatório
        click(page.locator("//*[contains(@id, 'Exportar')]"));

        exportarRelatorioPage.gerarArquivo(abaRelatorio, tipoArquivo, tipoRelatorio);
    }

    private void verificarTotalizadoresAba(String abaRelatorio) {
        Locator btnNext = page.locator("//*[@class='border-size-none pagination-button']/*[contains(@class, 'right')]");
        Locator lastPageNumber = page.locator("//*[contains(@class, 'pagination-button')]/span").last();
        boolean verificacaoTotalizadoresAba = false;

        // Totalizadores
        int total01 = 0;
        int countTotal01 = 0;
        int total02 = 0;
        int countTotal02 = 0;
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

        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje")) {
            total01 = hojePage.getTotalVendas();
            valor01 = hojePage.getValorBruto();
        } else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
            total01 = historicoVendasPage.getTotalVendas();
            valor01 = historicoVendasPage.getValorBruto();
            valor02 = historicoVendasPage.getValorLiquido();
            valor03 = historicoVendasPage.getValorCancelado();
        }

        // Recebimentos
        else if (abaRelatorio.equalsIgnoreCase("Pagos")) {
            valor01 = pagosPage.getTotalRecebido();
            valor02 = pagosPage.getTotalAgendado();
            valor03 = pagosPage.getTotalCedido();
        } else if (abaRelatorio.equalsIgnoreCase("Futuros")) {
            total01 = futurosPage.getTotalVendas();
            valor01 = futurosPage.getTotalLiquidoPrevisto();
        } else if (abaRelatorio.equalsIgnoreCase("Débitos e ajustes")) {
            valor01 = debitosAjustesPage.getTotalCobrancasAluguel();
            valor02 = debitosAjustesPage.getTotalCobrancasPendentes();
        }

        // Antecipação
        else if (abaRelatorio.equalsIgnoreCase("Histórico")) {
            total01 = historicoPage.getTotalAntecipacoesPagas();
            valor01 = historicoPage.getValorLiquidoPago();
        } else if (abaRelatorio.equalsIgnoreCase("Relatório de antecipações")) {
            valor01 = relatorioAntecipacoesPage.getValorBrutoVendas();
            valor02 = relatorioAntecipacoesPage.getValorLiquidoVendas();
            valor03 = relatorioAntecipacoesPage.getTotalDescontoValorLiquido();
            valor04 = relatorioAntecipacoesPage.getValorAntecipadoPago();
            valor05 = relatorioAntecipacoesPage.getTotalDescontoValorAntecipadoPago();
        }

        int sizePagination = getIntLocator(lastPageNumber);
        for (int i = 0; i < sizePagination; i++) {
            waitForSeconds(Config.WAIT_5_SECONDS);

            // Vendas
            if (abaRelatorio.equalsIgnoreCase("Hoje")) {
                Locator resultadoColunaValorBruto =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorBruto");

                for (int j = 0; j < resultadoColunaValorBruto.count(); j++) {
                    resultadoColunaValorBruto.nth(j).scrollIntoViewIfNeeded();
                    countTotal01++;
                    countValor01 += getDoubleLocator(resultadoColunaValorBruto.nth(j));
                }

                verificacaoTotalizadoresAba = (
                    total01 == countTotal01
                    && valor01 == countValor01
                );
            } else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
                Locator resultadoColunaValorBruto =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorBruto");

                Locator resultadoColunaValorLiquido =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorLiquido");

                for (int j = 0; j < resultadoColunaValorBruto.count(); j++) {
                    resultadoColunaValorBruto.nth(j).scrollIntoViewIfNeeded();
                    countTotal01++;
                    countValor01 += getDoubleLocator(resultadoColunaValorBruto.nth(j));
                    countValor02 += getDoubleLocator(resultadoColunaValorLiquido.nth(j));
                }

                verificacaoTotalizadoresAba = (
                    total01 == countTotal01
                    && valor01 == countValor01
                    && valor02 == countValor02
                );
            }

            // Recebimentos
            else if (abaRelatorio.equalsIgnoreCase("Pagos")) {
                Locator resultadoColunaTotalRecebido =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaTotalRecebido");

                Locator resultadoColunaTotalAgendado =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaTotalAgendado");

                for (int j = 0; j < resultadoColunaTotalRecebido.count(); j++) {
                    resultadoColunaTotalRecebido.nth(j).scrollIntoViewIfNeeded();
                    countValor01 += getDoubleLocator(resultadoColunaTotalRecebido.nth(j));
                    countValor02 += getDoubleLocator(resultadoColunaTotalAgendado.nth(j));
                }

                verificacaoTotalizadoresAba = (
                    valor01 == countValor01
                    && valor02 == countValor02
                    && valor03 >= 0
                );
            } else if (abaRelatorio.equalsIgnoreCase("Futuros")) {
                Locator resultadoColunaValorLiquido =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorLiquido");

                for (int j = 0; j < resultadoColunaValorLiquido.count(); j++) {
                    resultadoColunaValorLiquido.nth(j).scrollIntoViewIfNeeded();
                    countTotal01++;
                    countValor01 += getDoubleLocator(resultadoColunaValorLiquido.nth(j));
                }

                verificacaoTotalizadoresAba = (
                    total01 == countTotal01
                    && valor01 == countValor01
                );
            } else if (abaRelatorio.equalsIgnoreCase("Débitos e ajustes")) {
                Locator resultadoColunaValorAluguel =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorAluguel");

                for (int j = 0; j < resultadoColunaValorAluguel.count(); j++) {
                    resultadoColunaValorAluguel.nth(j).scrollIntoViewIfNeeded();
                    countValor02 += getDoubleLocator(resultadoColunaValorAluguel.nth(j));
                }

                verificacaoTotalizadoresAba = (
                    valor02 == countValor02
                );
            }

            // Antecipação
            else if (abaRelatorio.equalsIgnoreCase("Histórico")) {
                Locator resultadoColunaValorLiquidoAprovado =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorLiquidoAprovado");

                for (int j = 0; j < resultadoColunaValorLiquidoAprovado.count(); j++) {
                    resultadoColunaValorLiquidoAprovado.nth(j).scrollIntoViewIfNeeded();
                    countTotal01++;
                    countValor01 += getDoubleLocator(resultadoColunaValorLiquidoAprovado.nth(j));
                }

                verificacaoTotalizadoresAba = (
                    total01 == countTotal01
                    && valor01 == countValor01
                );
            } else if (abaRelatorio.equalsIgnoreCase("Relatório de antecipações")) {
                Locator resultadoColunaValorBrutoVendas =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorBrutoVendas");

                Locator resultadoColunaValorLiquidoVendas =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorLiquidoVendas");

                Locator resultadoColunaValorDescontoMDR =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorDescontoMDR");

                Locator resultadoColunaValorPago =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorPago");

                Locator resultadoColunaValorDescontoAntecipacao =
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorDescontoAntecipacao");

                for (int j = 0; j < resultadoColunaValorBrutoVendas.count(); j++) {
                    resultadoColunaValorBrutoVendas.nth(j).scrollIntoViewIfNeeded();
                    countValor01 += getDoubleLocator(resultadoColunaValorBrutoVendas.nth(j));
                    countValor02 += getDoubleLocator(resultadoColunaValorLiquidoVendas.nth(j));
                    countValor03 += getDoubleLocator(resultadoColunaValorDescontoMDR.nth(j));
                    countValor04 += getDoubleLocator(resultadoColunaValorPago.nth(j));
                    countValor05 += getDoubleLocator(resultadoColunaValorDescontoAntecipacao.nth(j));
                }

                verificacaoTotalizadoresAba = (
                    valor01 == countValor01
                    && valor02 == countValor02
                    && valor03 == countValor03
                    && valor04 == countValor04
                    && valor05 == countValor05
                );
            }

            if ((i + 1) != sizePagination)
                click(btnNext);
        }

        Assert.assertTrue(verificacaoTotalizadoresAba);
    }

    private void verificarTotalizadoresArquivo(String abaRelatorio) throws IOException {
        boolean verificacaoTotalizadoresArquivo;

        String[] listaTipoArquivo = "Excel;CSV".split(";");
        String[] listaTipoRelatorio = new String[0];

        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje"))
            listaTipoRelatorio = "N".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas"))
            listaTipoRelatorio = "simplificado;detalhado".split(";");

        // Recebimentos
        else if (abaRelatorio.equalsIgnoreCase("Pagos"))
            listaTipoRelatorio = "simplificado;detalhado".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Futuros"))
            listaTipoRelatorio = "N".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Débitos e ajustes"))
            listaTipoRelatorio = "N".split(";");

        for (String tipoArquivo : listaTipoArquivo) {
            for (String tipoRelatorio : listaTipoRelatorio) {
                // realiza o exportar
                click(this.getLocatorFromReportTab(abaRelatorio, "btnExportar"));
                waitIsVisibleForSeconds(this.titleExportar, Config.WAIT_5_SECONDS);
                this.selecionarTipoArquivo(tipoArquivo, abaRelatorio);

                this.selecionarTipoRelatorio(tipoRelatorio, abaRelatorio);

                // Aguarda download ao clicar no botão Exportar
                Download download = page.waitForDownload(() -> this.btnGerarArquivo.click());

                String extensao = GeracaoArquivos.getExtensao(tipoArquivo);
                Path arquivoBaixado = download.path();
                File copiaArquivoBaixado = GeracaoArquivos.copiarArquivoAtribuirExtensao(arquivoBaixado.toFile(), extensao);

                verificacaoTotalizadoresArquivo = GeracaoArquivos.validarColunasTipoArquivo(abaRelatorio, tipoRelatorio, copiaArquivoBaixado);
                Assert.assertTrue(verificacaoTotalizadoresArquivo);
            }
        }
    }

    public void validarTotalizadores(@NotNull String abaRelatorio) throws IOException {
        this.verificarTotalizadoresAba(abaRelatorio);
        this.verificarTotalizadoresArquivo(abaRelatorio);
    }

    private Locator getLocatorFromReportTab(@NotNull String abaRelatorio, String campo) {
        Locator element = page.locator("");

        element = switch (abaRelatorio) {
            // Vendas
            case "Hoje" -> switch (campo) {
                case "txtCodAutorizacao" ->
                    page.locator("//*[@data-testid='vendas-hoje-input-cod-autorizacao']");
                case "iconeLupa" ->
                    page.locator("//*[@data-testid='vendas-hoje-link-search-cod-autorizacao']");
                case "btnFiltros" ->
                    page.locator("//*[@data-testid='vendas-hoje-link-filtrar']");
                case "btnPersonalizarColunas" ->
                    page.locator("//*[@data-testid='vendas-hoje-link-personalizar']");
                case "btnExportar" ->
                    page.locator("//*[@data-testid='exportar-hoje']");
                case "resultadoColunas" ->
                    page.locator("//*[@data-block='VendasHoje.HojeListaHistorico']");
                case "primeiroRegistroCodAutorizacao" ->
                    page.locator("(//*[@data-testid='vendas-hoje-coluna-cod-autorizacao' and not(text()='-')])[1]");
                case "resultadoColunaDataVenda" ->
                    page.locator("//*[@data-testid='vendas-hoje-coluna-data-venda']");
                case "resultadoColunaCodAutorizacao" ->
                    page.locator("//*[@data-testid='vendas-hoje-coluna-cod-autorizacao']");
                case "resultadoColunaComprovanteVenda" ->
                    page.locator("//*[@data-testid='vendas-hoje-coluna-comprovante-venda']");
                case "resultadoColunaProduto" ->
                    page.locator("//*[@data-testid='vendas-hoje-coluna-produto']");
                case "resultadoColunaParcelas" ->
                    page.locator("//*[@data-testid='vendas-hoje-coluna-parcela']");
                case "resultadoColunaBandeira" ->
                    page.locator("//*[@data-testid='vendas-hoje-coluna-bandeira']");
                case "resultadoColunaCanal" ->
                    page.locator("//*[@data-testid='vendas-hoje-coluna-canal']");
                case "resultadoColunaTerminal" ->
                    page.locator("//*[@data-testid='vendas-hoje-coluna-terminal']");
                case "resultadoColunaValorBruto" ->
                    page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-vlr-bruto')]");
                case "resultadoColunaStatus" ->
                    page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-status')]");
                case "resultadoColunaEsbalecimento" ->
                    page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-estabelecimento')]");
                case "resultadoColunaFinalCartao" ->
                    page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-final-cartao')]");
                case "resultadoColunaCodReferenciaCartao" ->
                    page.locator("//*[text()='Cód. referência do cartão']/../../../../div/span");
                default -> element;
            };

            case "Histórico de vendas" -> switch (campo) {
                case "txtCodAutorizacao" ->
                    page.locator("//*[contains(@id, 'Input_CodigoAutorizacao')]");
                case "iconeLupa" ->
                    page.locator("//*[@data-testid='vendas-hoje-link-search-cod-autorizacao']");
                case "btnFiltros" ->
                    page.locator("//*[@data-testid='historico-vendas-container-filtros']");
                case "btnPersonalizarColunas" ->
                    page.locator("//*[@data-testid='historico-vendas-container-personalizar-colunas']");
                case "btnExportar" ->
                    page.locator("//*[@data-testid='exportar-historicovendas']");
                case "resultadoColunas" ->
                    page.locator("//*[@data-block='VendasHistoricoVendas.HistoricoVendasLista']");
                case "primeiroRegistroCodAutorizacao" ->
                    page.locator("(//*[@data-testid='historico-vendas-codigo-autorizacao' and not(text()='-')])[1]");
                case "resultadoColunaDataVenda" ->
                    page.locator("//*[@data-testid='historico-vendas-data-compra']");
                case "resultadoColunaCodAutorizacao" ->
                    page.locator("//*[@data-testid='historico-vendas-codigo-autorizacao']");
                case "resultadoColunaComprovanteVenda" ->
                    page.locator("//*[@data-testid='historico-vendas-comprovante']");
                case "resultadoColunaProduto" ->
                    page.locator("//*[@data-testid='historico-vendas-produto']");
                case "resultadoColunaParcelas" ->
                    page.locator("//*[@data-testid='historico-vendas-parcelas']");
                case "resultadoColunaBandeira" ->
                    page.locator("//*[@data-testid='historico-vendas-bandeira']");
                case "resultadoColunaCanal" ->
                    page.locator("//*[@data-testid='historico-vendas-canal']");
                case "resultadoColunaTerminal" ->
                    page.locator("//*[@data-testid='historico-vendas-terminal']");
                case "resultadoColunaValorBruto" ->
                    page.locator("//*[@data-testid='historico-vendas-valor-bruto' and not(contains(@class, 'header'))]");
                case "resultadoColunaValorLiquido" ->
                    page.locator("//*[@data-testid='historico-vendas-valor-liquido' and not(contains(@class, 'header'))]");
                case "resultadoColunaValorTaxa" ->
                    page.locator("//*[@data-testid='historico-vendas-valor-taxa']");
                case "resultadoColunaValorOriginalVenda" ->
                    page.locator("//*[@data-testid='historico-vendas-valor-original-venda']");
                case "resultadoColunaStatus" ->
                    page.locator("//*[@data-testid='historico-vendas-status']");
                case "resultadoColunaEsbalecimento" ->
                    page.locator("//*[@data-testid='historico-vendas-estabelecimento']");
                case "resultadoColunaCodPedido" ->
                    page.locator("//*[@data-testid='historico-vendas-codigo-pedido']");
                case "resultadoColunaCodReferenciaCartao" ->
                    page.locator("//*[@data-testid='historico-vendas-codigo-cartao']");
                default -> element;
            };

            // Recebimentos
            case "Pagos", "Pagos_Meus Domicílios", "Pagos_Valores Cedidos" -> switch (campo) {
                case "txtCodPagamento" ->
                    page.locator("//*[contains(@id, '-Input_TextVar')]");
                case "iconeLupa" ->
                    page.locator("//*[contains(@class, 'recebimentos_pagos_buscar_cod_pagamento')]");
                case "btnFiltros" ->
                    page.locator("//*[contains(@class, 'recebimentos_pagos_filtros')]");
                case "btnPersonalizarColunas" ->
                    page.locator("//*[contains(@class, 'botao-personalizar')]");
                case "btnExportar" ->
                    page.locator("//*[@data-testid='botao-exportar-recebimentos-pagos']");
                case "resultadoColunas" ->
                    page.locator("//*[contains(@data-block, 'RecebimentosPagos')]");
                case "primeiroRegistroCodPagamento" ->
                    page.locator("(//*[contains(@id, '-Cod_depagamento')])[1]");
                case "resultadoColunaData" ->
                    page.locator("//div/span[contains(text(), '/')]").filter(new Locator.FilterOptions().setHasText("\\d{2}/\\d{2}/\\d{4}"));
                case "resultadoColunaBandeira" ->
                    page.locator("//*[contains(@id, '-NomeBandeira')]");
                case "resultadoColunaProduto" ->
                    page.locator("//*[contains(@id, '-DescProduto')]");
                case "resultadoColunaBanco" ->
                    page.locator("//*[contains(@id, '-Banco')]");
                case "resultadoColunaTipo" ->
                    page.locator("//*[contains(@id, '-Tipo')]");
                case "resultadoColunaEC" ->
                    page.locator("//*[contains(@id, '-EC')]");
                case "resultadoColunaCodPagamento" ->
                    page.locator("//*[contains(@id, '-Cod_depagamento')]");
                case "resultadoColunaValorPagamento" ->
                    page.locator("//*[contains(@id, '-Valordopagamento')]");
                case "resultadoColunaStatus" ->
                    page.locator("//*[contains(@id, '-Status')]");
                case "resultadoColunaTotalRecebido" ->
                    page.locator("//*[contains(@id, 'TotaldeDepositos2')]/div/span[contains(text(), 'R$ ')]");
                case "resultadoColunaTotalAgendado" ->
                    page.locator("//*[contains(@id, 'TotaldeAgendamentos2')]/div/span[contains(text(), 'R$ ')]");
                default -> element;
            };

            case "Futuros" -> switch (campo) {
                case "txtCodAutorizacao" ->
                    page.locator("//*[contains(@id, '-Input_TextVar')]");
                case "iconeLupa" ->
                    page.locator("//*[contains(@class, 'recebimentos_futuros_buscar_cod_autorizacao')]");
                case "btnFiltros" ->
                    page.locator("//*[contains(@class, 'recebimentos_futuros_filtros')]");
                case "btnPersonalizarColunas" ->
                    page.locator("//*[contains(@class, 'btn') and contains(@class, 'recebimentos_futuros_personalizar_colunas')]");
                case "btnExportar" ->
                    page.locator("//*[@data-testid='botao-exportar-recebimentos-futuros']");
                case "resultadoColunas" ->
                    page.locator("(//*[contains(@data-block, 'RecebimentosFuturos.RecebimentosFuturos')])[1]");
                case "primeiroRegistroCodAutorizacao" ->
                    page.locator("(//*[contains(@id, '-CodAutorizado')])[1]");
                case "resultadoColunaDataVenda" ->
                    page.locator("//*[contains(@id, '-DatadaVenda')]");
                case "resultadoColunaCodAutorizacao" ->
                    page.locator("//*[contains(@id, '-CodAutorizado')]");
                case "resultadoColunaProduto" ->
                    page.locator("//*[contains(@id, '-Produto')]");
                case "resultadoColunaParcelas" ->
                    page.locator("//*[contains(@id, '-Parcelado')]");
                case "resultadoColunaBandeira" ->
                    page.locator("//*[contains(@id, '-Bandeira')]");
                case "resultadoColunaValorBruto" ->
                    page.locator("//*[contains(@id, '-ValoBruto')]");
                case "resultadoColunaValorBrutoParcela" ->
                    page.locator("//*[contains(@id, '-ValorBrutoParcela')]");
                case "resultadoColunaValorLiquido" ->
                    page.locator("//*[contains(@id, '-ValorLiquido')]");
                case "resultadoColunaTerminal" ->
                    page.locator("//*[contains(@id, '-NumeroTerminal')]");
                case "resultadoColunaCanal" ->
                    page.locator("//*[contains(@id, '-Canal')]");
                case "resultadoColunaCodPedido" ->
                    page.locator("//*[contains(@id, '-CodPedido')]");
                case "resultadoColunaEstabelecimento" ->
                    page.locator("//*[contains(@id, '-Estabelecimento')]");
                default -> element;
            };

            case "Débitos e ajustes" -> switch (campo) {
                case "btnFiltros" ->
                    page.locator("(//*[text()='Filtros'])[1]");
                case "btnExportar" ->
                    page.locator("//*[@data-testid='botao-exportar-alugueis-debitos']");
                case "resultadoColunas" ->
                    page.locator("//*[@data-testid='resultado-debitos']");
                case "resultadoColunaDataAjuste" ->
                    page.locator("//div[span[text()='Data do ajuste']]/following-sibling::div/span");
                case "resultadoColunaValorAluguel" ->
                    page.locator("//div[span[text()='Valor do aluguel']]/following-sibling::div/span");
                case "resultadoColunaComprovante" ->
                    page.locator("//div[span[text()='Comprovante']]/following-sibling::div/span");
                case "resultadoColunaTecnologia" ->
                    page.locator("//div[span[text()='Tecnologia']]/following-sibling::div/span");
                case "resultadoColunaEstabelecimento" ->
                    page.locator("//div[span[text()='Estabelecimento']]/following-sibling::div/span");
                case "resultadoColunaDataEfetivaCobranca" ->
                    page.locator("//div[span[text()='Data efetiva da cobrança']]/following-sibling::div/span");
                case "resultadoColunaStatus" ->
                    page.locator("//div[span[text()='Status']]/following-sibling::div/span");
                default -> element;
            };

            // Antecipação
            case "Histórico" -> switch (campo) {
                case "btnFiltros" ->
                    page.locator("(//*[text()='Filtros'])[1]");
                case "btnExportar" ->
                    page.locator("//*[@data-testid='text-button-exportar']");
                case "resultadoColunas" ->
                    page.locator("//*[@data-block='Antecipacao.SolicitacoesAntecipacao']");
                case "resultadoColunaStatus" ->
                    page.locator("//div[contains(@id, '-Status')]/span/span");
                case "resultadoColunaDataSolitacao" ->
                    page.locator("//*[text()='Data da Solicitação:']/following-sibling::span");
                case "resultadoColunaValorBrutoSolicitado" ->
                    page.locator("//*[text()='Valor bruto solicitado:']/following-sibling::span");
                case "resultadoColunaValorLiquidoSolicitado" ->
                    page.locator("//*[text()='Valor líquido solicitado:']/following-sibling::span");
                case "resultadoColunaValorLiquidoAprovado" ->
                    page.locator("//*[text()='Valor líquido aprovado:']/following-sibling::span");
                default -> element;
            };

            case "Relatório de antecipações" -> switch (campo) {
                case "txtNumeroSimulacao" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-input-filter-simulacao']");
                case "iconeLupa" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-icon-search']");
                case "btnFiltros" ->
                    page.locator("//*[@data-testid='relatorio-de-antecipacoes-filtros']");
                case "btnExportar" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-button-exportar']");
                case "resultadoColunas" ->
                    page.locator("//*[@data-block='AntecipacaoRelatorio.AntecipacaoToggle']");
                case "primeiroRegistroNumeroSimulacao" ->
                    page.locator("(//*[@data-testid='relatorio-antecipacao-current-num-simulacao'])[1]");
                case "resultadoColunaNumeroSimulacao" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-current-num-simulacao']");
                case "resultadoColunaDataSolitacao" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-current-data']");
                case "resultadoColunaDataPagamento" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-current-data-antecipacao']");
                case "resultadoColunaValorBrutoVendas" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-current-valor-bruto']");
                case "resultadoColunaValorDescontoMDR" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-current-desconto-mdr']");
                case "resultadoColunaValorLiquidoVendas" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-current-valor-liquido']");
                case "resultadoColunaValorDescontoAntecipacao" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-current-desconto-antecipacao']");
                case "resultadoColunaValorPago" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-current-valor-antecipacao']");
                case "resultadoColunaTipo" ->
                    page.locator("//*[@data-testid='relatorio-antecipacao-current-tipo-antecipacao']");
                default -> element;
            };

            default -> element;
        };

        return element;
    }

    // Período
    private String obterNomeAbreviadoMes(LocalDate dataSelecionada) {
        TextStyle txtShort = TextStyle.SHORT;
        Locale localePtBr = Locale.forLanguageTag("pt-BR");

        // Obtém o nome abreviado do mês em português com a primeira letra maiúscula
        return dataSelecionada.getMonth()
                .getDisplayName(txtShort, localePtBr)
                .substring(0, 3)
                .substring(0, 1).toUpperCase() + dataSelecionada.getMonth()
                .getDisplayName(txtShort, localePtBr)
                .substring(1, 3);
    }

    private void selecionarPeriodoMes(String periodo) {
        LocalDate dataAtual = LocalDate.now();
        LocalDate dataSelecionada =
            (periodo.equalsIgnoreCase("M-1")) ? dataAtual.minusMonths(2) : dataAtual;

        String mesAtual = this.obterNomeAbreviadoMes(dataAtual);
        String mesPeriodo = this.obterNomeAbreviadoMes(dataSelecionada);

        Locator prevNextMonth = page.locator("");
        if (
            mesAtual.equalsIgnoreCase("Jan")
            && periodo.equalsIgnoreCase("M-1")
        )
            prevNextMonth = page.locator("//*[@class='flatpickr-prev-month']");
        else if (
            mesAtual.equalsIgnoreCase("Dez")
            && periodo.equalsIgnoreCase("M+1")
        )
            prevNextMonth = page.locator("//*[@class='flatpickr-next-month']");

        if (
            (mesAtual.equalsIgnoreCase("Jan") && periodo.equalsIgnoreCase("M-1"))
            || (mesAtual.equalsIgnoreCase("Dez") && periodo.equalsIgnoreCase("M+1"))
        )
            click(prevNextMonth);

        // seleciona o mês
        click(page.locator("//*[text()='"+mesPeriodo+"']"));
        // clica no botão Aplicar
        click(page.locator("//*[@data-testid='button-apply-filter-month']"));
    }

    public void aplicarPeriodo(@NotNull String periodo, String abaRelatorio) {
        waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_20_SECONDS
        );
        click(this.iconeCalendario);

        Locator cbkPeriodo = switch (periodo) {
            case "Hoje" ->
                page.locator("//*[@data-testid='generic-calendar-pill-hoje']");
            case "Ontem" ->
                page.locator("//*[@data-testid='generic-calendar-pill-ontem']");
            case "Últimos 7 Dias" ->
                page.locator("//*[@data-testid='generic-calendar-pill-últimos-7-dias']");
            case "Últimos 14 Dias" ->
                page.locator("//*[@data-testid='generic-calendar-pill-últimos-14-dias']");
            case "Mês Atual" ->
                page.locator("//*[@data-testid='generic-calendar-pill-mês-atual']");
            case "Este Mês" ->
                page.locator("//*[@data-testid='generic-calendar-pill-este-mês']");
            case "Essa Semana" ->
                page.locator("//*[@data-testid='generic-calendar-pill-essa-semana']");
            case "Amanhã" ->
                page.locator("//*[@data-testid='generic-calendar-pill-amanhã']");
            case "Proxima Semana" ->
                page.locator("//*[@data-testid='generic-calendar-pill-proxima-semana']");
            case "Até o fim de Semana" ->
                page.locator("//*[@data-testid='generic-calendar-pill-até-o-fim-de-semana']");
            case "Próximo Mês" ->
                page.locator("//*[@data-testid='generic-calendar-pill-próximo-mês']");
            case "Até o fim do mês" ->
                page.locator("//*[@data-testid='generic-calendar-pill-até-o-fim-do-mês']");
            case "Mês Passado" ->
                page.locator("//*[@data-testid='generic-calendar-pill-mês-passado']");
            default -> page.locator("");
        };

        if (
            periodo.equalsIgnoreCase("M-1")
            || periodo.equalsIgnoreCase("M+1")
        )
            this.selecionarPeriodoMes(periodo);
        else if (periodo.equalsIgnoreCase("M0"))
            System.out.println("Mês atual é default na aplicação do período do calendário");
        else
            click(cbkPeriodo);
    }

    private static boolean verificarDataPeriodo(String dataCompleta, String periodo) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime data = LocalDateTime.parse(dataCompleta, formatter);

        LocalDate hoje = LocalDate.now();
        DayOfWeek diaSemana = hoje.getDayOfWeek();
        LocalDateTime inicioSemana = hoje.minusDays(diaSemana.getValue() - 1).atStartOfDay();
        LocalDateTime proximoDomingo = hoje.with(DayOfWeek.SUNDAY).plusWeeks(1).atStartOfDay();
        LocalDateTime proximoSabado = proximoDomingo.plusDays(6);
        LocalDateTime primeiroDiaMesAtual = hoje.withDayOfMonth(1).atStartOfDay();
        LocalDateTime ultimoDiaMesAtual = hoje.withDayOfMonth(hoje.lengthOfMonth())
        .atTime(23, 59, 59);
        LocalDateTime primeiroDiaProximoMes = hoje.plusMonths(1).withDayOfMonth(1).atStartOfDay();
        LocalDateTime ultimoDiaProximoMes = hoje.plusMonths(1)
        .withDayOfMonth(hoje.plusMonths(1).lengthOfMonth()).atTime(23, 59, 59);
        LocalDateTime seteDiasAtras = LocalDateTime.now().minusDays(7);
        LocalDateTime quatorzeDiasAtras = LocalDateTime.now().minusDays(14);
        LocalDateTime umMesAtras = hoje.minusMonths(1).atStartOfDay();
        LocalDateTime doisMesesAtras = hoje.minusMonths(2).atStartOfDay();
        LocalDateTime primeiroDiaMesPassado = hoje.minusMonths(1).withDayOfMonth(1).atStartOfDay();
        LocalDateTime ultimoDiaMesPassado = hoje.minusMonths(1)
        .withDayOfMonth(hoje.minusMonths(1).lengthOfMonth()).atTime(23, 59, 59);

        return switch (periodo) {
            case "Hoje" ->
                data.toLocalDate().isEqual(hoje);
            case "Ontem" ->
                data.toLocalDate().isEqual(hoje.minusDays(1));
            case "Últimos 7 Dias" ->
                data.isAfter(seteDiasAtras) && data.isBefore(LocalDateTime.now());
            case "Últimos 14 Dias" ->
                data.isAfter(quatorzeDiasAtras) && data.isBefore(LocalDateTime.now());
            case "Mês Atual", "Este Mês" ->
                !data.isBefore(primeiroDiaMesAtual) && !data.isAfter(LocalDateTime.now());
            case "Essa Semana" ->
                !data.isBefore(inicioSemana) && !data.isAfter(LocalDateTime.now());
            case "Amanhã" ->
                data.toLocalDate().equals(hoje.plusDays(1));
            case "Proxima Semana" ->
                !data.isBefore(proximoDomingo) && !data.isAfter(proximoSabado);
            case "Até o fim de Semana" ->
                !data.isBefore(LocalDateTime.now()) && !data.isAfter(proximoSabado);
            case "Próximo Mês" ->
                !data.isBefore(primeiroDiaProximoMes) && !data.isAfter(ultimoDiaProximoMes);
            case "Até o fim do mês" ->
                !data.isBefore(LocalDateTime.now()) && !data.isAfter(ultimoDiaMesAtual);
            case "M-1" ->
                data.toLocalDate().getMonth().equals(umMesAtras.toLocalDate().getMonth())
                && data.toLocalDate().getYear() == umMesAtras.toLocalDate().getYear();
            case "M0" ->
                data.toLocalDate().getMonth().equals(doisMesesAtras.toLocalDate().getMonth())
                && data.toLocalDate().getYear() == doisMesesAtras.toLocalDate().getYear();
            case "M+1" ->
                data.toLocalDate().getMonth().equals(hoje.getMonth())
                && data.toLocalDate().getYear() == hoje.getYear();
            case "Mês Passado" ->
                !data.isBefore(primeiroDiaMesPassado) && !data.isAfter(ultimoDiaMesPassado);
            default -> false;
        };
    }

    private void expandirSePrimeiroRegistro() {
        Locator semExpandir = page.locator("(//*[contains(text(), 'Data da venda')])[1]");
        Locator diaSemana = page.locator("(//span[contains(text(), '-feira')])[1]");
        Locator calendario = page.locator("(//img[contains(@src, 'calendar')])[2]");
        Locator expandir1 = page.locator("(//*[contains(@class, 'osui-accordion-item__icon')])[1]");
        Locator expandir2 = page.locator("(//*[contains(@class, 'osui-accordion-item__icon')])[3]");

        if (semExpandir.isVisible())
            waitIsVisibleForSeconds(semExpandir, Config.WAIT_5_SECONDS);
        else if (diaSemana.isVisible() || calendario.isVisible()) { // Expandir: dia da semana
            waitForSeconds(Config.WAIT_5_SECONDS);
            click(expandir1);
            waitForSeconds(Config.WAIT_5_SECONDS);
        } else if (expandir1.isVisible() || expandir2.isVisible()) { // Expandir: Mês e dia da semana
            waitForSeconds(Config.WAIT_5_SECONDS);
            click(expandir1);

            waitForSeconds(Config.WAIT_5_SECONDS);
            click(expandir2);
            waitForSeconds(Config.WAIT_5_SECONDS);
        }
    }

    public void validarPeriodoAplicado(String periodo, String abaRelatorio) {
        this.expandirSePrimeiroRegistro();

        Locator resultadoColunaData = page.locator("");
        // Vendas
        if (
            abaRelatorio.equalsIgnoreCase("Hoje")
            || abaRelatorio.equalsIgnoreCase("Histórico de vendas")
        )
            resultadoColunaData = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataVenda");

        // Recebimentos
        else if (
            abaRelatorio.equalsIgnoreCase("Pagos")
            || abaRelatorio.equalsIgnoreCase("Futuros")
            || abaRelatorio.equalsIgnoreCase("Débitos e ajustes")
        )
            resultadoColunaData = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaData");

        // Antecipação
        else if (
            abaRelatorio.equalsIgnoreCase("Histórico")
            || abaRelatorio.equalsIgnoreCase("Relatório de antecipações")
        )
            resultadoColunaData = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataSolitacao");

        String dataCompleta;
        for (int i = 0; i < resultadoColunaData.count(); i++) {
            resultadoColunaData.nth(i).scrollIntoViewIfNeeded();
            // Realizar um tratamento para a Data da venda
            dataCompleta = resultadoColunaData.nth(i).textContent().trim().replace(" às ", " ");
            if (verificarDataPeriodo(dataCompleta, periodo))
                assertThat(resultadoColunaData.nth(i)).isVisible();
            else
                assertThat(resultadoColunaData.nth(i)).not().isVisible();
        }
    }

    private void clickItemFiltro(String abaRelatorio, String filtro, String valor, String funcao) {
        if (!abaRelatorio.equalsIgnoreCase("Histórico")){
            Locator itemFiltro = switch (filtro) {
                case "Status" -> switch (funcao) {
                    case "selecionarTudo" -> page.locator("//*[@data-testid='generic-filter-check-all-status']");
                    case "limparTudo" -> page.locator("//*[@data-testid='generic-filter-link-clean-status']");
                    case "selecionarItem" -> page.locator("//*[@data-testid='generic-filter-check-status-" + valor.replace(" ", "-") + "']");
                    default -> page.locator("//*[@data-testid='generic-filter-accordion-title-status']");
                };
                case "Produto" -> switch (funcao) {
                    case "selecionarTudo" -> page.locator("//*[@data-testid='generic-filter-check-all-produtos']");
                    case "limparTudo" -> page.locator("//*[@data-testid='generic-filter-link-clean-produtos']");
                    case "selecionarItem" -> page.locator("//*[@data-testid='generic-filter-check-produto-" + valor.replace(" ", "-") + "']");
                    default -> page.locator("//*[@data-testid='generic-filter-accordion-title-produtos']");
                };
                case "Canal" -> switch (funcao) {
                    case "selecionarTudo" -> page.locator("//*[@data-testid='generic-filter-check-all-canais']");
                    case "limparTudo" -> page.locator("//*[@data-testid='generic-filter-link-clean-canais']");
                    case "selecionarItem" -> page.locator("//*[@data-testid='generic-filter-check-canal-" + valor.replace(" ", "-") + "']");
                    default -> page.locator("//*[@data-testid='generic-filter-accordion-title-canal']");
                };
                case "Bandeira" -> switch (funcao) {
                    case "selecionarTudo" -> page.locator("//*[@data-testid='generic-filter-check-all-bandeiras']");
                    case "limparTudo" -> page.locator("//*[@data-testid='generic-filter-link-clean-bandeiras']");
                    case "selecionarItem" -> page.locator("//*[@data-testid='generic-filter-div-bandeira-" + valor.replace(" ", "-") + "']");
                    default -> page.locator("//*[@data-testid='generic-filter-accordion-title-bandeira']");
                };
                case "Estabelecimento" -> switch (funcao) {
                    case "selecionarTudo" -> page.locator("//*[@data-testid='generic-filter-check-all-estabelecimentos']");
                    case "limparTudo" -> page.locator("//*[@data-testid='generic-filter-link-clean-estabelecimentos']");
                    case "selecionarItem" -> page.locator("//*[@data-testid='generic-filter-check-estabelecimento-" + valor.replace(" ", "-") + "']");
                    default -> page.locator("//*[@data-testid='generic-filter-accordion-title-estabelecimentos']");
                };
                case "Terminal" -> switch (funcao) {
                    case "selecionarTudo" -> page.locator("//*[@data-testid='generic-filter-check-all-terminais']");
                    case "limparTudo" -> page.locator("//*[@data-testid='generic-filter-link-clean-terminais']");
                    case "selecionarItem" -> page.locator("//*[@data-testid='generic-filter-check-terminal-" + valor.replace(" ", "-") + "']");
                    default -> page.locator("//*[@data-testid='generic-filter-accordion-title-terminais']");
                };
                case "Banco" -> switch (funcao) {
                    case "selecionarTudo" -> page.locator("//*[@data-testid='generic-filter-check-all-bancos']");
                    case "limparTudo" -> page.locator("//*[@data-testid='generic-filter-link-clean-bancos']");
                    case "selecionarItem" -> page.locator("//*[@data-testid='generic-filter-check-banco-" + valor.replace(" ", "-") + "']");
                    default -> page.locator("//*[@data-testid='generic-filter-accordion-title-bancos']");
                };
                case "Tipos" -> switch (funcao) {
                    case "selecionarTudo" -> page.locator("//*[@data-testid='generic-filter-check-all-tipos']");
                    case "limparTudo" -> page.locator("//*[@data-testid='generic-filter-link-clean-tipos']");
                    case "selecionarItem" -> page.locator("//*[@data-testid='generic-filter-check-tipo-" + valor.replace(" ", "-") + "']");
                    default -> page.locator("//*[@data-testid='generic-filter-accordion-title-tipos']");
                };
                default -> page.locator("");
            };

            itemFiltro.click();
        } else {
            Locator itemFiltro = switch (funcao) {
                case "selecionarTudo" -> page.locator("//*[contains(@id, '-CheckboxTodos')]");
                case "limparTudo" -> page.locator("(//*[text()='Limpar seleções'])[1]");
                case "selecionarItem" -> page.locator("//*[text()='"+ valor +"']/preceding-sibling::*/input[contains(@id, '-CheckboxStatus')]");
                default -> page.locator("");
            };

            itemFiltro.click();
        }
    }

    public void realizarFiltro(@NotNull String filtro, String valor, String abaRelatorio) {
        waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_20_SECONDS
        );
        this.getLocatorFromReportTab(abaRelatorio, "btnFiltros").scrollIntoViewIfNeeded();

        boolean seBtnFitros =
            !filtro.equalsIgnoreCase("Cód. de autorização")
            && !filtro.equalsIgnoreCase("Cód. de pagamento")
            && !filtro.equalsIgnoreCase("Número da simulação");

        if (seBtnFitros) {
            waitIsVisibleForSeconds(this.titleFiltros, Config.WAIT_5_SECONDS);
            click(this.getLocatorFromReportTab(abaRelatorio, "btnFiltros"));
        }

        this.expandirSePrimeiroRegistro();

        // realiza o filtro pelo seu tipo (campo) e passa o valor desejado
        switch (filtro) {
            case "Cód. de autorização":
                if (valor.equalsIgnoreCase("primeiroRegistro"))
                    pressValue(
                        this.getLocatorFromReportTab(
                             abaRelatorio
                            , "txtCodAutorizacao"
                        )
                        ,this.getLocatorFromReportTab(abaRelatorio, "primeiroRegistroCodAutorizacao")
                            .textContent()
                            .replace("Cód. de autorização", "")
                            .trim()
                    );
                else
                    pressValue(
                        this.getLocatorFromReportTab(
                                 abaRelatorio
                                , "txtCodAutorizacao"
                        )
                        ,valor
                    );

                break;

            case "Cód. de pagamento":
                if (valor.equalsIgnoreCase("primeiroRegistro"))
                    pressValue(
                        this.getLocatorFromReportTab(
                                 abaRelatorio
                                , "txtCodPagamento"
                        )
                        ,this.getLocatorFromReportTab(abaRelatorio, "primeiroRegistroCodPagamento")
                            .textContent()
                            .replace("Cód. de pagamento", "")
                            .trim()
                    );
                else
                    pressValue(
                        this.getLocatorFromReportTab(
                             abaRelatorio
                            , "txtCodPagamento"
                        )
                        ,valor
                    );

                break;

            case "Número da simulação":
                if (valor.equalsIgnoreCase("primeiroRegistro"))
                    pressValue(
                        this.getLocatorFromReportTab(
                             abaRelatorio
                            , "txtNumeroSimulacao"
                        )
                        ,this.getLocatorFromReportTab(abaRelatorio, "primeiroRegistroNumeroSimulacao")
                            .textContent()
                            .replace("Número da simulação", "")
                            .trim()
                    );
                else
                    pressValue(
                        this.getLocatorFromReportTab(
                             abaRelatorio
                            , "txtNumeroSimulacao"
                        )
                        ,valor
                    );

                break;

            case "Valores":
                click(this.linkValores);

                // valor De e Ate separados por ";"
                String[] valores = valor.split(";");
                pressValue(this.txtValoresDe, valores[0]);
                pressValue(this.txtValoresAte, valores[1]);

                break;

            case "Status", "Produto", "Canal", "Bandeira", "Estabelecimento", "Terminal", "Banco", "Tipos":
                if (!abaRelatorio.equalsIgnoreCase("Histórico"))
                    this.clickItemFiltro(abaRelatorio, filtro, "", "");

                switch (valor) {
                    case "todos":
                        this.clickItemFiltro(abaRelatorio, filtro, "", "selecionarTudo");
                        break;
                    case "nenhum":
                        this.clickItemFiltro(abaRelatorio, filtro, "", "limparTudo");
                        break;
                    default:
                        this.clickItemFiltro(abaRelatorio, filtro, valor, "selecionarItem");
                }

                break;
        }

        if (seBtnFitros)
            click(this.btnMostrarResultados);
        else
            click(this.getLocatorFromReportTab(abaRelatorio, "iconeLupa"));

        waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_20_SECONDS
        );
    }

    // Personalizar Colunas
    private void atribuirFocoColunaPersonalizacao(String coluna) {
        Locator campoFoco = page.locator("//*[text()='"+coluna+"']/preceding-sibling::*/input[@type='checkbox']");
        campoFoco.scrollIntoViewIfNeeded();
    }

    private String[] atribuirListaInicialColunas(@NotNull String abaRelatorio) {
        String[] listaInicialColunas = new String[0];
        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje"))
            listaInicialColunas = "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Bandeira;Canal;Terminal;Valor bruto;Status".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas"))
            listaInicialColunas = "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Canal;Valor bruto;Valor líquido;Status;Terminal".split(";");

        // Recebimentos
        else if (
            abaRelatorio.equalsIgnoreCase("Pagos_Meus Domicílios")
            || abaRelatorio.equalsIgnoreCase("Pagos_Valores Cedidos")
        )
            listaInicialColunas = "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Futuros"))
            listaInicialColunas = "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto da parcela;Valor líquido;Número do Terminal;Canal".split(";");

        // Débitos e ajustes, Histórico e Realatório de antecipações não tem Personalizar colunas

        return listaInicialColunas;
    }

    private void voltarPadraoPersonalizarColunas(String abaRelatorio) {
        click(this.getLocatorFromReportTab(abaRelatorio, "btnPersonalizarColunas"));
        waitIsVisibleForSeconds(this.titlePersonalizarColunas, Config.WAIT_5_SECONDS);

        click(this.linkVoltarPadrao);

        waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_20_SECONDS
        );
    }

    private void realizarTrocaPersonalizarColunas(String colunaRemover, String colunaAdicionar) {
        // Atribuir foco na coluna escolhida
        this.atribuirFocoColunaPersonalizacao(colunaAdicionar);

        // Remover coluna
        click(page.locator("//*[text()='"+colunaRemover+"']/preceding-sibling::*/input[@type='checkbox']"));

        // Adicionar coluna
        click(page.locator("//*[text()='"+colunaAdicionar+"']/preceding-sibling::*/input[@type='checkbox']"));

        click(this.btnAplicarPersonalizacao);
    }

    public void isViewColunasPersonalizar(String colunas, String abaRelatorio) {
        waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_20_SECONDS
        );
        // Acessa o Personalizar Colunas
        click(this.getLocatorFromReportTab(abaRelatorio, "btnPersonalizarColunas"));
        waitIsVisibleForSeconds(this.titlePersonalizarColunas, Config.WAIT_5_SECONDS);

        this.linkVoltarPadrao.scrollIntoViewIfNeeded();
        waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_20_SECONDS
        );

        // Validar que as colunas não estão visíveis
        String[] listaColunas = colunas.split(";");
        for (String coluna : listaColunas)
            assertThat(page.locator("//*[text()='"+coluna+"']/preceding-sibling::*/input[@type='checkbox']")).not().isVisible();
    }

    public void personalizarColunas(String colunas, String abaRelatorio) {
        waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_20_SECONDS
        );
        // Acessa o Personalizar Colunas
        click(this.getLocatorFromReportTab(abaRelatorio, "btnPersonalizarColunas"));
        waitIsVisibleForSeconds(this.titlePersonalizarColunas, Config.WAIT_5_SECONDS);

        this.linkVoltarPadrao.scrollIntoViewIfNeeded();
        waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_20_SECONDS
        );

        // Limpar personalização inicial de colunas
        String[] listaInicialColunas = this.atribuirListaInicialColunas(abaRelatorio);
        for (String coluna1 : listaInicialColunas)
            click(page.locator("//*[text()='"+coluna1+"']/preceding-sibling::*/input[@type='checkbox']"));

        // Selecionar colunas enviadas por parâmetro
        String[] listaColunas = colunas.split(";");
        for (String coluna2 : listaColunas)
            click(page.locator("//*[text()='"+coluna2+"']/preceding-sibling::*/input[@type='checkbox']"));

        click(this.btnAplicarPersonalizacao);
    }

    public void validarPersonalizacaoColunas(@NotNull String colunas, String abaRelatorio) {
        waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_20_SECONDS
        );
        this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas").scrollIntoViewIfNeeded();

        String[] listaColunas = colunas.split(";");
        for (String coluna : listaColunas) {
            Locator colunaResultado = this.getColunaResultado(coluna, abaRelatorio);

            for (int i = 0; i < colunaResultado.count(); i++)
                assertThat(colunaResultado.nth(i)).isVisible();
        }

        this.voltarPadraoPersonalizarColunas(abaRelatorio);
    }

    private Locator getColunaResultado(String coluna, String abaRelatorio) {
        return switch (coluna) {
            case "Data da venda" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataVenda");
            case "Data alvo" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataAlvo");
            case "Data do ajuste" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataAjuste");
            case "Data efetiva da cobrança" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataEfetivaCobranca");
            case "Data da solicitação" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataSolitacao");
            case "Data do pagamento" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataPagamento");
            case "Cód. de autorização" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodAutorizacao");
            case "Cód. de pagamento" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodPagamento");
            case "Número da simulação" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaNumeroSimulacao");
            case "Comprovante de venda" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaComprovanteVenda");
            case "Produto" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaProduto");
            case "Parcelas", "Parcelado" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaParcelas");
            case "Bandeira" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaBandeira");
            case "Canal" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCanal");
            case "Terminal", "Número do Terminal" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaTerminal");
            case "Valor bruto" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorBruto");
            case "Valor líquido" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorLiquido");
            case "Valor da taxa" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorTaxa");
            case "Valor original da venda" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorOriginalVenda");
            case "Valor autorizado" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorAutorizado");
            case "Valor confirmado" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorConfirmado");
            case "Valor de pagamento" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorPagamento");
            case "Valor bruto da parcela" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorBrutoParcela");
            case "Valor do aluguel" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorAluguel");
            case "Valor bruto das vendas" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorBrutoVendas");
            case "Valor desconto MDR" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorDescontoMDR");
            case "Valor Líquido das vendas" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorLiquidoVendas");
            case "Valor desconto antecipação" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorDescontoAntecipacao");
            case "Valor pago" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorPago");
            case "Status" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaStatus");
            case "Estabelecimento", "Estabelecimento comercial", "Número do estabelecimento" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaEsbalecimento");
            case "Final do cartão" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaFinalCartao");
            case "Cód. referência do cartão" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodReferenciaCartao");
            case "Cód. do pedido" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodPedido");
            case "Banco" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaBanco");
            case "Tipo" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaTipo");
            case "EC" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaEC");
            case "Código de pagamento" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodPagamento");
            case "Comprovante" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaComprovante");
            case "Tecnologia" ->
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaTecnologia");
            default -> page.locator("");
        };
    }

    private String[] atribuirResultadoColunaValor(@NotNull String abaRelatorio) {
        String[] listaResultadoColunaValor = new String[0];
        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje"))
            listaResultadoColunaValor = "resultadoColunaValorBruto".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas"))
            listaResultadoColunaValor = "resultadoColunaValorBruto;resultadoColunaValorLiquido;resultadoColunaValorOriginalVenda".split(";");

        // Recebimentos
        else if (
            abaRelatorio.equalsIgnoreCase("Pagos_Meus Domicílios")
            || abaRelatorio.equalsIgnoreCase("Pagos_Valores Cedidos")
        )
            listaResultadoColunaValor = "resultadoColunaValorPagamento".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Débitos e ajustes"))
            listaResultadoColunaValor = "resultadoColunaValorAluguel".split(";");

        return listaResultadoColunaValor;
    }

    // Resultado coluna
    public void validarAtribuicaoFiltro(String valor, @NotNull String filtro, String abaRelatorio) {
        waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_20_SECONDS
        );
        this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas").scrollIntoViewIfNeeded();

        this.expandirSePrimeiroRegistro();

        switch (filtro) {
            case "Cód. de autorização":
                Locator resultadoColunaCodAutorizacao = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodAutorizacao");
                for (int i = 0; i < resultadoColunaCodAutorizacao.count(); i++)
                    if (valor.equalsIgnoreCase("primeiroRegistro"))
                        assertThat(resultadoColunaCodAutorizacao.nth(i)).containsText(
                            this.getLocatorFromReportTab(abaRelatorio, "primeiroRegistroCodAutorizacao").textContent().trim()
                        );
                    else
                        assertThat(resultadoColunaCodAutorizacao.nth(i)).containsText(valor);
                break;

            case "Cód. de pagamento":
                Locator resultadoColunaCodPagamento = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodPagamento");
                for (int i = 0; i < resultadoColunaCodPagamento.count(); i++)
                    if (valor.equalsIgnoreCase("primeiroRegistro"))
                        assertThat(resultadoColunaCodPagamento.nth(i)).containsText(
                                this.getLocatorFromReportTab(abaRelatorio, "primeiroRegistroCodPagamento").textContent().trim()
                        );
                    else
                        assertThat(resultadoColunaCodPagamento.nth(i)).containsText(valor);
                break;

            case "Número da simulação":
                Locator resultadoColunaNumeroSimulacao = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaNumeroSimulacao");
                for (int i = 0; i < resultadoColunaNumeroSimulacao.count(); i++)
                    if (valor.equalsIgnoreCase("primeiroRegistro"))
                        assertThat(resultadoColunaNumeroSimulacao.nth(i)).containsText(
                                this.getLocatorFromReportTab(abaRelatorio, "primeiroRegistroNumeroSimulacao").textContent().trim()
                        );
                    else
                        assertThat(resultadoColunaNumeroSimulacao.nth(i)).containsText(valor);
                break;

            case "Status":
                Locator resultadoColunaStatus = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaStatus");
                for (int i = 0; i < resultadoColunaStatus.count(); i++)
                    if (valor.equalsIgnoreCase("todos"))
                        assertThat(resultadoColunaStatus.nth(i)).isVisible();
                    else
                        assertThat(resultadoColunaStatus.nth(i)).containsText(valor);
                break;

            case "Produto":
                Locator resultadoColunaProduto = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaProduto");
                for (int i = 0; i < resultadoColunaProduto.count(); i++)
                    if (valor.equalsIgnoreCase("todos"))
                        assertThat(resultadoColunaProduto.nth(i)).isVisible();
                    else
                        assertThat(resultadoColunaProduto.nth(i)).containsText(valor);
                break;

            case "Canal":
                Locator resultadoColunaCanal = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCanal");
                for (int i = 0; i < resultadoColunaCanal.count(); i++)
                    if (valor.equalsIgnoreCase("todos"))
                        assertThat(resultadoColunaCanal.nth(i)).isVisible();
                    else
                        assertThat(resultadoColunaCanal.nth(i)).containsText(valor);
                break;

            case "Bandeira":
                Locator resultadoColunaBandeira = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaBandeira");
                for (int i = 0; i < resultadoColunaBandeira.count(); i++)
                    if (valor.equalsIgnoreCase("todos"))
                        assertThat(resultadoColunaBandeira.nth(i)).isVisible();
                    else
                        assertThat(resultadoColunaBandeira.nth(i)).containsText(valor);
                break;

            case "Valores":
                if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
                    // Acessa o Personalizar Colunas
                    click(this.getLocatorFromReportTab(abaRelatorio, "btnPersonalizarColunas"));
                    waitIsVisibleForSeconds(this.titlePersonalizarColunas, Config.WAIT_5_SECONDS);

                    // Remove o Terminal e adiciona o Valor original da venda aplicando a personalização de colunas
                    String colunaRemover = "Terminal", colunaAdicionar = "Valor original da venda";
                    this.realizarTrocaPersonalizarColunas(colunaRemover, colunaAdicionar);

                    waitIsVisibleForSeconds(
                         this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
                        ,Config.WAIT_20_SECONDS
                    );
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas").scrollIntoViewIfNeeded();
                }

                String[] listaResultadoColunaValor = this.atribuirResultadoColunaValor(abaRelatorio);

                for (String resultadoColunaValor : listaResultadoColunaValor) {
                    Locator resultadoColunaValorAbaRelatorio = this.getLocatorFromReportTab(abaRelatorio, resultadoColunaValor);

                    for (int i = 0; i < resultadoColunaValorAbaRelatorio.count(); i++) {
                        double valorColunaReal = replaceMonetaryValue(
                            resultadoColunaValorAbaRelatorio.nth(i).textContent()
                        );

                        // valor De e Ate separados por ";"
                        String[] valores = valor.split(";");
                        double valorDe = Double.parseDouble(valores[0]);
                        double valorAte = Double.parseDouble(valores[1]);

                        if ((valorColunaReal >= valorDe) && (valorColunaReal <= valorAte))
                            assertThat(resultadoColunaValorAbaRelatorio.nth(i)).isVisible();
                        else
                            assertThat(resultadoColunaValorAbaRelatorio.nth(i)).not().isVisible();
                    }
                }

                if (abaRelatorio.equalsIgnoreCase("Histórico de vendas"))
                    this.voltarPadraoPersonalizarColunas(abaRelatorio);

                break;

            case "Estabelecimento":
                // Acessa o Personalizar Colunas
                click(this.getLocatorFromReportTab(abaRelatorio, "btnPersonalizarColunas"));
                waitIsVisibleForSeconds(this.titlePersonalizarColunas, Config.WAIT_5_SECONDS);

                // Remove o Status e adiciona o Esbelecimento aplicando a personalização de colunas
                    String colunaRemover = "Status", colunaAdicionar;
                if (abaRelatorio.equalsIgnoreCase("Pré-autorizações"))
                    colunaAdicionar = "Estabelecimento comercial";
                else if (abaRelatorio.equalsIgnoreCase("Voucher"))
                    colunaAdicionar = "Número do estabelecimento";
                else
                    colunaAdicionar = "Estabelecimento";

                this.realizarTrocaPersonalizarColunas(colunaRemover, colunaAdicionar);

                waitIsVisibleForSeconds(
                     this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
                    ,Config.WAIT_20_SECONDS
                );
                this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas").scrollIntoViewIfNeeded();

                Locator resultadoColunaEsbalecimento = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaEsbalecimento");
                for (int i = 0; i < resultadoColunaEsbalecimento.count(); i++)
                    if (valor.equalsIgnoreCase("todos"))
                        assertThat(resultadoColunaEsbalecimento.nth(i)).isVisible();
                    else
                        assertThat(resultadoColunaEsbalecimento.nth(i)).containsText(valor);

                this.voltarPadraoPersonalizarColunas(abaRelatorio);
                break;

            case "Terminal":
                Locator resultadoColunaTerminal = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaTerminal");
                for (int i = 0; i < resultadoColunaTerminal.count(); i++)
                    if (valor.equalsIgnoreCase("todos"))
                        assertThat(resultadoColunaTerminal.nth(i)).isVisible();
                    else
                        assertThat(resultadoColunaTerminal.nth(i)).containsText(valor);
                break;

            case "Banco":
                Locator resultadoColunaBanco = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaBanco");
                for (int i = 0; i < resultadoColunaBanco.count(); i++)
                    if (valor.equalsIgnoreCase("todos"))
                        assertThat(resultadoColunaBanco.nth(i)).isVisible();
                    else
                        assertThat(resultadoColunaBanco.nth(i)).containsText(valor);
                break;

            case "Tipos":
                Locator resultadoColunaTipo = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaTipo");
                for (int i = 0; i < resultadoColunaTipo.count(); i++)
                    if (valor.equalsIgnoreCase("todos"))
                        assertThat(resultadoColunaTipo.nth(i)).isVisible();
                    else
                        assertThat(resultadoColunaTipo.nth(i)).containsText(valor);
                break;
        }
    }

    // Registros
    public void validarApresentacaoTransacoes(String apresentacao) {
        if (apresentacao.equalsIgnoreCase("apresenta"))
            waitIsNotVisibleForSeconds(this.nenhumResultadoEncontrado, Config.WAIT_20_SECONDS);
        else if (apresentacao.equalsIgnoreCase("não apresenta"))
            waitIsVisibleForSeconds(this.nenhumResultadoEncontrado, Config.WAIT_20_SECONDS);
    }

    // Gerar arquivo
    private void selecionarTipoArquivo(@NotNull String tipoArquivo, String abaRelatorio) {
        if (!abaRelatorio.equalsIgnoreCase("Histórico")) {
            this.slcTipoArquivo.hover();

            if (tipoArquivo.equalsIgnoreCase("Excel"))
                click(this.optExcel);
            else if (tipoArquivo.equalsIgnoreCase("CSV"))
                click(this.optCSV);
        } else {
            if (tipoArquivo.equalsIgnoreCase("Excel"))
                click(page.locator("//*[@data-testid='text-option-excel-export']"));
            else if (tipoArquivo.equalsIgnoreCase("CSV"))
                click(page.locator("//a[text()='CSV']"));
        }
    }

    private void selecionarTipoRelatorio(String tipoRelatorio, String abaRelatorio) {
        if(
            abaRelatorio.equalsIgnoreCase("Histórico de vendas")
            || abaRelatorio.equalsIgnoreCase("Pagos_Meus Domicílios")
            || abaRelatorio.equalsIgnoreCase("Pagos_Valores Cedidos")
            || abaRelatorio.equalsIgnoreCase("Relatório de antecipações")
        )
            if (tipoRelatorio.equalsIgnoreCase("simplificado"))
                this.relatorioSimplificado.check();
            else if (tipoRelatorio.equalsIgnoreCase("detalhado"))
                this.relatorioDetalhado.check();
    }

    public void validarNomeArquivo(String tipoArquivo, String tipoRelatorio, String abaRelatorio) {
        // realiza o exportar
        click(this.getLocatorFromReportTab(abaRelatorio, "btnExportar"));
        waitIsVisibleForSeconds(this.titleExportar, Config.WAIT_5_SECONDS);
        this.selecionarTipoArquivo(tipoArquivo, abaRelatorio);

        this.selecionarTipoRelatorio(tipoRelatorio, abaRelatorio);

        // Aguarda download ao clicar no botão Exportar
        Download download = page.waitForDownload(() -> click(this.btnGerarArquivo));

        boolean validacao = GeracaoArquivos.validarNomeTipoArquivo(abaRelatorio, tipoArquivo, tipoRelatorio, download);
        Assert.assertTrue(validacao);
    }

    public void validarCabecalhoArquivo(@NotNull String colunas, String tipoArquivo, String tipoRelatorio, String abaRelatorio) throws IOException {
        // Cria a lista de colunas do arquivo
        List<String> listaColunas = List.of(colunas.split(";"));

        // realiza o exportar
        click(this.getLocatorFromReportTab(abaRelatorio, "btnExportar"));
        waitIsVisibleForSeconds(this.titleExportar, Config.WAIT_5_SECONDS);
        this.selecionarTipoArquivo(tipoArquivo, abaRelatorio);

        this.selecionarTipoRelatorio(tipoRelatorio, abaRelatorio);

        // Aguarda download ao clicar no botão Exportar
        Download download = page.waitForDownload(() -> this.btnGerarArquivo.click());

        String extensao = GeracaoArquivos.getExtensao(tipoArquivo);
        Path arquivoBaixado = download.path();
        File copiaArquivoBaixado = GeracaoArquivos.copiarArquivoAtribuirExtensao(arquivoBaixado.toFile(), extensao);

        boolean validacao = GeracaoArquivos.validarCabecalhoTipoArquivo(abaRelatorio, tipoRelatorio, copiaArquivoBaixado, listaColunas);
        Assert.assertTrue(validacao);
    }
}