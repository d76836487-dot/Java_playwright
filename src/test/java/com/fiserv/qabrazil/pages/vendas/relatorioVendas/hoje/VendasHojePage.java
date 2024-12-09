package com.fiserv.qabrazil.pages.vendas.relatorioVendas.hoje;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.WaitUtil;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import jakarta.annotation.PostConstruct;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;
import static org.testng.AssertJUnit.assertFalse;
import static org.testng.AssertJUnit.assertTrue;

@ScenarioComponent
public class VendasHojePage {
    @Autowired
    private Page page;

    // Campos - Total/Valor
    private Locator totalVendas;
    private Locator valorBruto;

    //
    private Locator txtCodAutorizacao;
    private Locator iconeLupa;
    private Locator btnFiltros;
    private Locator btnPersonalizarColunas;
    private Locator btnExportar;

    // Filtros
    private Locator titleFiltros;
    private Locator iconeSair;
    private Locator linkLimparFiltros;
    private Locator btnMostrarResultados;

    // Status
    private Locator linkStatus;
    private Locator ckbStatusSelecionarTudo;
    private Locator linkStatusLimparSelecoes;
    private Locator ckbStatusAutorizada;
    private Locator ckbStatusRecusada;
    private Locator ckbStatusEstornada;

    // Produtos
    private Locator linkProdutos;
    private Locator ckbProdutosSelecionarTudo;
    private Locator linkProdutosLimparSelecoes;
    private Locator ckbProdutosCredito;
    private Locator ckbProdutosCreditoInternacional;
    private Locator ckbProdutosDebito;
    private Locator ckbProdutosDebitoInternacional;
    private Locator ckbProdutosRefeicao;
    private Locator ckbProdutosAlimentacao;
    private Locator ckbProdutosPremium;
    private Locator ckbProdutosCultura;
    private Locator ckbProdutosAuto;
    private Locator ckbProdutosGift;
    private Locator ckbProdutosCorporativo;
    private Locator ckbProdutosBeneficios;
    private Locator ckbProdutosMultiplo;
    private Locator ckbProdutosFlex;
    private Locator ckbProdutosNatal;
    private Locator ckbProdutosMultibeneficios;

    // Canal
    private Locator linkCanal;
    private Locator ckbCanalSelecionarTudo;
    private Locator linkCanalLimparSelecoes;
    private Locator ckbCanalPrimeiraOpcao;

    // Bandeira
    private Locator linkBandeira;
    private Locator ckbBandeiraSelecionarTudo;
    private Locator linkBandeiraLimparSelecoes;
    private Locator linkBandeiraMastercard;
    private Locator linkBandeiraMaestro;
    private Locator linkBandeiraCabal;
    private Locator linkBandeiraElo;
    private Locator linkBandeiraBanese;
    private Locator linkBandeiraTicket;
    private Locator linkBandeiraAlelo;
    private Locator linkBandeiraSorocred;
    private Locator linkBandeiraAmex;
    private Locator linkBandeiraHipercard;
    private Locator linkBandeiraPluxee;
    private Locator linkBandeiraVR;
    private Locator linkBandeiraVisa;
    private Locator linkBandeiraSoftnex;
    private Locator linkBandeiraRedecompras;
    private Locator linkBandeiraFepas;

    // Valores
    private Locator linkValores;
    private Locator txtValoresDe;
    private Locator txtValoresAte;

    // Estabelecimento
    private Locator linkEstabelecimento;
    private Locator ckbEstabelecimentoSelecionarTudo;
    private Locator ckbEstabelecimentoLimparSelecoes;
    private Locator ckbEstabelecimentoPrimeiraOpcao;

    // Terminal
    private Locator linkTerminal;
    private Locator cbkTerminalSelecionarTudo;
    private Locator linkTerminalLimparSelecoes;
    private Locator cbkTerminalPrimeiraOpcao;

    // Personalizar Colunas
    private Locator titlePersonalizarColunas;
    private Locator ckbDataVenda;
    private Locator ckbCodAutorizacao;
    private Locator ckbComprovanteVenda;
    private Locator ckbProduto;
    private Locator ckbParcelas;
    private Locator ckbBandeira;
    private Locator ckbCanal;
    private Locator ckbTerminal;
    private Locator ckbValorBruto;
    private Locator ckbStatus;
    private Locator ckbEstabelecimento;
    private Locator ckbFinalCartao;
    private Locator ckbCodReferenciaCartao;
    private Locator linkVoltarPadrao;
    private Locator btnAplicar;

    // Resultado coluna
    private Locator resultadoColunas;
    private Locator primeiroRegistroCodAutorizacao;
    private Locator resultadoColunaDataVenda;
    private Locator resultadoColunaCodAutorizacao;
    private Locator resultadoColunaComprovanteVenda;
    private Locator resultadoColunaProduto;
    private Locator resultadoColunaParcelas;
    private Locator resultadoColunaBandeira;
    private Locator resultadoColunaCanal;
    private Locator resultadoColunaTerminal;
    private Locator resultadoColunaValor;
    private Locator resultadoColunaStatus;
    private Locator resultadoColunaEsbalecimento;
    private Locator resultadoColunaFinalCartao;
    private Locator resultadoColunaCodReferenciaCartao;

    // Exportar
    private Locator titleExportar;
    private Locator slcTipoArquivo;
    private Locator optExcel;
    private Locator optCSV;
    private Locator btnCancelar;
    private Locator btnGerarArquivo;

