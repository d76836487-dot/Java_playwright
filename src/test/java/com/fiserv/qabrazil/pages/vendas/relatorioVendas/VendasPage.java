package com.fiserv.qabrazil.pages.vendas.relatorioVendas;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class VendasPage {
    @Autowired
    private Page page;

    // Botões abas do relatório
    private Locator abaHoje;
    private Locator abaHistoricoVendas;
    private Locator abaNaoEfetivadas;
    private Locator abaPreAutorizacoes;
    private Locator abaVoucher;

    // Títulos das abas do relatório
    private Locator titleHoje;
    private Locator titleHistoricoVendas;
    private Locator titleNaoEfetivadas;
    private Locator titlePreAutorizacoes;
    private Locator titleVocher;

    // Período
    private Locator iconeCalendario;
    private Locator ckbHoje;
    private Locator ckbOntem;
    private Locator ckbUltimos7Dias;
    private Locator ckbUltimos14Dias;
    private Locator cbkMesAtual;
    private Locator cbkEsteMes;
    private Locator btnAplicarPeriodo;

    // Filtros
    private Locator titleFiltros;
    private Locator iconeSairFiltros;
    private Locator linkLimparFiltros;
    private Locator btnMostrarResultados;

    // Status
    private Locator linkStatus;
    private Locator ckbStatusSelecionarTudo;
    private Locator linkStatusLimparSelecoes;

    // Produto
    private Locator linkProduto;
    private Locator ckbProdutoSelecionarTudo;
    private Locator linkProdutoLimparSelecoes;

    // Canal
    private Locator linkCanal;
    private Locator ckbCanalSelecionarTudo;
    private Locator linkCanalLimparSelecoes;

    // Bandeira
    private Locator linkBandeira;
    private Locator ckbBandeiraSelecionarTudo;
    private Locator linkBandeiraLimparSelecoes;

    // Valores
    private Locator linkValores;
    private Locator txtValoresDe;
    private Locator txtValoresAte;

    // Estabelecimento
    private Locator linkEstabelecimento;
    private Locator ckbEstabelecimentoSelecionarTudo;
    private Locator ckbEstabelecimentoLimparSelecoes;

    // Terminal
    private Locator linkTerminal;
    private Locator cbkTerminalSelecionarTudo;
    private Locator linkTerminalLimparSelecoes;

    // Personalizar Colunas
    private Locator titlePersonalizarColunas;
    private Locator linkVoltarPadrao;
    private Locator btnAplicarPersonalizacao;

    // Gerar arquivo
    private Locator titleExportar;
    private Locator slcTipoArquivo;
    private Locator optExcel;
    private Locator optCSV;
    private Locator optPDF;
    private Locator btnCancelar;
    private Locator btnGerarArquivo;

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

    @PostConstruct
    private void loadLocators() {
        // Botões abas do relatório
        this.abaHoje = page.locator("//*[@id='Hoje']/button");
        this.abaHistoricoVendas = page.locator("//*[@id='HistoricoVendas']/button");
        this.abaNaoEfetivadas = page.locator("//*[@id='NaoEfetivadas']/button");
        this.abaPreAutorizacoes = page.locator("//*[@id='PreAutorizacoes']/button");
        this.abaVoucher = page.locator("//*[@id='Voucher']/button");

        // Títulos das abas do relatório
        this.titleHoje = page.locator("//*[contains(text(), 'Visualize suas vendas realizadas no dia')]");
        this.titleHistoricoVendas = page.locator("//*[contains(text(), 'Visualize o histórico de todas as vendas')]");
        this.titleNaoEfetivadas = page.locator("//*[contains(text(), 'Visualize o histórico de suas vendas não efetivadas')]");
        this.titlePreAutorizacoes = page.locator("//*[contains(text(), 'Visualize as vendas do dia realizadas na modalidade de Pré-autorização')]");
        this.titleVocher = page.locator("//*[contains(text(), 'Visualize o histórico das vendas realizadas via voucher')]");

        // Período
        this.iconeCalendario = page.locator("//*[@data-testid='calendar-trigger-icon']");
        this.ckbHoje = page.locator("//*[@data-testid='generic-calendar-pill-hoje']");
        this.ckbOntem = page.locator("//*[@data-testid='generic-calendar-pill-ontem']");
        this.ckbUltimos7Dias = page.locator("//*[@data-testid='generic-calendar-pill-últimos-7-dias']");
        this.ckbUltimos14Dias = page.locator("//*[@data-testid='generic-calendar-pill-últimos-14-dias']");
        this.cbkMesAtual = page.locator("//*[@data-testid='generic-calendar-pill-mês-atual']");
        this.cbkEsteMes = page.locator("//*[@data-testid='generic-calendar-pill-este-mês']");
        this.btnAplicarPeriodo = page.locator("//*[@data-testid='generic-calendar-button-aplicar']");

        // Filtros
        this.titleFiltros = page.locator("//*[text()='Os itens selecionados serão aplicados na pesquisa.']");
        this.iconeSairFiltros = page.locator("//*[@data-testid='generic-filter-link-sair']");
        this.linkLimparFiltros = page.locator("//*[@data-testid='generic-filter-link-clean-all']");
        this.btnMostrarResultados = page.locator("//*[@data-testid='generic-filter-btn-resultados']");

        // Status
        this.linkStatus = page.locator("//*[@data-testid='generic-filter-accordion-title-status']");
        this.ckbStatusSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-status']");
        this.linkStatusLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-status']");

        // Produtos
        this.linkProduto = page.locator("//*[@data-testid='generic-filter-accordion-title-produtos']");
        this.ckbProdutoSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-produtos']");
        this.linkProdutoLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-produtos']");

        // Canal
        this.linkCanal = page.locator("//*[@data-testid='generic-filter-accordion-title-canal']");
        this.ckbCanalSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-canais']");
        this.linkCanalLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-canais']");

        // Bandeira
        this.linkBandeira = page.locator("//*[@data-testid='generic-filter-accordion-title-bandeira']");
        this.ckbBandeiraSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-bandeiras']");
        this.linkBandeiraLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-bandeiras']");

        // Valores
        this.linkValores = page.locator("//*[@data-testid='generic-filter-accordion-title-valores']");
        this.txtValoresDe = page.locator("//*[@data-testid='generic-filter-input-valor-de']");
        this.txtValoresAte = page.locator("//*[@data-testid='generic-filter-input-valor-ate']");

        // Estabelecimento
        this.linkEstabelecimento = page.locator("//*[@data-testid='generic-filter-accordion-title-estabelecimentos']");
        this.ckbEstabelecimentoSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-estabelecimentos']");
        this.ckbEstabelecimentoLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-estabelecimentos']");

        // Terminal
        this.linkTerminal = page.locator("//*[@data-testid='generic-filter-accordion-title-terminais']");
        this.cbkTerminalSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-terminais']");
        this.linkTerminalLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-terminais']");

        // Personalizar Colunas
        this.titlePersonalizarColunas = page.locator("//*[contains(text(), 'Personalize a visualização das colunas')]");
        this.linkVoltarPadrao = page.locator("//*[text()='Voltar ao padrão']");
        this.btnAplicarPersonalizacao = page.locator("//span[text()='Aplicar']");

        // Gerar arquivo
        this.titleExportar = page.locator("//*[text()='Escolha como deseja exportar o relatório']");
        this.slcTipoArquivo = page.locator("//*[@data-testid='simple-dropdown-select--text-label']");
        this.optExcel = page.locator("//*[@data-testid='simple-dropdown-select--item-excel']");
        this.optCSV = page.locator("//*[@data-testid='simple-dropdown-select--item-csv']");
        this.optPDF = page.locator("//*[@data-testid='simple-dropdown-select--item-pdf']");
        this.btnCancelar = page.locator("//*[text()='Cancelar']/..");
        this.btnGerarArquivo = page.locator("//*[contains(text(), 'Gerar arquivo')]");
    }

    // Botões abas do relatório
    private void clickAbaHoje() { this.abaHoje.click(); }
    private void clickAbaHistoricoVendas() { this.abaHistoricoVendas.click(); }
    private void clickAbaNaoEfetivadas() { this.abaNaoEfetivadas.click(); }
    private void clickAbaPreAutorizacoes() { this.abaPreAutorizacoes.click(); }
    private void clickAbaVoucher() { this.abaVoucher.click(); }

    // Títulos das abas do relatório
    public void validarCarregamentoAbaRelatorio(@NotNull String abaRelatorio) {
        if (abaRelatorio.equalsIgnoreCase("Hoje")) {
            GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
            assertThat(titleHoje).isVisible();
        } else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
            this.clickAbaHistoricoVendas();
            GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
            assertThat(titleHistoricoVendas).isVisible();
        } else if (abaRelatorio.equalsIgnoreCase("Não efetivadas")) {
            this.clickAbaNaoEfetivadas();
            GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
            assertThat(titleNaoEfetivadas).isVisible();
        } else if (abaRelatorio.equalsIgnoreCase("Pré-autorizações")) {
            this.clickAbaPreAutorizacoes();
            GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
            assertThat(titlePreAutorizacoes).isVisible();
        } else if (abaRelatorio.equalsIgnoreCase("Voucher")) {
            this.clickAbaVoucher();
            GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
            assertThat(titleVocher).isVisible();
        }
    }

    // Visualiza lista de campos por aba
    public void verificarCampos(String campos, @NotNull String abaRelatorio) {
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
    }

    private Locator getLocatorFromReportTab(@NotNull String abaRelatorio, String campo) {
        Locator element = page.locator("");

        element = switch (abaRelatorio) {
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
                        page.locator("//*[@id='b20-Input_CodigoAutorizacao']");
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
            default -> element;
        };

        return element;
    }

    // Período
    private void clickCalendario() { this.iconeCalendario.click(); }
    private void clickCalendarioHoje() { this.ckbHoje.click(); }
    private void clickCalendarioOntem() { this.ckbOntem.click(); }
    private void clickCalendarioUltimos7Dias() { this.ckbUltimos7Dias.click(); }
    private void clickCalendarioUltimos14Dias() { this.ckbUltimos14Dias.click(); }
    private void clickCalendarioMesAtual() { this.cbkMesAtual.click(); }
    private void clickCalendarioEsteMes() { this.cbkEsteMes.click(); }
    private void clickAplicarPeriodo() { this.btnAplicarPeriodo.click(); }

    public void aplicarPeriodo(@NotNull String periodo) {
        GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
        this.iconeCalendario.scrollIntoViewIfNeeded();
        this.clickCalendario();

        if (periodo.equalsIgnoreCase("Hoje"))
            this.clickCalendarioHoje();
        else if (periodo.equalsIgnoreCase("Ontem"))
            this.clickCalendarioOntem();
        else if (periodo.equalsIgnoreCase("Últimos 7 Dias"))
            this.clickCalendarioUltimos7Dias();
        else if (periodo.equalsIgnoreCase("Últimos 14 Dias"))
            this.clickCalendarioUltimos14Dias();
        else if (periodo.equalsIgnoreCase("Mês Atual"))
            this.clickCalendarioMesAtual();
        else if (periodo.equalsIgnoreCase("Este Mês"))
            this.clickCalendarioEsteMes();
    }

    private boolean verificarDataPeriodo(String dataCompleta, String periodo) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime data = LocalDateTime.parse(dataCompleta, formatter);
        LocalDateTime agora = LocalDateTime.now();

        return switch (periodo) {
            case "Hoje" -> data.toLocalDate().isEqual(agora.toLocalDate());
            case "Ontem" -> data.toLocalDate().isEqual(agora.minusDays(1).toLocalDate());
            case "Últimos 7 Dias" -> !data.isBefore(agora.minusDays(7)) && data.isBefore(agora.plusDays(1));
            case "Últimos 14 Dias" -> !data.isBefore(agora.minusDays(14)) && data.isBefore(agora.plusDays(1));
            case "Este Mês", "Mês Atual" -> data.getYear() == agora.getYear() && data.getMonth() == agora.getMonth();
            default -> false;
        };
    }

    public void validarPeriodoAplicado(String periodo, String abaRelatorio) {
        GeneralUtils.waitForMillis(Config.TIME_TO_WAIT_PAGE);
        boolean flagMes = false;
        boolean flagDiaSemana = false;

        if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
            if (periodo.equalsIgnoreCase("Últimos 7 Dias"))
                flagDiaSemana = true;
            else if (periodo.equalsIgnoreCase("Últimos 14 Dias"))
                flagMes = true;
            else if (periodo.equalsIgnoreCase("Mês Atual"))
                flagDiaSemana = true;
        } else if (abaRelatorio.equalsIgnoreCase("Pré-autorizações")) {
            if (periodo.equalsIgnoreCase("Últimos 7 Dias"))
                flagDiaSemana = true;
            else if (periodo.equalsIgnoreCase("Últimos 14 Dias"))
                flagMes = true;
            else if (periodo.equalsIgnoreCase("Este Mês"))
                flagDiaSemana = true;
        } else if (abaRelatorio.equalsIgnoreCase("Voucher")) {
            if (periodo.equalsIgnoreCase("Ontem"))
                flagMes = true;
            else if (periodo.equalsIgnoreCase("Últimos 7 Dias"))
                flagMes = true;
            else if (periodo.equalsIgnoreCase("Últimos 14 Dias"))
                flagMes = true;
        }

        if (flagMes) {
            Locator expadirRegistroMes = page.locator("(//*[contains(@class, 'osui-accordion-item__icon')])[1]");
            expadirRegistroMes.scrollIntoViewIfNeeded();
            expadirRegistroMes.click();
            GeneralUtils.waitForMillis(Config.DELAY_IN_ACTION);

            Locator expadirRegistroDia = page.locator("(//*[contains(@class, 'osui-accordion-item__icon')])[3]");
            expadirRegistroDia.scrollIntoViewIfNeeded();
            expadirRegistroDia.click();
            GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
        }

        if (flagDiaSemana) {
            Locator expadirRegistroDia = page.locator("(//*[contains(@class, 'osui-accordion-item__icon')])[1]");
            expadirRegistroDia.scrollIntoViewIfNeeded();
            expadirRegistroDia.click();
            GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
        }

        Locator resultadoColunaDataVenda = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataVenda");
        String dataCompleta = "";
        for (int i = 0; i < resultadoColunaDataVenda.count(); i++) {
            resultadoColunaDataVenda.nth(i).scrollIntoViewIfNeeded();
            dataCompleta = resultadoColunaDataVenda.nth(i).textContent().trim().replace(" às ", " ");
            if (this.verificarDataPeriodo(dataCompleta, periodo))
                assertThat(resultadoColunaDataVenda.nth(i)).isVisible();
            else
                assertThat(resultadoColunaDataVenda.nth(i)).not().isVisible();
        }
    }

    // Componentes padrão - Vendas
    private void preencherCodAutorizacao(String abaRelatorio, String codAutorizacao) {
        this.getLocatorFromReportTab(abaRelatorio, "txtCodAutorizacao").fill(codAutorizacao);
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
    private void verificarFiltrosVendasHoje() {
        assertThat(titleFiltros).isVisible();
    }

    public void clickSair() { this.iconeSairFiltros.click(); }
    public void clickLimparFiltros() { this.linkLimparFiltros.click(); }
    public void clickMostrarResultados() { this.btnMostrarResultados.click(); }

    // Status
    public void clickFiltroStatus() { this.linkStatus.click(); }
    public void clickStatusSelecionarTudo() { this.ckbStatusSelecionarTudo.click(); }
    public void clickStatusLimparSelecoes() { this.linkStatusLimparSelecoes.click(); }
    public void clickStatus(@NotNull String valor) {
        String complementoXpath = valor.replace(" ", "-");
        page.locator("//*[@data-testid='generic-filter-check-status-"+complementoXpath+"']").click();
    }

    // Produto
    public void clickFiltroProdutos() { this.linkProduto.click(); }
    public void clickProdutosSelecionarTudo() { this.ckbProdutoSelecionarTudo.click(); }
    public void clickProdutosLimparSelecoes() { this.linkProdutoLimparSelecoes.click(); }
    public void clickProduto(@NotNull String valor) {
        String complementoXpath = valor.replace(" ", "-");
        page.locator("//*[@data-testid='generic-filter-check-produto-"+complementoXpath+"']").click();
    }

    // Canal
    public void clickFiltroCanal() { this.linkCanal.click(); }
    public void clickCanalSelecionarTudo() { this.ckbCanalSelecionarTudo.click(); }
    public void clickCanalLimparSelecoes() { this.linkCanalLimparSelecoes.click(); }
    public void clickCanal(@NotNull String valor) {
        String complementoXpath = valor.replace(" ", "-");
        page.locator("//*[@data-testid='generic-filter-check-canal-"+complementoXpath+"']").click();
    }

    // Bandeira
    public void clickFiltroBandeira() { this.linkBandeira.click(); }
    public void clickBandeiraSelecionarTudo() { this.ckbBandeiraSelecionarTudo.click(); }
    public void clickBandeiraLimparSelecoes() { this.linkBandeiraLimparSelecoes.click(); }
    public void clickBandeira(@NotNull String valor) {
        String complementoXpath = valor.replace(" ", "-");
        page.locator("//*[@data-testid='generic-filter-div-bandeira-"+complementoXpath+"']").click();
    }

    // Valores
    public void clickFiltroValores() { this.linkValores.click(); }
    public void preencherValoresDe(String valoresDe) { this.txtValoresDe.fill(valoresDe); }
    public void preencherValoresAte(String valoresAte) { this.txtValoresAte.fill(valoresAte); }

    // Estabelecimento
    public void clickFiltroEstabelecimento() { this.linkEstabelecimento.click(); }
    public void clickEstabelecimentoSelecionarTudo() { this.ckbEstabelecimentoSelecionarTudo.click(); }
    public void clickEstabelecimentoLimparSelecoes() { this.ckbEstabelecimentoLimparSelecoes.click(); }
    public void clickEstabelecimento(@NotNull String valor) {
        String complementoXpath = valor.replace(" ", "-");
        page.locator("//*[@data-testid='generic-filter-check-estabelecimento-"+complementoXpath+"']").click();
    }

    // Terminal
    public void clickFiltroTerminal() { this.linkTerminal.click(); }
    public void clickTerminalSelecionarTudo() { this.cbkTerminalSelecionarTudo.click(); }
    public void clickTerminalLimparSelecoes() { this.linkTerminalLimparSelecoes.click(); }
    public void clickTerminal(@NotNull String valor) {
        String complementoXpath = valor.replace(" ", "-");
        page.locator("//*[@data-testid='generic-filter-check-terminal-"+complementoXpath+"']").click();
    }

    public void realizarFiltro(@NotNull String filtro, String valor, String abaRelatorio) {
        GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
        this.getLocatorFromReportTab(abaRelatorio, "btnFiltros").scrollIntoViewIfNeeded();

        if (!filtro.equalsIgnoreCase("Cód. de autorização")) {
            this.verificarFiltrosVendasHoje();
            this.clickFiltros(abaRelatorio);
        }

        // realiza o filtro pelo seu tipo (campo) e passa o valor desejado
        switch (filtro) {
            case "Cód. de autorização":
                if (valor.equalsIgnoreCase("primeiroRegistro"))
                    this.preencherCodAutorizacao(
                             abaRelatorio
                            ,this.getLocatorFromReportTab(abaRelatorio, "primeiroRegistroCodAutorizacao").textContent().trim()
                    );
                else
                    this.preencherCodAutorizacao(abaRelatorio, valor);

                break;

            case "Status":
                this.clickFiltroStatus();
                switch (valor) {
                    case "todos":
                        this.clickStatusSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickStatusLimparSelecoes();
                        break;
                    default:
                        this.clickStatus(valor);
                }
                break;

            case "Produto":
                this.clickFiltroProdutos();
                switch (valor) {
                    case "todos":
                        this.clickProdutosSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickProdutosLimparSelecoes();
                        break;
                    default:
                        this.clickProduto(valor);
                }
                break;

            case "Canal":
                this.clickFiltroCanal();
                switch (valor) {
                    case "todos":
                        this.clickCanalSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickCanalLimparSelecoes();
                        break;
                    default:
                        this.clickCanal(valor);
                }
                break;

            case "Bandeira":
                this.clickFiltroBandeira();
                switch (valor) {
                    case "todos":
                        this.clickBandeiraSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickBandeiraLimparSelecoes();
                        break;
                    default:
                        this.clickBandeira(valor);
                }
                break;

            case "Valores":
                this.clickFiltroValores();

                // valor De e Ate separados por ";"
                String[] valores = valor.split(";");
                this.preencherValoresDe(valores[0]);
                this.preencherValoresAte(valores[1]);

                break;

            case "Estabelecimento":
                this.clickFiltroEstabelecimento();
                switch (valor) {
                    case "todos":
                        this.clickEstabelecimentoSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickEstabelecimentoLimparSelecoes();
                        break;
                    default:
                        this.clickEstabelecimento(valor);
                }
                break;

            case "Terminal":
                this.clickFiltroTerminal();
                switch (valor) {
                    case "todos":
                        this.clickTerminalSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickTerminalLimparSelecoes();
                        break;
                    default:
                        this.clickTerminal(valor);
                }
                break;

        }

        if (!filtro.equalsIgnoreCase("Cód. de autorização")) {
            this.btnMostrarResultados.scrollIntoViewIfNeeded();
            this.clickMostrarResultados();
        } else
            this.clickLupa(abaRelatorio);

        GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
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
        GeneralUtils.waitForMillis(Config.DELAY_IN_ACTION);
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
        GeneralUtils.waitForMillis(Config.DELAY_IN_ACTION);
        this.getLocatorFromReportTab(abaRelatorio, "btnPersonalizarColunas").scrollIntoViewIfNeeded();
        // Acessa o Personalizar Colunas
        this.clickPersonalizarColunas(abaRelatorio);
        this.verificarPersonalizarColunas();

        this.linkVoltarPadrao.scrollIntoViewIfNeeded();
        GeneralUtils.waitForMillis(Config.DELAY_IN_ACTION);

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
        this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas").scrollIntoViewIfNeeded();
        GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);

        Locator colunaResultado = page.locator("");
        String[] listaColunas = colunas.split(";");

        for (String coluna : listaColunas) {
            if (coluna.equalsIgnoreCase("Data da venda"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataVenda");
            if (coluna.equalsIgnoreCase("Data alvo"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaDataAlvo");
            else if (coluna.equalsIgnoreCase("Cód. de autorização"))
                colunaResultado = this.getLocatorFromReportTab(abaRelatorio, "resultadoColunaCodAutorizacao");
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

            for (int i = 0; i < colunaResultado.count(); i++)
                assertThat(colunaResultado.nth(i)).isVisible();
        }

        this.voltarPadraoPersonalizarColunas(abaRelatorio);
    }

    // Resultado coluna
    public void validarAtribuicaoFiltro(String valor, @NotNull String filtro, String abaRelatorio) {
        this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas").scrollIntoViewIfNeeded();
        GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);

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

                    GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
                    this.getLocatorFromReportTab(abaRelatorio, "resultadoColunas").scrollIntoViewIfNeeded();
                }

                String[] listaResultadoColunaValor = new String[0];
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

                for (String resultadoColunaValor : listaResultadoColunaValor) {

                    Locator resultadoColunaValorAbaRelatorio = this.getLocatorFromReportTab(abaRelatorio, resultadoColunaValor);
                    for (int i = 0; i < resultadoColunaValorAbaRelatorio.count(); i++) {
                        String valorColuna = resultadoColunaValorAbaRelatorio.nth(i).textContent()
                                .trim()
                                .replace(".", "")
                                .replace(",", ".")
                                .replace("R$ ", "");
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
                    String colunaRemover = "Status", colunaAdicionar = "";
                if (abaRelatorio.equalsIgnoreCase("Pré-autorizações"))
                    colunaAdicionar = "Estabelecimento comercial";
                else if (abaRelatorio.equalsIgnoreCase("Voucher"))
                    colunaAdicionar = "Número do estabelecimento";
                else
                    colunaAdicionar = "Estabelecimento";

                this.realizarTrocaPersonalizarColunas(colunaRemover, colunaAdicionar);

                GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
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
        else if (tipoArquivo.equalsIgnoreCase("PDF"))
            this.optPDF.click();
    }

    private void clickCancelar() { this.btnCancelar.click(); }

    private String atribuirPrefixoNomeArquivo(String abaRelatorio) {
        return switch (abaRelatorio) {
            case "Hoje" -> "Relatorio_de_Vendas_Hoje_";
            case "Histórico de vendas" -> "Relatorio_de_Vendas_Historico_de_Vendas_";
            case "Não efetivadas" -> "Relatorio_de_Vendas_Nao_Efetivadas_";
            case "Pré-autorizações" -> "Relatorio_de_Vendas_Pre_Autorizadas_";
            case "Voucher" -> "Relatorio_de_Vendas_Voucher_";
            default -> "";
        };
    }

    public void validarNomeArquivo(String tipoArquivo, String tipoRelatorio, String abaRelatorio) {
        // realiza o exportar
        this.getLocatorFromReportTab(abaRelatorio, "btnExportar").scrollIntoViewIfNeeded();
        this.clickExportar(abaRelatorio);
        this.verificarExportar();
        this.selecionarTipoArquivo(tipoArquivo);

        if(abaRelatorio.equalsIgnoreCase("Histórico de vendas"))
            historicoVendasPage.selecionarTipoRelatorio(tipoRelatorio);

        // Aguarda download ao clicar no botão Exportar
        Download download = page.waitForDownload(() -> {
            this.btnGerarArquivo.click();
        });

        String nomeArquivo = this.atribuirPrefixoNomeArquivo(abaRelatorio);

        if (GeracaoArquivos.validarNomeTipoArquivo(tipoArquivo, nomeArquivo, download)) {
            GeneralUtils.waitForMillis(Config.TIME_TO_WAIT_PAGE);
            GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
            assertThat(this.getLocatorFromReportTab(abaRelatorio, "btnExportar")).isVisible();
        } else
            assertThat(this.getLocatorFromReportTab(abaRelatorio, "btnExportar")).not().isVisible();
    }

    private int atribuirLinhaInicioExcel(String tipoRelatorio, String abaRelatorio) {
        return switch (abaRelatorio) {
            case "Hoje" -> 16;
            case "Histórico de vendas" -> switch (tipoRelatorio) {
                case "simplificado" -> 14;
                case "detalhado" -> 4;
                default -> 0;
            };
            case "Não efetivadas" -> 11;
            case "Pré-autorizações" -> 12;
            case "Voucher" -> 13;
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

        // Aguarda download ao clicar no botão Exportar
        Download download = page.waitForDownload(() -> {
            this.btnGerarArquivo.click();
        });

        String extensao = GeracaoArquivos.getExtensao(tipoArquivo);
        Path arquivoBaixado = download.path();
        File copiaArquivoBaixado = GeracaoArquivos.copiarArquivoAtribuirExtensao(arquivoBaixado.toFile(), extensao);
        int linhaInicioExcel = this.atribuirLinhaInicioExcel(tipoRelatorio, abaRelatorio);

        if (GeracaoArquivos.validarColunasTipoArquivo(copiaArquivoBaixado, linhaInicioExcel, listaColunas)) {
            GeneralUtils.waitForMillis(Config.TIME_TO_WAIT_PAGE);
            GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
            assertThat(this.getLocatorFromReportTab(abaRelatorio, "btnExportar")).isVisible();
        } else
            assertThat(this.getLocatorFromReportTab(abaRelatorio, "btnExportar")).not().isVisible();
    }
}