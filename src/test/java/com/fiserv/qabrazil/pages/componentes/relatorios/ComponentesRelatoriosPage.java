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
public class ComponentesRelatoriosPage {
    @Autowired
    private Page page;

    // Botões abas de Vendas
    private Locator abaHistoricoVendas;
    private Locator abaNaoEfetivadas;
    private Locator abaPreAutorizacoes;
    private Locator abaVoucher;

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

    // Títulos das abas de Vendas
    private Locator titleHoje;
    private Locator titleHistoricoVendas;
    private Locator titleNaoEfetivadas;
    private Locator titlePreAutorizacoes;
    private Locator titleVocher;

    // Títulos das abas de Recebimentos
    private Locator titlePagos;
    private Locator titleMeusDomicilios;
    private Locator titleValoresCedidos;
    private Locator titleFuturos;
    private Locator titleDebitosAjustes;

    // Títulos das abas de Antecipação
    private Locator titleSolicitarAntecipacao;
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

    // Gerar arquivo
    private Locator titleExportar;
    private Locator slcTipoArquivo;
    private Locator optExcel;
    private Locator optCSV;
    private Locator relatorioSimplificado;
    private Locator relatorioDetalhado;
    private Locator btnGerarArquivo;

    // Vendas
    @Autowired
    HojePage hojePage;
    @Autowired
    HistoricoVendasPage historicoVendasPage;
    @Autowired
    NaoEfetivadasPage naoEfetivadasPage;
    @Autowired
    PreAutorizacoesPage preAutorizacoesPage;
    @Autowired
    VoucherPage voucherPage;

    // Recebimentos
    @Autowired
    PagosPage pagosPage;
    @Autowired
    FuturosPage futurosPage;
    @Autowired
    DebitosAjustesPage debitosAjustesPage;

    // Antecipação
    @Autowired
    RelatorioAntecipacoesPage relatorioAntecipacoesPage;

    @PostConstruct
    private void loadLocators() {
        // Botões abas de Vendas
        this.abaHistoricoVendas = page.locator("//*[@id='HistoricoVendas']/button");
        this.abaNaoEfetivadas = page.locator("//*[@id='NaoEfetivadas']/button");
        this.abaPreAutorizacoes = page.locator("//*[@id='PreAutorizacoes']/button");
        this.abaVoucher = page.locator("//*[@id='Voucher']/button");

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

        // Títulos das abas de Vendas
        this.titleHoje = page.locator("//*[contains(text(), 'Visualize suas vendas realizadas no dia')]");
        this.titleHistoricoVendas = page.locator("//*[contains(text(), 'Visualize o histórico de todas as vendas')]");
        this.titleNaoEfetivadas = page.locator("//*[contains(text(), 'Visualize o histórico de suas vendas não efetivadas')]");
        this.titlePreAutorizacoes = page.locator("//*[contains(text(), 'Visualize as vendas do dia realizadas na modalidade de Pré-autorização')]");
        this.titleVocher = page.locator("//*[contains(text(), 'Visualize o histórico das vendas realizadas via voucher')]");

        // Títulos das abas de Recebimentos
        this.titlePagos = page.locator("//*[contains(text(), 'Consulte os seus recebimentos pagos')]");
        this.titleMeusDomicilios = page.locator("//*[contains(text(), 'domicílios bancários')]");
        this.titleValoresCedidos = page.locator("//*[contains(text(), 'contrato de cessão')]");
        this.titleFuturos = page.locator("//*[contains(text(), 'Consulte o saldo futuro de suas vendas a receber')]");
        this.titleDebitosAjustes = page.locator("//*[contains(text(), 'Filtre por tipo de ajuste e consulte as informações')]");

        // Títulos das abas de Antecipação
        this.titleSolicitarAntecipacao = page.locator("//*[contains(text(), 'para antecipação')]");
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

        // Gerar arquivo
        this.titleExportar = page.locator("//*[text()='Escolha como deseja exportar o relatório']");
        this.slcTipoArquivo = page.locator("//*[@data-testid='simple-dropdown-select--text-label']");
        this.optExcel = page.locator("//*[@data-testid='simple-dropdown-select--item-excel']");
        this.optCSV = page.locator("//*[@data-testid='simple-dropdown-select--item-csv']");
        this.relatorioSimplificado = page.locator("//*[contains(@id, '-RadioButton_Simplificado-input')]");
        this.relatorioDetalhado = page.locator("//*[contains(@id, '-RadioButton_Detalhado-input')]");
        this.btnGerarArquivo = page.locator("//*[contains(text(), 'Gerar arquivo')]");
    }

    // Botões abas de Vendas
    private void clickAbaHistoricoVendas() { this.abaHistoricoVendas.click(); }
    private void clickAbaNaoEfetivadas() { this.abaNaoEfetivadas.click(); }
    private void clickAbaPreAutorizacoes() { this.abaPreAutorizacoes.click(); }
    private void clickAbaVoucher() { this.abaVoucher.click(); }