    @PostConstruct
    private void loadLocators() {
        // Campos - Total/Valor
        this.totalVendas = page.locator("//*[@data-testid='vendas-hoje-card-total-vendas']");
        this.valorBruto = page.locator("//*[@data-testid='vendas-hoje-card-vlr-bruto']");

        this.txtCodAutorizacao = page.locator("//*[@data-testid='vendas-hoje-input-cod-autorizacao']");
        this.iconeLupa = page.locator("//*[@data-testid='vendas-hoje-link-search-cod-autorizacao']");
        this.btnFiltros = page.locator("//*[@data-testid='vendas-hoje-link-filtrar']");
        this.btnPersonalizarColunas = page.locator("//*[@data-testid='vendas-hoje-link-personalizar']");
        this.btnExportar = page.locator("//*[@data-testid='exportar-hoje']");

        // Filtros
        this.titleFiltros = page.locator("//*[text()='Os itens selecionados serão aplicados na pesquisa.']");
        this.iconeSair = page.locator("//*[@data-testid='generic-filter-link-sair']");
        this.linkLimparFiltros = page.locator("//*[@data-testid='generic-filter-link-clean-all']");
        this.btnMostrarResultados = page.locator("//*[@data-testid='generic-filter-btn-resultados']");

        // Status
        this.linkStatus = page.locator("//*[@data-testid='generic-filter-accordion-title-status']");
        this.ckbStatusSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-status']");
        this.linkStatusLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-status']");
        this.ckbStatusAutorizada = page.locator("//*[@data-testid='generic-filter-check-status-Autorizada']");
        this.ckbStatusRecusada = page.locator("//*[@data-testid='generic-filter-check-status-Recusada']");
        this.ckbStatusEstornada = page.locator("//*[@data-testid='generic-filter-check-status-Estornada']");

        // Produtos
        this.linkProdutos = page.locator("//*[@data-testid='generic-filter-accordion-title-produtos']");
        this.ckbProdutosSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-produtos']");
        this.linkProdutosLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-produtos']");
        this.ckbProdutosCredito = page.locator("//*[@data-testid='generic-filter-check-produto-Crédito']");
        this.ckbProdutosCreditoInternacional = page.locator("//*[@data-testid='generic-filter-check-produto-Crédito-Internacional']");
        this.ckbProdutosDebito = page.locator("//*[@data-testid='generic-filter-check-produto-Débito']");
        this.ckbProdutosDebitoInternacional = page.locator("//*[@data-testid='generic-filter-check-produto-Débito-Internacional']");
        this.ckbProdutosRefeicao = page.locator("//*[@data-testid='generic-filter-check-produto-Refeição']");
        this.ckbProdutosAlimentacao = page.locator("//*[@data-testid='generic-filter-check-produto-Alimentação']");
        this.ckbProdutosPremium = page.locator("//*[@data-testid='generic-filter-check-produto-Premium']");
        this.ckbProdutosCultura = page.locator("//*[@data-testid='generic-filter-check-produto-Cultura']");
        this.ckbProdutosAuto = page.locator("//*[@data-testid='generic-filter-check-produto-Auto']");
        this.ckbProdutosGift = page.locator("//*[@data-testid='generic-filter-check-produto-Gift']");
        this.ckbProdutosCorporativo = page.locator("//*[@data-testid='generic-filter-check-produto-Corporativo']");
        this.ckbProdutosBeneficios = page.locator("//*[@data-testid='generic-filter-check-produto-Benefícios']");
        this.ckbProdutosMultiplo = page.locator("//*[@data-testid='generic-filter-check-produto-Multiplo']");
        this.ckbProdutosFlex = page.locator("//*[@data-testid='generic-filter-check-produto-Flex']");
        this.ckbProdutosNatal = page.locator("//*[@data-testid='generic-filter-check-produto-Natal']");
        this.ckbProdutosMultibeneficios = page.locator("//*[@data-testid='generic-filter-check-produto-Multibenefícios']");

        // Canal
        this.linkCanal = page.locator("//*[@data-testid='generic-filter-accordion-title-canal']");
        this.ckbCanalSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-canais']");
        this.linkCanalLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-canais']");
        this.ckbCanalPrimeiraOpcao = page.locator("(//*[contains(@data-testid, 'generic-filter-check-canal-')])[1]");

        // Bandeira
        this.linkBandeira = page.locator("//*[@data-testid='generic-filter-accordion-title-bandeira']");
        this.ckbBandeiraSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-bandeiras']");
        this.linkBandeiraLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-bandeiras']");
        this.linkBandeiraMastercard = page.locator("//*[@data-testid='generic-filter-div-bandeira-Mastercard']");
        this.linkBandeiraMaestro = page.locator("//*[@data-testid='generic-filter-div-bandeira-Maestro']");
        this.linkBandeiraCabal = page.locator("//*[@data-testid='generic-filter-div-bandeira-Cabal']");
        this.linkBandeiraElo = page.locator("//*[@data-testid='generic-filter-div-bandeira-Elo']");
        this.linkBandeiraBanese = page.locator("//*[@data-testid='generic-filter-div-bandeira-Banese']");
        this.linkBandeiraTicket = page.locator("//*[@data-testid='generic-filter-div-bandeira-Ticket']");
        this.linkBandeiraAlelo = page.locator("//*[@data-testid='generic-filter-div-bandeira-Alelo']");
        this.linkBandeiraSorocred = page.locator("//*[@data-testid='generic-filter-div-bandeira-Sorocred']");
        this.linkBandeiraAmex = page.locator("//*[@data-testid='generic-filter-div-bandeira-Amex']");
        this.linkBandeiraHipercard = page.locator("//*[@data-testid='generic-filter-div-bandeira-Hipercard']");
        this.linkBandeiraPluxee = page.locator("//*[@data-testid='generic-filter-div-bandeira-Pluxee']");
        this.linkBandeiraVR = page.locator("//*[@data-testid='generic-filter-div-bandeira-VR']");
        this.linkBandeiraVisa = page.locator("//*[@data-testid='generic-filter-div-bandeira-Visa']");
        this.linkBandeiraSoftnex = page.locator("//*[@data-testid='generic-filter-div-bandeira-Softnex']");
        this.linkBandeiraRedecompras = page.locator("//*[@data-testid='generic-filter-div-bandeira-Redecompras']");
        this.linkBandeiraFepas = page.locator("//*[@data-testid='generic-filter-div-bandeira-Fepas']");

        // Valores
        this.linkValores = page.locator("//*[@data-testid='generic-filter-accordion-title-valores']");
        this.txtValoresDe = page.locator("//*[@data-testid='generic-filter-input-valor-de']");
        this.txtValoresAte = page.locator("//*[@data-testid='generic-filter-input-valor-ate']");

        // Estabelecimento
        this.linkEstabelecimento = page.locator("//*[@data-testid='generic-filter-accordion-title-estabelecimentos']");
        this.ckbEstabelecimentoSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-estabelecimentos']");
        this.ckbEstabelecimentoLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-estabelecimentos']");
        this.ckbEstabelecimentoPrimeiraOpcao = page.locator("(//*[contains(@data-testid, 'generic-filter-check-estabelecimento-')])[1]");

        // Terminal
        this.linkTerminal = page.locator("//*[@data-testid='generic-filter-accordion-title-terminais']");
        this.cbkTerminalSelecionarTudo = page.locator("//*[@data-testid='generic-filter-check-all-terminais']");
        this.linkTerminalLimparSelecoes = page.locator("//*[@data-testid='generic-filter-link-clean-terminais']");
        this.cbkTerminalPrimeiraOpcao = page.locator("(//*[contains(@data-testid, 'generic-filter-check-terminal-')])[1]");

        // Personalizar Colunas
        this.titlePersonalizarColunas = page.locator("//*[contains(text(), 'Personalize a visualização das colunas')]");
        this.ckbDataVenda = page.locator("//*[text()='Data da venda']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbCodAutorizacao = page.locator("//*[text()='Cód. de autorização']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbComprovanteVenda = page.locator("//*[text()='Comprovante de venda']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbProduto = page.locator("//*[text()='Produto']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbParcelas = page.locator("//*[text()='Parcelas']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbBandeira = page.locator("//*[text()='Bandeira']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbCanal = page.locator("//*[text()='Canal']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbTerminal = page.locator("//*[text()='Terminal']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbValorBruto = page.locator("//*[text()='Valor bruto']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbStatus = page.locator("//*[text()='Status']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbEstabelecimento = page.locator("//*[text()='Estabelecimento']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbFinalCartao = page.locator("//*[text()='Final do cartão']/preceding-sibling::*/input[@type='checkbox']");
        this.ckbCodReferenciaCartao = page.locator("//*[text()='Cód. referência do cartão']/preceding-sibling::*/input[@type='checkbox']");
        this.linkVoltarPadrao = page.locator("//*[text()='Voltar ao padrão']");
        this.btnAplicar = page.locator("//*[text()='Aplicar']");

        // Resultado coluna
        this.resultadoColunas = page.locator("//*[@data-block='VendasHoje.HojeListaHistorico']");
        this.primeiroRegistroCodAutorizacao = page.locator("(//*[contains(@data-testid, 'vendas-hoje-coluna-cod-autorizacao') and not(text()='-')])[1]");
        this.resultadoColunaDataVenda = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-data-venda')]");
        this.resultadoColunaCodAutorizacao = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-cod-autorizacao')]");
        this.resultadoColunaComprovanteVenda = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-comprovante-venda')]");
        this.resultadoColunaProduto = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-produto')]");
        this.resultadoColunaParcelas = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-parcela')]");
        this.resultadoColunaBandeira = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-bandeira')]");
        this.resultadoColunaCanal = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-canal')]");
        this.resultadoColunaTerminal = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-terminal')]");
        this.resultadoColunaValor = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-vlr-bruto')]");
        this.resultadoColunaStatus = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-status')]");
        this.resultadoColunaEsbalecimento = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-estabelecimento')]");
        this.resultadoColunaFinalCartao = page.locator("//*[contains(@data-testid, 'vendas-hoje-coluna-final-cartao')]");
        this.resultadoColunaCodReferenciaCartao = page.locator("//*[text()='Cód. referência do cartão']/../../../../div/span");

        // Exportar
        this.titleExportar = page.locator("//*[text()='Escolha como deseja exportar o relatório']");
        this.slcTipoArquivo = page.locator("//*[@data-testid='simple-dropdown-select--text-label']");
        this.optExcel = page.locator("//*[@data-testid='simple-dropdown-select--item-excel']");
        this.optCSV = page.locator("//*[@data-testid='simple-dropdown-select--item-csv']");
        this.btnCancelar = page.locator("//*[text()='Cancelar']/..");
        this.btnGerarArquivo = page.locator("//*[contains(text(), 'Gerar arquivo')]");
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Total de vendas"))
                assertThat(totalVendas).isVisible();
            if (campo.equalsIgnoreCase("Valor bruto"))
                assertThat(valorBruto).isVisible();
        }
    }

