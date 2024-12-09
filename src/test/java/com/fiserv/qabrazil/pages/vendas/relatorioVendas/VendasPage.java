package com.fiserv.qabrazil.pages.vendas.relatorioVendas;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.WaitUtil;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.Duration;

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
    }

    // Click botões abas relatório
    private void clickAbaHoje() { this.abaHoje.click(); }
    private void clickAbaHistoricoVendas() { this.abaHistoricoVendas.click(); }
    private void clickAbaNaoEfetivadas() { this.abaNaoEfetivadas.click(); }
    private void clickAbaPreAutorizacoes() { this.abaPreAutorizacoes.click(); }
    private void clickAbaVoucher() { this.abaVoucher.click(); }

    // Validar carregamento aba do relatório
    public void validarCarregamentoAbaRelatorio(String abaRelatorio) {
        if (abaRelatorio.equalsIgnoreCase("Hoje")) {
            WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));
            assertThat(titleHoje).isVisible();
        } else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas")) {
            this.clickAbaHistoricoVendas();
            WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));
            assertThat(titleHistoricoVendas).isVisible();
        } else if (abaRelatorio.equalsIgnoreCase("Não efetivadas")) {
            this.clickAbaNaoEfetivadas();
            WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));
            assertThat(titleNaoEfetivadas).isVisible();
        } else if (abaRelatorio.equalsIgnoreCase("Pré-autorizações")) {
            this.clickAbaPreAutorizacoes();
            WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));
            assertThat(titlePreAutorizacoes).isVisible();
        } else if (abaRelatorio.equalsIgnoreCase("Voucher")) {
            this.clickAbaVoucher();
            WaitUtil.sleep(Duration.ofMillis(Config.WAIT_FOR_PAGE_UPDATE));
            assertThat(titleVocher).isVisible();
        }
    }
}