    // Botões abas de Recebimentos
    private void clickAbaPagos() { this.abaPagos.click(); }
    private void clickSubAbaMeusDomicilios() { this.subAbaMeusDomicilios.click(); }
    private void clickSubAbaValoresCedidos() { this.subAbaValoresCedidos.click(); }
    private void clickAbaFuturos() { this.abaFuturos.click(); }
    private void clickAbaDebitosAjustes() { this.abaDebitosAjustes.click(); }

    // Botões abas de Antecipação
    private void clickAbaSolicitarAntecipacao() { this.abaSolicitarAntecipacao.click(); }
    private void clickAbaHistorico() { this.abaHistorico.click(); }
    private void clickAbaRelatorioAntecipacoes() { this.abaRelatorioAntecipacoes.click(); }

    // Valida os títulos das abas
    public void validarCarregamentoAbaRelatorio(@NotNull String abaRelatorio) {
        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje"))
            GeneralUtils.waitIsVisibleForSeconds(titleHoje, Config.WAIT_LEVEL_3);
        else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
            this.clickAbaHistoricoVendas();
            GeneralUtils.waitIsVisibleForSeconds(titleHistoricoVendas, Config.WAIT_LEVEL_3);
        } else if (abaRelatorio.equalsIgnoreCase("Não efetivadas")) {
            this.clickAbaNaoEfetivadas();
            GeneralUtils.waitIsVisibleForSeconds(titleNaoEfetivadas, Config.WAIT_LEVEL_3);
        } else if (abaRelatorio.equalsIgnoreCase("Pré-autorizações")) {
            this.clickAbaPreAutorizacoes();
            GeneralUtils.waitIsVisibleForSeconds(titlePreAutorizacoes, Config.WAIT_LEVEL_3);
        } else if (abaRelatorio.equalsIgnoreCase("Voucher")) {
            this.clickAbaVoucher();
            GeneralUtils.waitIsVisibleForSeconds(titleVocher, Config.WAIT_LEVEL_3);
        }

        // Recebimentos
        else if (
            abaRelatorio.equalsIgnoreCase("Pagos")
            || abaRelatorio.equalsIgnoreCase("Pagos_Meus Domicílios")
            || abaRelatorio.equalsIgnoreCase("Pagos_Valores Cedidos")
        ) {
            this.clickAbaPagos();
            GeneralUtils.waitIsVisibleForSeconds(titlePagos, Config.WAIT_LEVEL_3);

            if (abaRelatorio.equalsIgnoreCase("Pagos_Meus Domicílios")) {
                subAbaMeusDomicilios.scrollIntoViewIfNeeded();
                this.clickSubAbaMeusDomicilios();
                GeneralUtils.waitIsVisibleForSeconds(titleMeusDomicilios, Config.WAIT_LEVEL_3);
                this.titleMeusDomicilios.scrollIntoViewIfNeeded();
            } else if (abaRelatorio.equalsIgnoreCase("Pagos_Valores Cedidos")) {
                subAbaValoresCedidos.scrollIntoViewIfNeeded();
                this.clickSubAbaValoresCedidos();
                GeneralUtils.waitIsVisibleForSeconds(titleValoresCedidos, Config.WAIT_LEVEL_3);
                this.titleValoresCedidos.scrollIntoViewIfNeeded();
            }
        } else if (abaRelatorio.equalsIgnoreCase("Futuros")) {
            this.clickAbaFuturos();
            GeneralUtils.waitIsVisibleForSeconds(titleFuturos, Config.WAIT_LEVEL_3);
        } else if (abaRelatorio.equalsIgnoreCase("Débitos e ajustes")) {
            this.clickAbaDebitosAjustes();
            GeneralUtils.waitIsVisibleForSeconds(titleDebitosAjustes, Config.WAIT_LEVEL_3);
        }