    public void preencherCodAutorizacao(String codAutorizacao) { this.txtCodAutorizacao.fill(codAutorizacao); }
    public void clickLupa() { this.iconeLupa.click(); }
    public void clickFiltros() { this.btnFiltros.click(); }
    public void clickPersonalizarColunas() { this.btnPersonalizarColunas.click(); }
    public void clickExportar() { this.btnExportar.click(); }

    // Filtros
    public void verificarFiltrosVendasHoje() {
        assertThat(titleFiltros).isVisible();
    }

    public void clickSair() { this.iconeSair.click(); }
    public void clickLimparFiltros() { this.linkLimparFiltros.click(); }
    public void clickMostrarResultados() { this.btnMostrarResultados.click(); }

    // Status
    public void clickFiltroStatus() { this.linkStatus.click(); }
    public void clickStatusSelecionarTudo() { this.ckbStatusSelecionarTudo.click(); }
    public void clickStatusLimparSelecoes() { this.linkStatusLimparSelecoes.click(); }
    public void clickStatusAutorizada() { this.ckbStatusAutorizada.click(); }
    public void clickStatusRecusada() { this.ckbStatusRecusada.click(); }
    public void clickStatusEstornada() { this.ckbStatusEstornada.click(); }

    // Produtos
    public void clickFiltroProdutos() { this.linkProdutos.click(); }
    public void clickProdutosSelecionarTudo() { this.ckbProdutosSelecionarTudo.click(); }
    public void clickProdutosLimparSelecoes() { this.linkProdutosLimparSelecoes.click(); }
    public void clickProdutosCredito() { this.ckbProdutosCredito.click(); }
    public void clickProdutosCreditoInternacional() { this.ckbProdutosCreditoInternacional.click(); }
    public void clickProdutosDebito() { this.ckbProdutosDebito.click(); }
    public void clickProdutosDebitoInternacional() { this.ckbProdutosDebitoInternacional.click(); }
    public void clickProdutosRefeicao() { this.ckbProdutosRefeicao.click(); }
    public void clickProdutosAlimentacao() { this.ckbProdutosAlimentacao.click(); }
    public void clickProdutosPremium() { this.ckbProdutosPremium.click(); }
    public void clickProdutosCultura() { this.ckbProdutosCultura.click(); }
    public void clickProdutosAuto() { this.ckbProdutosAuto.click(); }
    public void clickProdutosGift() { this.ckbProdutosGift.click(); }
    public void clickProdutosCorporativo() { this.ckbProdutosCorporativo.click(); }
    public void clickProdutosBeneficios() { this.ckbProdutosBeneficios.click(); }
    public void clickProdutosMultiplo() { this.ckbProdutosMultiplo.click(); }
    public void clickProdutosFlex() { this.ckbProdutosFlex.click(); }
    public void clickProdutosNatal() { this.ckbProdutosNatal.click(); }
    public void clickProdutosMultibeneficios() { this.ckbProdutosMultibeneficios.click(); }

    // Canal
    public void clickFiltroCanal() { this.linkCanal.click(); }
    public void clickCanalSelecionarTudo() { this.ckbCanalSelecionarTudo.click(); }
    public void clickCanalLimparSelecoes() { this.linkCanalLimparSelecoes.click(); }
    public void clickCanalPrimeiraOpcao() { this.ckbCanalPrimeiraOpcao.click(); }

    // Bandeira
    public void clickFiltroBandeira() { this.linkBandeira.click(); }
    public void clickBandeiraSelecionarTudo() { this.ckbBandeiraSelecionarTudo.click(); }
    public void clickBandeiraLimparSelecoes() { this.linkBandeiraLimparSelecoes.click(); }
    public void clickBandeiraMastercard() { this.linkBandeiraMastercard.click(); }
    public void clickBandeiraMaestro() { this.linkBandeiraMaestro.click(); }
    public void clickBandeiraCabal() { this.linkBandeiraCabal.click(); }
    public void clickBandeiraElo() { this.linkBandeiraElo.click(); }
    public void clickBandeiraBanese() { this.linkBandeiraBanese.click(); }
    public void clickBandeiraTicket() { this.linkBandeiraTicket.click(); }
    public void clickBandeiraAlelo() { this.linkBandeiraAlelo.click(); }
    public void clickBandeiraSorocred() { this.linkBandeiraSorocred.click(); }
    public void clickBandeiraAmex() { this.linkBandeiraAmex.click(); }
    public void clickBandeiraHipercard() { this.linkBandeiraHipercard.click(); }
    public void clickBandeiraPluxee() { this.linkBandeiraPluxee.click(); }
    public void clickBandeiraVR() { this.linkBandeiraVR.click(); }
    public void clickBandeiraVisa() { this.linkBandeiraVisa.click(); }
    public void clickBandeiraSoftnex() { this.linkBandeiraSoftnex.click(); }
    public void clickBandeiraRedecompras() { this.linkBandeiraRedecompras.click(); }
    public void clickBandeiraFepas() { this.linkBandeiraFepas.click(); }

    // Valores
    public void clickFiltroValores() { this.linkValores.click(); }
    public void preencherValoresDe(String valoresDe) { this.txtValoresDe.fill(valoresDe); }
    public void preencherValoresAte(String valoresAte) { this.txtValoresAte.fill(valoresAte); }

    // Estabelecimento
    public void clickFiltroEstabelecimento() { this.linkEstabelecimento.click(); }
    public void clickEstabelecimentoSelecionarTudo() { this.ckbEstabelecimentoSelecionarTudo.click(); }
    public void clickEstabelecimentoLimparSelecoes() { this.ckbEstabelecimentoLimparSelecoes.click(); }
    public void clickEstabelecimentoPrimeiraOpcao() { this.ckbEstabelecimentoPrimeiraOpcao.click(); }

    // Terminal
    public void clickFiltroTerminal() { this.linkTerminal.click(); }
    public void clickTerminalSelecionarTudo() { this.cbkTerminalSelecionarTudo.click(); }
    public void clickTerminalLimparSelecoes() { this.linkTerminalLimparSelecoes.click(); }
    public void clickTerminalPrimeiraOpcao() { this.cbkTerminalPrimeiraOpcao.click(); }