        // Antecipação
        else if (abaRelatorio.equalsIgnoreCase("Solicitar antecipação")) {
            this.clickAbaSolicitarAntecipacao();
            GeneralUtils.waitIsVisibleForSeconds(titleSolicitarAntecipacao, Config.WAIT_LEVEL_3);
        } else if (abaRelatorio.equalsIgnoreCase("Histórico")) {
            this.clickAbaHistorico();
            GeneralUtils.waitIsVisibleForSeconds(titleHistorico, Config.WAIT_LEVEL_3);
        } else if (abaRelatorio.equalsIgnoreCase("Relatório de antecipações")) {
            this.clickAbaRelatorioAntecipacoes();
            GeneralUtils.waitIsVisibleForSeconds(titleRelatorioAntecipacoes, Config.WAIT_LEVEL_3);
        }
    }

    // Visualiza lista de campos por aba
    public void verificarCampos(String campos, @NotNull String abaRelatorio) {
        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje"))
            hojePage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas"))
            historicoVendasPage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Não efetivadas"))
            naoEfetivadasPage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Pré-autorizações"))
            preAutorizacoesPage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Voucher"))
            voucherPage.verificarCampos(campos);

        // Recebimentos
        else if (abaRelatorio.equalsIgnoreCase("Pagos"))
            pagosPage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Futuros"))
            futurosPage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Débitos e ajustes"))
            debitosAjustesPage.verificarCampos(campos);

        // Antecipação
        /*
        else if (abaRelatorio.equalsIgnoreCase("Solicitar antecipação"))
            .verificarCampos(campos);
         else if (abaRelatorio.equalsIgnoreCase("Histórico"))
            .verificarCampos(campos);
         */
        else if (abaRelatorio.equalsIgnoreCase("Relatório de antecipações"))
            relatorioAntecipacoesPage.verificarCampos(campos);
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

            case "Não efetivadas" -> switch (campo) {
                case "txtCodAutorizacao" ->
                    page.locator("//*[@data-testid='nao-efetivadas-campo-busca']");
                case "iconeLupa" ->
                    page.locator("//i[contains(@class, 'nao_efetivadas_buscar_cod_autorizacao')]/..");
                case "btnFiltros" ->
                    page.locator("//*[@data-testid='nao-efetivadas-botao-filtros']");
                case "btnPersonalizarColunas" ->
                    page.locator("//*[@data-testid='nao-efetivadas-botao-personalizar-colunas']");
                case "btnExportar" ->
                    page.locator("//*[@data-testid='exportar-naoefetivadas']");
                case "resultadoColunas" ->
                    page.locator("//*[@data-block='VendasNaoEvetivadas.NaoEfetivadasVendas']");
                case "primeiroRegistroCodAutorizacao" ->
                    page.locator("(//*[contains(@data-testid, 'nao-efetivadas-codautorizacao-') and normalize-space(text()) != ''])[1]");
                case "resultadoColunaDataVenda" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-datavenda-')]");
                case "resultadoColunaCodAutorizacao" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-codautorizacao-')]");
                case "resultadoColunaComprovanteVenda" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-comprovante-')]");
                case "resultadoColunaProduto" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-tipoautorizacao-')]");
                case "resultadoColunaParcelas" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-parcelado-')]");
                case "resultadoColunaBandeira" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-bandeira-')]");
                case "resultadoColunaCanal" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-canal-')]");
                case "resultadoColunaTerminal" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-terminal-')]");
                case "resultadoColunaValorBruto" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-valorbruto-')]");
                case "resultadoColunaStatus" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-status-')]");
                case "resultadoColunaEsbalecimento" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-estabelecimento-')]");
                case "resultadoColunaFinalCartao" ->
                    page.locator("//*[contains(@data-testid, 'nao-efetivadas-finalcartao-')]");
                default -> element;
            };

            case "Pré-autorizações" -> switch (campo) {
                case "txtCodAutorizacao" ->
                    page.locator("//*[contains(@id, '-Input_CodigoAutorizacao')]");
                case "iconeLupa" ->
                    page.locator("//i[contains(@class, 'vendas_hoje_buscar_cod_autorizacao')]/..");
                case "btnFiltros" ->
                    page.locator("//div[text()='Filtros']");
                case "btnPersonalizarColunas" ->
                    page.locator("//div[text()='Personalizar colunas']");
                case "btnExportar" ->
                    page.locator("//*[@data-testid='exportar-preautorizacoes']");
                case "resultadoColunas" ->
                    page.locator("//*[@data-block='VendasPreAutorizacoes.PreAutorizacoesVendas']");
                case "primeiroRegistroCodAutorizacao" ->
                    page.locator("(//*[contains(@data-testid, 'vendas-preautorizacoes-codautorizacao-') and normalize-space(text()) != ''])[1]");
                case "resultadoColunaDataVenda" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-datavenda-')]");
                case "resultadoColunaDataAlvo" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-dataalvo-')]");
                case "resultadoColunaCodAutorizacao" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-codautorizacao-')]");
                case "resultadoColunaProduto" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-produto-')]");
                case "resultadoColunaBandeira" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-bandeira-')]");
                case "resultadoColunaCanal" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-canal-')]");
                case "resultadoColunaValorAutorizado" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-valoraurotizado-')]");
                case "resultadoColunaValorConfirmado" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-valorconfirmado-')]");
                case "resultadoColunaStatus" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-status-')]");
                case "resultadoColunaComprovanteVenda" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-comprovante-')]");
                case "resultadoColunaTerminal" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-terminal-')]");
                case "resultadoColunaEsbalecimento" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-estabelecimento-')]");
                case "resultadoColunaFinalCartao" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-finalcartao-')]");
                case "resultadoColunaCodReferenciaCartao" ->
                    page.locator("//*[contains(@data-testid, 'vendas-preautorizacoes-refcartao-')]");
                default -> element;
            };

            case "Voucher" -> switch (campo) {
                case "txtCodAutorizacao" ->
                    page.locator("//*[@data-testid='busca-cod-autorizacao']");
                case "iconeLupa" ->
                    page.locator("//i[contains(@class, 'vendas_voucher_buscar_cod_autorizacao')]/..");
                case "btnFiltros" ->
                    page.locator("//*[@data-testid='filtros']");
                case "btnPersonalizarColunas" ->
                    page.locator("//*[@data-testid='personalizar-colunas']");
                case "btnExportar" ->
                    page.locator("//*[@data-testid='exportar-voucher']");
                case "resultadoColunas" ->
                    page.locator("//*[@data-block='VendasVoucher.VoucherVendas']");
                case "primeiroRegistroCodAutorizacao" ->
                    page.locator("(//*[contains(@data-testid, 'vendas-voucher-codautorizacao-') and not(text()='-')])[1]");
                case "resultadoColunaDataVenda" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-datavenda-')]");
                case "resultadoColunaCodAutorizacao" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-codautorizacao-')]");
                case "resultadoColunaComprovanteVenda" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-comprovante-')]");
                case "resultadoColunaProduto" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-produto-')]");
                case "resultadoColunaParcelas" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-parcelado-')]");
                case "resultadoColunaBandeira" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-bandeira-')]");
                case "resultadoColunaCanal" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-canal-')]");
                case "resultadoColunaTerminal" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-terminal-')]");
                case "resultadoColunaValorBruto" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-valorbruto-')]");
                case "resultadoColunaStatus" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-status-')]");
                case "resultadoColunaEsbalecimento" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-estabelecimento-')]");
                case "resultadoColunaFinalCartao" ->
                    page.locator("//*[contains(@data-testid, 'vendas-voucher-finalcartao-')]");
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
            /*
            case "Solicitar antecipação" -> switch (campo) {
                case "" ->
                    page.locator("");
                default -> element;
            };

            case "Histórico" -> switch (campo) {
                case "" ->
                    page.locator("");
                default -> element;
            };
            */
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
    private void clickCalendario() { this.iconeCalendario.click(); }

    private String obterNomeAbreviadoMes(LocalDate dataSelecionada) {
        TextStyle txtShort = TextStyle.SHORT;
        Locale localePtBr = new Locale("pt", "BR");

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
            prevNextMonth.click();

        // seleciona o mês
        page.locator("//*[text()='"+mesPeriodo+"']").click();
        // clica no botão Aplicar
        page.locator("//*[@data-testid='button-apply-filter-month']").click();
    }

    public void aplicarPeriodo(@NotNull String periodo, String abaRelatorio) {
        GeneralUtils.waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_LEVEL_3
        );
        this.iconeCalendario.scrollIntoViewIfNeeded();
        this.clickCalendario();

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
            cbkPeriodo.click();
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
            assertThat(semExpandir).isVisible();
        else if (diaSemana.isVisible() || calendario.isVisible()) { // Expandir: dia da semana
            GeneralUtils.waitForSeconds(Config.WAIT_LEVEL_2);

            expandir1.scrollIntoViewIfNeeded();
            expandir1.click();

            GeneralUtils.waitForSeconds(Config.WAIT_LEVEL_2);
        } else if (expandir1.isVisible() || expandir2.isVisible()) { // Expandir: Mês e dia da semana
            GeneralUtils.waitForSeconds(Config.WAIT_LEVEL_2);

            expandir1.scrollIntoViewIfNeeded();
            expandir1.click();

            GeneralUtils.waitForSeconds(Config.WAIT_LEVEL_2);

            expandir2.scrollIntoViewIfNeeded();
            expandir2.click();

            GeneralUtils.waitForSeconds(Config.WAIT_LEVEL_2);
        }
    }

    public void validarPeriodoAplicado(String periodo, String abaRelatorio) {
        this.expandirSePrimeiroRegistro();

        Locator resultadoColunaData = page.locator("");
        // Vendas
        if (
            abaRelatorio.equalsIgnoreCase("Hoje")
            || abaRelatorio.equalsIgnoreCase("Histórico de vendas")
            || abaRelatorio.equalsIgnoreCase("Não efetivadas")
            || abaRelatorio.equalsIgnoreCase("Pré-autorizações")
            || abaRelatorio.equalsIgnoreCase("Voucher")
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
            abaRelatorio.equalsIgnoreCase("Relatório de antecipações")
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

    // Componentes padrão - Vendas
    private void preencherCampoPesquisa(String abaRelatorio, String campo, String valor) {
        this.getLocatorFromReportTab(abaRelatorio, campo).fill(valor);
    }
    private void clickLupa(String abaRelatorio) {
        this.getLocatorFromReportTab(abaRelatorio, "iconeLupa").click();
    }
    private void clickFiltros(String abaRelatorio) {
        this.getLocatorFromReportTab(abaRelatorio, "btnFiltros").click();
    }
    private void clickPersonalizarColunas(String abaRelatorio) {
        this.getLocatorFromReportTab(abaRelatorio, "btnPersonalizarColunas").click();
    }
    private void clickExportar(String abaRelatorio) {
        this.getLocatorFromReportTab(abaRelatorio, "btnExportar").click();
    }

    // Filtros
    private void verificarFiltros() {
        assertThat(titleFiltros).isVisible();
    }

    private void clickMostrarResultados() { this.btnMostrarResultados.click(); }

    // Valores
    private void clickFiltroValores() { this.linkValores.click(); }
    private void preencherValoresDe(String valoresDe) { this.txtValoresDe.fill(valoresDe); }
    private void preencherValoresAte(String valoresAte) { this.txtValoresAte.fill(valoresAte); }

    private void clickItemFiltro(String filtro, String valor, String funcao) {
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
    }

    public void realizarFiltro(@NotNull String filtro, String valor, String abaRelatorio) {
        GeneralUtils.waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_LEVEL_3
        );
        this.getLocatorFromReportTab(abaRelatorio, "btnFiltros").scrollIntoViewIfNeeded();

        boolean seBtnFitros =
            !filtro.equalsIgnoreCase("Cód. de autorização")
            && !filtro.equalsIgnoreCase("Cód. de pagamento")
            && !filtro.equalsIgnoreCase("Número da simulação");

        if (seBtnFitros) {
            this.verificarFiltros();
            this.clickFiltros(abaRelatorio);
        }

        this.expandirSePrimeiroRegistro();

        // realiza o filtro pelo seu tipo (campo) e passa o valor desejado
        switch (filtro) {
            case "Cód. de autorização":
                if (valor.equalsIgnoreCase("primeiroRegistro"))
                    this.preencherCampoPesquisa(
                         abaRelatorio
                        ,"txtCodAutorizacao"
                        ,this.getLocatorFromReportTab(abaRelatorio, "primeiroRegistroCodAutorizacao").textContent()
                        .replace("Cód. de autorização", "")
                        .trim()
                    );
                else
                    this.preencherCampoPesquisa(abaRelatorio, "txtCodAutorizacao", valor);

                break;

            case "Cód. de pagamento":
                if (valor.equalsIgnoreCase("primeiroRegistro"))
                    this.preencherCampoPesquisa(
                        abaRelatorio
                        ,"txtCodPagamento"
                        ,this.getLocatorFromReportTab(abaRelatorio, "primeiroRegistroCodPagamento").textContent()
                        .replace("Cód. de pagamento", "")
                        .trim()
                    );
                else
                    this.preencherCampoPesquisa(abaRelatorio, "txtCodPagamento", valor);

                break;

            case "Número da simulação":
                if (valor.equalsIgnoreCase("primeiroRegistro"))
                    this.preencherCampoPesquisa(
                        abaRelatorio
                        ,"txtNumeroSimulacao"
                        ,this.getLocatorFromReportTab(abaRelatorio, "primeiroRegistroNumeroSimulacao").textContent()
                        .replace("Número da simulação", "")
                        .trim()
                    );
                else
                    this.preencherCampoPesquisa(abaRelatorio, "txtNumeroSimulacao", valor);

                break;

            case "Valores":
                this.clickFiltroValores();

                // valor De e Ate separados por ";"
                String[] valores = valor.split(";");
                this.preencherValoresDe(valores[0]);
                this.preencherValoresAte(valores[1]);

                break;

            case "Status", "Produto", "Canal", "Bandeira", "Estabelecimento", "Terminal", "Banco", "Tipos":
                this.clickItemFiltro(filtro, "", "");
                switch (valor) {
                    case "todos":
                        this.clickItemFiltro(filtro, "", "selecionarTudo");
                        break;
                    case "nenhum":
                        this.clickItemFiltro(filtro, "", "limparTudo");
                        break;
                    default:
                        this.clickItemFiltro(filtro, valor, "selecionarItem");
                }

                break;
        }

        if (seBtnFitros) {
            this.btnMostrarResultados.scrollIntoViewIfNeeded();
            this.clickMostrarResultados();
        } else
            this.clickLupa(abaRelatorio);

        GeneralUtils.waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_LEVEL_3
        );
    }

    // Personalizar Colunas
    public void verificarPersonalizarColunas() {
        assertThat(titlePersonalizarColunas).isVisible();
    }

    private void selecionarColunaPersonalizacao(String coluna) {
        page.locator("//*[text()='"+coluna+"']/preceding-sibling::*/input[@type='checkbox']").click();
    }

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
        else if (abaRelatorio.equalsIgnoreCase("Não efetivadas"))
            listaInicialColunas = "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Bandeira;Canal;Terminal;Valor bruto;Status".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Pré-autorizações"))
            listaInicialColunas = "Data da venda;Data alvo;Cód. de autorização;Produto;Bandeira;Canal;Valor autorizado;Valor confirmado;Status;Comprovante de venda".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Voucher"))
            listaInicialColunas = "Data da venda;Cód. de autorização;Comprovante de venda;Produto;Parcelas;Bandeira;Canal;Número do Terminal;Valor bruto;Status".split(";");

        // Recebimentos
        else if (
            abaRelatorio.equalsIgnoreCase("Pagos_Meus Domicílios")
            || abaRelatorio.equalsIgnoreCase("Pagos_Valores Cedidos")
        )
            listaInicialColunas = "Bandeira;Produto;Banco;Tipo;EC;Código de pagamento;Valor de pagamento;Status".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Futuros"))
            listaInicialColunas = "Data da venda;Cód. de autorização;Produto;Parcelas;Bandeira;Valor bruto;Valor bruto da parcela;Valor líquido;Número do Terminal;Canal".split(";");

        // Débitos e ajustes não tem Personalizar colunas

        return listaInicialColunas;
    }

    public void clickVoltarPadrao() { this.linkVoltarPadrao.click(); }
    public void clickAplicarPersonalizacao() { this.btnAplicarPersonalizacao.click(); }

    private void voltarPadraoPersonalizarColunas(String abaRelatorio) {
        this.getLocatorFromReportTab(abaRelatorio, "btnPersonalizarColunas").scrollIntoViewIfNeeded();
        this.clickPersonalizarColunas(abaRelatorio);
        this.verificarPersonalizarColunas();

        this.linkVoltarPadrao.scrollIntoViewIfNeeded();
        this.clickVoltarPadrao();

        GeneralUtils.waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_LEVEL_3
        );
    }

    private void realizarTrocaPersonalizarColunas(String colunaRemover, String colunaAdicionar) {
        // Atribuir foco na coluna escolhida
        this.atribuirFocoColunaPersonalizacao(colunaAdicionar);

        // Remover coluna
        this.selecionarColunaPersonalizacao(colunaRemover);

        // Adicionar coluna
        this.selecionarColunaPersonalizacao(colunaAdicionar);

        this.btnAplicarPersonalizacao.scrollIntoViewIfNeeded();
        this.clickAplicarPersonalizacao();
    }

    public void personalizarColunas(String colunas, String abaRelatorio) {
        GeneralUtils.waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_LEVEL_3
        );
        this.getLocatorFromReportTab(abaRelatorio, "btnPersonalizarColunas").scrollIntoViewIfNeeded();
        // Acessa o Personalizar Colunas
        this.clickPersonalizarColunas(abaRelatorio);
        this.verificarPersonalizarColunas();

        this.linkVoltarPadrao.scrollIntoViewIfNeeded();
        GeneralUtils.waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_LEVEL_3
        );

        // Limpar personalização inicial de colunas
        String[] listaInicialColunas = this.atribuirListaInicialColunas(abaRelatorio);
        for (String coluna1 : listaInicialColunas)
            this.selecionarColunaPersonalizacao(coluna1);

        // Selecionar colunas enviadas por parâmetro
        String[] listaColunas = colunas.split(";");
        for (String coluna2 : listaColunas)
            this.selecionarColunaPersonalizacao(coluna2);

        this.btnAplicarPersonalizacao.scrollIntoViewIfNeeded();
        this.clickAplicarPersonalizacao();
    }

    public void validarPersonalizacaoColunas(@NotNull String colunas, String abaRelatorio) {
        GeneralUtils.waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_LEVEL_3
        );
        this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas").scrollIntoViewIfNeeded();

        Locator colunaResultado = page.locator("");
        String[] listaColunas = colunas.split(";");

        for (String coluna : listaColunas) {
            if (coluna.equalsIgnoreCase("Data da venda"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataVenda");
            else if (coluna.equalsIgnoreCase("Data alvo"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataAlvo");
            else if (coluna.equalsIgnoreCase("Data do ajuste"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataAjuste");
            else if (coluna.equalsIgnoreCase("Data efetiva da cobrança"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataEfetivaCobranca");
            else if (coluna.equalsIgnoreCase("Data da solicitação"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataSolitacao");
            else if (coluna.equalsIgnoreCase("Data do pagamento"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataPagamento");
            else if (coluna.equalsIgnoreCase("Cód. de autorização"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodAutorizacao");
            else if (coluna.equalsIgnoreCase("Cód. de pagamento"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodPagamento");
            else if (coluna.equalsIgnoreCase("Número da simulação"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaNumeroSimulacao");
            else if (coluna.equalsIgnoreCase("Comprovante de venda"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaComprovanteVenda");
            else if (coluna.equalsIgnoreCase("Produto"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaProduto");
            else if (coluna.equalsIgnoreCase("Parcelas")
                    || coluna.equalsIgnoreCase("Parcelado"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaParcelas");
            else if (coluna.equalsIgnoreCase("Bandeira"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaBandeira");
            else if (coluna.equalsIgnoreCase("Canal"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCanal");
            else if (coluna.equalsIgnoreCase("Terminal")
                    || coluna.equalsIgnoreCase("Número do Terminal"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaTerminal");
            else if (coluna.equalsIgnoreCase("Valor bruto"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorBruto");
            else if (coluna.equalsIgnoreCase("Valor líquido"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorLiquido");
            else if (coluna.equalsIgnoreCase("Valor da taxa"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorTaxa");
            else if (coluna.equalsIgnoreCase("Valor original da venda"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorOriginalVenda");
            else if (coluna.equalsIgnoreCase("Valor autorizado"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorAutorizado");
            else if (coluna.equalsIgnoreCase("Valor confirmado"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorConfirmado");
            else if (coluna.equalsIgnoreCase("Valor de pagamento"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorPagamento");
            else if (coluna.equalsIgnoreCase("Valor bruto da parcela"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorBrutoParcela");
            else if (coluna.equalsIgnoreCase("Valor do aluguel"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorAluguel");
            else if (coluna.equalsIgnoreCase("Valor bruto das vendas"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorBrutoVendas");
            else if (coluna.equalsIgnoreCase("Valor desconto MDR"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorDescontoMDR");
            else if (coluna.equalsIgnoreCase("Valor Líquido das vendas"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorLiquidoVendas");
            else if (coluna.equalsIgnoreCase("Valor desconto antecipação"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorDescontoAntecipacao");
            else if (coluna.equalsIgnoreCase("Valor pago"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaValorPago");
            else if (coluna.equalsIgnoreCase("Status"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaStatus");
            else if (coluna.equalsIgnoreCase("Estabelecimento")
                    || coluna.equalsIgnoreCase("Estabelecimento comercial")
                    || coluna.equalsIgnoreCase("Número do estabelecimento"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaEsbalecimento");
            else if (coluna.equalsIgnoreCase("Final do cartão"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaFinalCartao");
            else if (coluna.equalsIgnoreCase("Cód. referência do cartão"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodReferenciaCartao");
            else if (coluna.equalsIgnoreCase("Cód. do pedido"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodPedido");
            else if (coluna.equalsIgnoreCase("Banco"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaBanco");
            else if (coluna.equalsIgnoreCase("Tipo"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaTipo");
            else if (coluna.equalsIgnoreCase("EC"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaEC");
            else if (coluna.equalsIgnoreCase("Código de pagamento"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodPagamento");
            else if (coluna.equalsIgnoreCase("Comprovante"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaComprovante");
            else if (coluna.equalsIgnoreCase("Tecnologia"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaTecnologia");

            for (int i = 0; i < colunaResultado.count(); i++)
                assertThat(colunaResultado.nth(i)).isVisible();
        }

        this.voltarPadraoPersonalizarColunas(abaRelatorio);
    }

    private String[] atribuirResultadoColunaValor(@NotNull String abaRelatorio) {
        String[] listaResultadoColunaValor = new String[0];
        // Vendas
        if (abaRelatorio.equalsIgnoreCase("Hoje"))
            listaResultadoColunaValor = "resultadoColunaValorBruto".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas"))
            listaResultadoColunaValor = "resultadoColunaValorBruto;resultadoColunaValorLiquido;resultadoColunaValorOriginalVenda".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Não efetivadas"))
            listaResultadoColunaValor = "resultadoColunaValorBruto".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Pré-autorizações"))
            listaResultadoColunaValor = "resultadoColunaValorAutorizado;resultadoColunaValorConfirmado".split(";");
        else if (abaRelatorio.equalsIgnoreCase("Voucher"))
            listaResultadoColunaValor = "resultadoColunaValorBruto".split(";");

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
        GeneralUtils.waitIsVisibleForSeconds(
             this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
            ,Config.WAIT_LEVEL_3
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
                    this.clickPersonalizarColunas(abaRelatorio);
                    this.verificarPersonalizarColunas();

                    // Remove o Terminal e adiciona o Valor original da venda aplicando a personalização de colunas
                    String colunaRemover = "Terminal", colunaAdicionar = "Valor original da venda";
                    this.realizarTrocaPersonalizarColunas(colunaRemover, colunaAdicionar);

                    GeneralUtils.waitIsVisibleForSeconds(
                         this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
                        ,Config.WAIT_LEVEL_3
                    );
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas").scrollIntoViewIfNeeded();
                }

                String[] listaResultadoColunaValor = this.atribuirResultadoColunaValor(abaRelatorio);

                for (String resultadoColunaValor : listaResultadoColunaValor) {
                    Locator resultadoColunaValorAbaRelatorio = this.getLocatorFromReportTab(abaRelatorio, resultadoColunaValor);

                    for (int i = 0; i < resultadoColunaValorAbaRelatorio.count(); i++) {
                        String valorColuna = resultadoColunaValorAbaRelatorio.nth(i).textContent()
                                .replace(" ", "")
                                .replace(".", "")
                                .replace(",", ".")
                                .replace("R$", "");
                        double valorColunaReal = Double.parseDouble(valorColuna);

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
                this.clickPersonalizarColunas(abaRelatorio);
                this.verificarPersonalizarColunas();

                // Remove o Status e adiciona o Esbelecimento aplicando a personalização de colunas
                    String colunaRemover = "Status", colunaAdicionar;
                if (abaRelatorio.equalsIgnoreCase("Pré-autorizações"))
                    colunaAdicionar = "Estabelecimento comercial";
                else if (abaRelatorio.equalsIgnoreCase("Voucher"))
                    colunaAdicionar = "Número do estabelecimento";
                else
                    colunaAdicionar = "Estabelecimento";

                this.realizarTrocaPersonalizarColunas(colunaRemover, colunaAdicionar);

                GeneralUtils.waitIsVisibleForSeconds(
                     this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas")
                    ,Config.WAIT_LEVEL_3
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

    // Gerar arquivo
    public void verificarExportar() {
        assertThat(titleExportar).isVisible();
    }

    private void selecionarTipoArquivo(@NotNull String tipoArquivo) {
        this.slcTipoArquivo.hover();

        if (tipoArquivo.equalsIgnoreCase("Excel"))
            this.optExcel.click();
        else if (tipoArquivo.equalsIgnoreCase("CSV"))
            this.optCSV.click();
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

    private String atribuirPrefixoNomeArquivo(String tipoRelatorio, String abaRelatorio) {
        return switch (abaRelatorio) {
            // Vendas
            case "Hoje" -> "Relatorio_de_Vendas_Hoje_";
            case "Histórico de vendas" -> "Relatorio_de_Vendas_Historico_de_Vendas_";
            case "Não efetivadas" -> "Relatorio_de_Vendas_Nao_Efetivadas_";
            case "Pré-autorizações" -> "Relatorio_de_Vendas_Pre_Autorizadas_";
            case "Voucher" -> "Relatorio_de_Vendas_Voucher_";

            // Recebimentos
            case "Pagos_Meus Domicílios" -> switch (tipoRelatorio) {
                case "simplificado" -> "Relatório_de_Recebimentos_Pagos_Meus_Domicilios_";
                case "detalhado" -> "Relatório_Detalhado_de_Recebimentos_Pagos_Meus_Domicilios_";
                default -> "";
            };
            case "Pagos_Valores Cedidos" -> switch (tipoRelatorio) {
                case "simplificado" -> "Relatório_de_Recebimentos_Pagos_Valores_Cedidos_";
                case "detalhado" -> "Relatório_Detalhado_de_Recebimentos_Pagos_Valores_Cedidos_";
                default -> "";
            };
            case "Futuros" -> "Relatorio_de_Recebimentos_Futuros_";
            case "Débitos e ajustes" -> "Relatorio_Aluguel_";

            // Antecipação
            case "Relatório de antecipações" -> switch (tipoRelatorio) {
                case "simplificado" -> "Relatorio_simplificado_Antecipação_";
                case "detalhado" -> "Relatorio_Detalhado_Antecipação_";
                default -> "";
            };

            default -> "";
        };
    }

    public void validarNomeArquivo(String tipoArquivo, String tipoRelatorio, String abaRelatorio) {
        // realiza o exportar
        this.getLocatorFromReportTab(abaRelatorio, "btnExportar").scrollIntoViewIfNeeded();
        this.clickExportar(abaRelatorio);
        this.verificarExportar();
        this.selecionarTipoArquivo(tipoArquivo);

        this.selecionarTipoRelatorio(tipoRelatorio, abaRelatorio);

        // Aguarda download ao clicar no botão Exportar
        Download download = page.waitForDownload(() -> this.btnGerarArquivo.click());

        String nomeArquivo = this.atribuirPrefixoNomeArquivo(tipoRelatorio, abaRelatorio);

        boolean validacao = GeracaoArquivos.validarNomeTipoArquivo(tipoArquivo, nomeArquivo, download);
        Assert.assertTrue(validacao);
    }

    private int atribuirLinhaInicio(String tipoRelatorio, String abaRelatorio) {
        return switch (abaRelatorio) {
            // Vendas, Recebimentos e Antecipação
            case "Hoje" -> 16;
            case "Histórico de vendas" -> switch (tipoRelatorio) {
                case "simplificado" -> 14;
                case "detalhado" -> 4;
                default -> 0;
            };
            case "Não efetivadas", "Débitos e ajustes" -> 11;
            case "Pré-autorizações" -> 12;
            case "Voucher", "Futuros" -> 13;
            case "Pagos_Meus Domicílios", "Pagos_Valores Cedidos" -> switch (tipoRelatorio) {
                case "simplificado" -> 13;
                case "detalhado" -> 4;
                default -> 0;
            };
            case "Relatório de antecipações" -> switch (tipoRelatorio) {
                case "simplificado" -> 11;
                case "detalhado" -> 10;
                default -> 0;
            };

            default -> 0;
        };
    }

    public void validarColunasArquivo(@NotNull String colunas, String tipoArquivo, String tipoRelatorio, String abaRelatorio) throws IOException {
        // Cria a lista de colunas do arquivo
        List<String> listaColunas = List.of(colunas.split(";"));

        // realiza o exportar
        this.getLocatorFromReportTab(abaRelatorio, "btnExportar").scrollIntoViewIfNeeded();
        this.clickExportar(abaRelatorio);
        this.verificarExportar();
        this.selecionarTipoArquivo(tipoArquivo);

        this.selecionarTipoRelatorio(tipoRelatorio, abaRelatorio);

        // Aguarda download ao clicar no botão Exportar
        Download download = page.waitForDownload(() -> this.btnGerarArquivo.click());

        String extensao = GeracaoArquivos.getExtensao(tipoArquivo);
        Path arquivoBaixado = download.path();
        File copiaArquivoBaixado = GeracaoArquivos.copiarArquivoAtribuirExtensao(arquivoBaixado.toFile(), extensao);
        int linhaInicio = this.atribuirLinhaInicio(tipoRelatorio, abaRelatorio);

        boolean validacao = GeracaoArquivos.validarColunasTipoArquivo(copiaArquivoBaixado, linhaInicio, listaColunas);
        Assert.assertTrue(validacao);
    }
}