    public void realizarFiltro(String filtro, String valor) {
        WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));
        this.btnFiltros.scrollIntoViewIfNeeded();

        if (!filtro.equalsIgnoreCase("codAutorizacao")) {
            this.verificarFiltrosVendasHoje();
            this.clickFiltros();
        }

        // realiza o filtro pelo seu tipo (campo) e passa o valor desejado
        switch (filtro) {
            case "codAutorizacao":
                if (valor.equalsIgnoreCase("primeiroRegistro"))
                    this.preencherCodAutorizacao(this.primeiroRegistroCodAutorizacao.textContent().trim());
                else
                    this.preencherCodAutorizacao(valor);

                break;

            case "status":
                this.clickFiltroStatus();
                switch (valor) {
                    case "todos":
                        this.clickStatusSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickStatusLimparSelecoes();
                        break;
                    case "Autorizada":
                        this.clickStatusAutorizada();
                        break;
                    case "Recusada":
                        this.clickStatusRecusada();
                        break;
                    case "Estornada":
                        this.clickStatusEstornada();
                        break;
                }
                break;

            case "produtos":
                this.clickFiltroProdutos();
                switch (valor) {
                    case "todos":
                        this.clickProdutosSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickProdutosLimparSelecoes();
                        break;
                    case "Crédito":
                        this.clickProdutosCredito();
                        break;
                    case "Crédito Internacional":
                        this.clickProdutosCreditoInternacional();
                        break;
                    case "Débito":
                        this.clickProdutosDebito();
                        break;
                    case "Débito Internacional":
                        this.clickProdutosDebitoInternacional();
                        break;
                    case "Refeição":
                        this.clickProdutosRefeicao();
                        break;
                    case "Alimentação":
                        this.clickProdutosAlimentacao();
                        break;
                    case "Premium":
                        this.clickProdutosPremium();
                        break;
                    case "Cultura":
                        this.clickProdutosCultura();
                        break;
                    case "Auto":
                        this.clickProdutosAuto();
                        break;
                    case "Gift":
                        this.clickProdutosGift();
                        break;
                    case "Corporativo":
                        this.clickProdutosCorporativo();
                        break;
                    case "Benefícios":
                        this.clickProdutosBeneficios();
                        break;
                    case "Multiplo":
                        this.clickProdutosMultiplo();
                        break;
                    case "Flex":
                        this.clickProdutosFlex();
                        break;
                    case "Natal":
                        this.clickProdutosNatal();
                        break;
                    case "Multibenefícios":
                        this.clickProdutosMultibeneficios();
                        break;
                }
                break;

            case "canal":
                this.clickFiltroCanal();
                switch (valor) {
                    case "todos":
                        this.clickCanalSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickCanalLimparSelecoes();
                        break;
                    case "selecionarPrimeiraOpcao":
                        this.clickCanalPrimeiraOpcao();
                        break;
                }
                break;

            case "bandeira":
                this.clickFiltroBandeira();
                switch (valor) {
                    case "todos":
                        this.clickBandeiraSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickBandeiraLimparSelecoes();
                        break;
                    case "Mastercard":
                        this.clickBandeiraMastercard();
                        break;
                    case "Maestro":
                        this.clickBandeiraMaestro();
                        break;
                    case "Cabal":
                        this.clickBandeiraCabal();
                        break;
                    case "Elo":
                        this.clickBandeiraElo();
                        break;
                    case "Banese":
                        this.clickBandeiraBanese();
                        break;
                    case "Ticket":
                        this.clickBandeiraTicket();
                        break;
                    case "Alelo":
                        this.clickBandeiraAlelo();
                        break;
                    case "Sorocred":
                        this.clickBandeiraSorocred();
                        break;
                    case "Amex":
                        this.clickBandeiraAmex();
                        break;
                    case "Hipercard":
                        this.clickBandeiraHipercard();
                        break;
                    case "Pluxee":
                        this.clickBandeiraPluxee();
                        break;
                    case "VR":
                        this.clickBandeiraVR();
                        break;
                    case "Visa":
                        this.clickBandeiraVisa();
                        break;
                    case "Softnex":
                        this.clickBandeiraSoftnex();
                        break;
                    case "Redecompras":
                        this.clickBandeiraRedecompras();
                        break;
                    case "Fepas":
                        this.clickBandeiraFepas();
                        break;
                }
                break;

            case "valores":
                this.clickFiltroValores();

                // valor De e Ate separados por ";"
                String[] valores = valor.split(";");
                this.preencherValoresDe(valores[0]);
                this.preencherValoresAte(valores[1]);

                break;

            case "estabelecimento":
                this.clickFiltroEstabelecimento();
                switch (valor) {
                    case "todos":
                        this.clickEstabelecimentoSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickEstabelecimentoLimparSelecoes();
                        break;
                    case "selecionarPrimeiraOpcao":
                        this.clickEstabelecimentoPrimeiraOpcao();
                        break;
                }
                break;

            case "terminal":
                this.clickFiltroTerminal();
                switch (valor) {
                    case "todos":
                        this.clickTerminalSelecionarTudo();
                        break;
                    case "nenhum":
                        this.clickTerminalLimparSelecoes();
                        break;
                    case "selecionarPrimeiraOpcao":
                        this.clickTerminalPrimeiraOpcao();
                        break;
                }
                break;

        }

        if (!filtro.equalsIgnoreCase("codAutorizacao")) {
            this.btnMostrarResultados.scrollIntoViewIfNeeded();
            this.clickMostrarResultados();
        } else
            this.clickLupa();

        WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));
    }

    // Personalizar Colunas
    public void verificarPersonalizarColunas() {
        assertThat(titlePersonalizarColunas).isVisible();
    }

    public void clickPersonalizarColunasDataVenda() { this.ckbDataVenda.click(); }
    public void clickPersonalizarColunasCodAutorizacao() { this.ckbCodAutorizacao.click(); }
    public void clickPersonalizarColunasComprovanteVenda() { this.ckbComprovanteVenda.click(); }
    public void clickPersonalizarColunasProduto() { this.ckbProduto.click(); }
    public void clickPersonalizarColunasParcelas() { this.ckbParcelas.click(); }
    public void clickPersonalizarColunasBandeira() { this.ckbBandeira.click(); }
    public void clickPersonalizarColunasCanal() { this.ckbCanal.click(); }
    public void clickPersonalizarColunasTerminal() { this.ckbTerminal.click(); }
    public void clickPersonalizarColunasValorBruto() { this.ckbValorBruto.click(); }
    public void clickPersonalizarColunasStatus() { this.ckbStatus.click(); }
    public void clickPersonalizarColunasEstabelecimento() { this.ckbEstabelecimento.click(); }
    public void clickPersonalizarColunasFinalCartao() { this.ckbFinalCartao.click(); }
    public void clickPersonalizarColunasCodReferenciaCartao() { this.ckbCodReferenciaCartao.click(); }
    public void clickVoltarPadrao() { this.linkVoltarPadrao.click(); }
    public void clickAplicar() { this.btnAplicar.click(); }

    private void selecionarColunaPersonalizacao(String coluna) {
        if (coluna.equalsIgnoreCase("dataVenda"))
            this.clickPersonalizarColunasDataVenda();
        else if (coluna.equalsIgnoreCase("codAutorizacao"))
            this.clickPersonalizarColunasCodAutorizacao();
        else if (coluna.equalsIgnoreCase("comprovanteVenda"))
            this.clickPersonalizarColunasComprovanteVenda();
        else if (coluna.equalsIgnoreCase("produto"))
            this.clickPersonalizarColunasProduto();
        else if (coluna.equalsIgnoreCase("parcelas"))
            this.clickPersonalizarColunasParcelas();
        else if (coluna.equalsIgnoreCase("bandeira"))
            this.clickPersonalizarColunasBandeira();
        else if (coluna.equalsIgnoreCase("canal"))
            this.clickPersonalizarColunasCanal();
        else if (coluna.equalsIgnoreCase("terminal"))
            this.clickPersonalizarColunasTerminal();
        else if (coluna.equalsIgnoreCase("valorBruto"))
            this.clickPersonalizarColunasValorBruto();
        else if (coluna.equalsIgnoreCase("status"))
            this.clickPersonalizarColunasStatus();
        else if (coluna.equalsIgnoreCase("estabelecimento"))
            this.clickPersonalizarColunasEstabelecimento();
        else if (coluna.equalsIgnoreCase("finalCartao"))
            this.clickPersonalizarColunasFinalCartao();
        else if (coluna.equalsIgnoreCase("codReferenciaCartao"))
            this.clickPersonalizarColunasCodReferenciaCartao();
    }

    private void atribuirFocoColunaPersonalizacao(String coluna) {
        Locator campoFoco = page.locator("");

        if (coluna.equalsIgnoreCase("dataVenda"))
            campoFoco = ckbDataVenda;
        else if (coluna.equalsIgnoreCase("codAutorizacao"))
            campoFoco = ckbCodAutorizacao;
        else if (coluna.equalsIgnoreCase("comprovanteVenda"))
            campoFoco = ckbComprovanteVenda;
        else if (coluna.equalsIgnoreCase("produto"))
            campoFoco = ckbProduto;
        else if (coluna.equalsIgnoreCase("parcelas"))
            campoFoco = ckbParcelas;
        else if (coluna.equalsIgnoreCase("bandeira"))
            campoFoco = ckbBandeira;
        else if (coluna.equalsIgnoreCase("canal"))
            campoFoco = ckbCanal;
        else if (coluna.equalsIgnoreCase("terminal"))
            campoFoco = ckbTerminal;
        else if (coluna.equalsIgnoreCase("valorBruto"))
            campoFoco = ckbValorBruto;
        else if (coluna.equalsIgnoreCase("status"))
            campoFoco = ckbStatus;
        else if (coluna.equalsIgnoreCase("estabelecimento"))
            campoFoco = ckbEstabelecimento;
        else if (coluna.equalsIgnoreCase("finalCartao"))
            campoFoco = ckbFinalCartao;
        else if (coluna.equalsIgnoreCase("codReferenciaCartao"))
            campoFoco = ckbCodReferenciaCartao;

        campoFoco.scrollIntoViewIfNeeded();
    }

    private void voltarPadraoPersonalizarColunas() {
        this.btnPersonalizarColunas.scrollIntoViewIfNeeded();
        this.clickPersonalizarColunas();
        this.verificarPersonalizarColunas();

        this.linkVoltarPadrao.scrollIntoViewIfNeeded();
        this.clickVoltarPadrao();
        WaitUtil.sleep(Duration.ofMillis(Config.DELAY_IN_ACTION));
    }

    private void realizarTrocaPersonalizarColunas(String colunaRemover, String colunaAdicionar) {
        // Atribuir foco na coluna escolhida
        this.atribuirFocoColunaPersonalizacao(colunaAdicionar);

        // Remover coluna
        this.selecionarColunaPersonalizacao(colunaRemover);

        // Adicionar coluna
        this.selecionarColunaPersonalizacao(colunaAdicionar);

        this.btnAplicar.scrollIntoViewIfNeeded();
        this.clickAplicar();
    }

    public void personalizarColunas(String colunas) {
        WaitUtil.sleep(Duration.ofMillis(Config.DELAY_IN_ACTION));
        this.btnPersonalizarColunas.scrollIntoViewIfNeeded();

        // Acessa o Personalizar Colunas
        this.clickPersonalizarColunas();
        this.verificarPersonalizarColunas();

        this.ckbCodReferenciaCartao.scrollIntoViewIfNeeded();
        WaitUtil.sleep(Duration.ofMillis(Config.DELAY_IN_ACTION));

        // Limpar personalização inicial de colunas
        this.clickPersonalizarColunasDataVenda();
        this.clickPersonalizarColunasCodAutorizacao();
        this.clickPersonalizarColunasComprovanteVenda();
        this.clickPersonalizarColunasProduto();
        this.clickPersonalizarColunasParcelas();
        this.clickPersonalizarColunasBandeira();
        this.clickPersonalizarColunasCanal();
        this.clickPersonalizarColunasTerminal();
        this.clickPersonalizarColunasValorBruto();
        this.clickPersonalizarColunasStatus();

        String[] listaColunas = colunas.split(";");

        for (String coluna : listaColunas)
            this.selecionarColunaPersonalizacao(coluna);

        this.btnAplicar.scrollIntoViewIfNeeded();
        this.clickAplicar();
    }

    public void validarPersonalizacaoColunas(String colunas) {
        this.resultadoColunas.scrollIntoViewIfNeeded();
        WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));

        Locator colunaResultado = page.locator("");
        String[] listaColunas = colunas.split(";");

        for (String coluna : listaColunas) {
            if (coluna.equalsIgnoreCase("dataVenda"))
                colunaResultado = resultadoColunaDataVenda;
            else if (coluna.equalsIgnoreCase("codAutorizacao"))
                colunaResultado = resultadoColunaCodAutorizacao;
            else if (coluna.equalsIgnoreCase("comprovanteVenda"))
                colunaResultado = resultadoColunaComprovanteVenda;
            else if (coluna.equalsIgnoreCase("produto"))
                colunaResultado = resultadoColunaProduto;
            else if (coluna.equalsIgnoreCase("parcelas"))
                colunaResultado = resultadoColunaParcelas;
            else if (coluna.equalsIgnoreCase("bandeira"))
                colunaResultado = resultadoColunaBandeira;
            else if (coluna.equalsIgnoreCase("canal"))
                colunaResultado = resultadoColunaCanal;
            else if (coluna.equalsIgnoreCase("terminal"))
                colunaResultado = resultadoColunaTerminal;
            else if (coluna.equalsIgnoreCase("valorBruto"))
                colunaResultado = resultadoColunaValor;
            else if (coluna.equalsIgnoreCase("status"))
                colunaResultado = resultadoColunaStatus;
            else if (coluna.equalsIgnoreCase("estabelecimento"))
                colunaResultado = resultadoColunaEsbalecimento;
            else if (coluna.equalsIgnoreCase("finalCartao"))
                colunaResultado = resultadoColunaFinalCartao;
            else if (coluna.equalsIgnoreCase("codReferenciaCartao"))
                colunaResultado = resultadoColunaCodReferenciaCartao;

            for (Locator row : colunaResultado.getByRole(AriaRole.LISTITEM).all()) {
                if (!row.textContent().equalsIgnoreCase(""))
                    assertThat(row).isVisible();
            }
        }

        this.voltarPadraoPersonalizarColunas();
    }

    // Resultado coluna
    public void validarAtribuicaoFiltro(String valor, String filtro) {
        this.resultadoColunas.scrollIntoViewIfNeeded();
        WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));

        switch (filtro) {
            case "codAutorizacao":
                for (Locator row : resultadoColunaCodAutorizacao.getByRole(AriaRole.LISTITEM).all()) {
                    if (valor.equalsIgnoreCase("primeiroRegistro"))
                        assertThat(row).containsText(this.primeiroRegistroCodAutorizacao.textContent().trim());
                    else
                        assertThat(row).containsText(valor);
                }
                break;

            case "status":
                for (Locator row : resultadoColunaStatus.getByRole(AriaRole.LISTITEM).all()) {
                    if (valor.equalsIgnoreCase("todos")) {
                        if (!row.textContent().equalsIgnoreCase(""))
                            assertThat(row).isVisible();
                    } else
                        assertThat(row).containsText(valor);
                }
                break;

            case "produtos":
                for (Locator row : resultadoColunaProduto.getByRole(AriaRole.LISTITEM).all()) {
                    if (valor.equalsIgnoreCase("todos")) {
                        if (!row.textContent().equalsIgnoreCase(""))
                            assertThat(row).isVisible();
                    } else
                        assertThat(row).containsText(valor);
                }
                break;

            case "canal":
                for (Locator row : resultadoColunaCanal.getByRole(AriaRole.LISTITEM).all()) {
                    if (!row.textContent().equalsIgnoreCase(""))
                        assertThat(row).isVisible();
                }
                break;

            case "bandeira":
                for (Locator row : resultadoColunaBandeira.getByRole(AriaRole.LISTITEM).all()) {
                    if (valor.equalsIgnoreCase("todos")) {
                        if (!row.textContent().equalsIgnoreCase(""))
                            assertThat(row).isVisible();
                    } else
                        assertThat(row).containsText(valor);
                }
                break;

            case "valores":
                for (Locator row : resultadoColunaValor.getByRole(AriaRole.LISTITEM).all()) {
                    String valorBruto = row.textContent().trim();
                    valorBruto = valorBruto.replaceAll(",", ".");
                    valorBruto = valorBruto.replaceAll("R$ ", "");
                    double valorBrutoReal = Double.parseDouble(valorBruto);

                    // valor De e Ate separados por ";"
                    String[] valores = valor.split(";");
                    double valorDe = Double.parseDouble(valores[0]);
                    double valorAte = Double.parseDouble(valores[1]);

                    if ((valorBrutoReal >= valorDe) && (valorBrutoReal <= valorAte))
                        assertThat(row).isVisible();
                    else
                        assertThat(row).not().isVisible();
                }
                break;

            case "estabelecimento":
                // Acessa o Personalizar Colunas
                this.clickPersonalizarColunas();
                this.verificarPersonalizarColunas();

                // Remove o Status e adiciona o Esbelecimento aplicando a personalização de colunas
                String colunaRemover = "status", colunaAdicionar = "estabelecimento";
                this.realizarTrocaPersonalizarColunas(colunaRemover, colunaAdicionar);

                WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));
                this.resultadoColunas.scrollIntoViewIfNeeded();

                for (Locator row : resultadoColunaEsbalecimento.getByRole(AriaRole.LISTITEM).all()) {
                    if (!row.textContent().equalsIgnoreCase(""))
                        assertThat(row).isVisible();
                }

                this.voltarPadraoPersonalizarColunas();

                break;

            case "terminal":
                for (Locator row : resultadoColunaTerminal.getByRole(AriaRole.LISTITEM).all()) {
                    if (!row.textContent().equalsIgnoreCase(""))
                        assertThat(row).isVisible();
                }
                break;
        }
    }

    // Exportar
    public void verificarExportar() {
        assertThat(titleExportar).isVisible();
    }

    private void selecionarTipoArquivo(String tipoArquivo) {
        this.slcTipoArquivo.hover();

        if (tipoArquivo.equalsIgnoreCase("Excel"))
            this.optExcel.click();
        else if (tipoArquivo.equalsIgnoreCase("CSV"))
            this.optCSV.click();
    }

    public void clickCancelar() { this.btnCancelar.click(); }

    public void validarNomeArquivo(String tipoArquivo) {
        // realiza o exportar
        this.btnExportar.scrollIntoViewIfNeeded();
        this.clickExportar();
        this.verificarExportar();
        this.selecionarTipoArquivo(tipoArquivo);

        // Aguarda download ao clicar no botão Exportar
        Download download = page.waitForDownload(() -> {
            this.btnGerarArquivo.click();
        });

        if (validarNomeTipoArquivo(tipoArquivo, download))
            assertTrue(true);
        else
            assertFalse(false);
    }

    private static boolean validarNomeTipoArquivo(String tipoArquivo, Download download) {
        boolean retorno = false;

        // Atribui o prefixo do nome do arquivo
        String nomeArquivo = "Relatorio_de_Vendas_Hoje_";

        // Captura e formata a data atual
        LocalDate now = LocalDate.now();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-YYYY_");
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

    public void validarColunasArquivo(String colunas, String tipoArquivo) throws IOException {
        // Cria a lista de colunas do arquivo
        List<String> listaColunas = List.of(colunas.split(";"));

        // realiza o exportar
        this.btnExportar.scrollIntoViewIfNeeded();
        this.clickExportar();
        this.verificarExportar();
        this.selecionarTipoArquivo(tipoArquivo);

        // Aguarda download ao clicar no botão Exportar
        Download download = page.waitForDownload(() -> {
            this.btnGerarArquivo.click();
        });

        String extensao = getExtensao(tipoArquivo);
        Path arquivoBaixado = download.path();
        File copiaArquivoBaixado = copiarArquivoAtribuirExtensao(arquivoBaixado.toFile(), extensao);

        if (validarColunasTipoArquivo(copiaArquivoBaixado, listaColunas))
            assertTrue(true);
        else
            assertFalse(false);
    }

    private static File copiarArquivoAtribuirExtensao(File arquivoBaixado, String extensao) throws IOException {
        // Caminho original do arquivo
        Path diretorio = arquivoBaixado.toPath();

        // Atribui a extensão ao arquivo
        String novoArquivo = diretorio.toFile().getName() + extensao;
        Path novoDiretorio = diretorio.getParent().resolve(novoArquivo);

        // Faz uma copia do arquivo
        Files.copy(diretorio, novoDiretorio, StandardCopyOption.REPLACE_EXISTING);

        return novoDiretorio.toFile();
    }

    private static boolean validarColunasTipoArquivo(File arquivo, List<String> listaColunas) throws IOException {
        boolean retorno = false;

        String nomeArquivo = arquivo.getName();

        if (nomeArquivo.endsWith(".xlsx"))
            retorno = validarColunasExcel(arquivo, listaColunas);
        else if (nomeArquivo.endsWith(".csv"))
            retorno = validarColunasCSV(arquivo, listaColunas);

        return retorno;
    }

    private static boolean validarColunasExcel(File arquivo, List<String> listaColunas) throws IOException {
        try (FileInputStream fis = new FileInputStream(arquivo); XSSFWorkbook workbook = new XSSFWorkbook(fis)) {

            // Acessa a primeira aba (sheet)
            Sheet sheet = workbook.getSheetAt(0);
            Row primeiraLinha = sheet.getRow(16);

            List<String> colunasArquivo = new ArrayList<>();
            primeiraLinha.forEach(cell -> colunasArquivo.add(cell.getStringCellValue()));
            return colunasArquivo.containsAll(listaColunas);
        }
    }

    private static boolean validarColunasCSV(File arquivo, List<String> listaColunas) throws IOException {
        try (CSVParser parser = new CSVParser(new FileReader(arquivo), CSVFormat.DEFAULT.withHeader())) {
            List<String> colunasArquivo = new ArrayList<>(parser.getHeaderNames());
            return colunasArquivo.containsAll(listaColunas);
        }
    }

    private static String getExtensao(String tipoArquivo) {
            String extensao = "";
        if (tipoArquivo.equalsIgnoreCase("Excel"))
            extensao = ".xlsx";
        else if (tipoArquivo.equalsIgnoreCase("CSV"))
            extensao = ".csv";

        return extensao;
    }
}