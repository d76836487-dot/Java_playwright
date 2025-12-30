package com.fiserv.qabrazil.pages.antecipacao;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.testng.Assert;

import java.time.LocalDate;
import java.time.format.TextStyle; 
import java.util.Locale;

@ScenarioComponent
public class AntecipacaoEventualPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator titleAntecipacaoEventual;
    private Locator btnPersonalizarSolicitacaoAntecipacao;
    private Locator titlePersonalizarSolicitacaoAntecipacao;
    private Locator ckbTodoPeriodo;
    private Locator calendarioVencimentoDe;
    private Locator calendarioAte;
    private Locator txtValor;
    private Locator valorDisponivelPersonalizado;
    private Locator titlePersonalizeValor;
    private Locator rbValorMinimo;
    private Locator rbValorMaximo;
    private Locator valorSolicitado;
    private Locator valorDescontado;
    private Locator valorReceber;
    private Locator valorSolicitacaoAntecipacao;
    private Locator titleInformacoesGerais;
    private Locator btnGerarComprovante;

    @Autowired
    SolicitarAntecipacaoPage solicitarAntecipacaoPage;

    @PostConstruct
    private void loadLocators() {
        this.titleAntecipacaoEventual = page.locator("//*[text()='Resumo da antecipação eventual']");
        this.btnPersonalizarSolicitacaoAntecipacao = page.locator("//*[text()='Personalizar solicitação de antecipação']");
        this.titlePersonalizarSolicitacaoAntecipacao = page.locator("//h5/span[text()='Personalizar solicitação de antecipação']");
        this.ckbTodoPeriodo = page.locator("//*[@class='switch' and @type='checkbox']");
        this.calendarioVencimentoDe = page.locator("//*[text()='Vencimento De']");
        this.calendarioAte = page.locator("//*[text()='Até']");
        this.txtValor = page.locator("//*[@type='text' and contains(@id, '-InputMask')]");
        this.valorDisponivelPersonalizado = page.locator("//span[span[normalize-space(text())='Valor disponível personalizado:']]/following-sibling::span/span");
        this.titlePersonalizeValor = page.locator("//*[contains(text(), 'Personalize o valor')]");
        this.rbValorMinimo = page.locator("//*[contains(@id, '-RadioButton1-input')]");
        this.rbValorMaximo = page.locator("//*[contains(@id, '-RadioButton2-input')]");
        this.valorSolicitado = page.locator("//*[text()='Valor solicitado']/following-sibling::span");
        this.valorDescontado = page.locator("//*[text()='Valor descontado']/following-sibling::span");
        this.valorReceber = page.locator("//*[text()='Valor à receber']/following-sibling::span");
        this.valorSolicitacaoAntecipacao = page.locator("//div[contains(normalize-space(text()), 'Deseja confirmar a solicitação de antecipação de')]/span");
        this.titleInformacoesGerais = page.locator("//*[text()='Informações gerais']");
        this.btnGerarComprovante = page.locator("//*[text()='Gerar comprovante']");
    }

    private void checkTodoPeriodo(String todoPeriodo, String diaVencimentoDe, String diaAte) {
        if (todoPeriodo.equalsIgnoreCase("N")) {
            this.selecionarDiaVencimentoDe(diaVencimentoDe);
            this.selecionarDiaAte(diaAte);
        } else {
            if (!this.ckbTodoPeriodo.isChecked())
                click(this.ckbTodoPeriodo);
        }
    }

    private LocalDate atribuirData(String dia, Locator proximoMes) {
        int qtdDias = Integer.parseInt(
            dia
                .replace("D", "")
                .replace("+", "")
        );

            LocalDate data;
        if (qtdDias > 0)
            data = LocalDate.now().plusDays(qtdDias);
        else
            data = LocalDate.now();

        if (LocalDate.now().getMonth() != data.getMonth())
            click(proximoMes);

        return data;
    }

    private String formatarData(LocalDate data) {
        TextStyle txtShort = TextStyle.FULL;
        Locale localePtBr = Locale.forLanguageTag("pt-BR");

        // Fevereiro 25, 2025
        String mes = data.getMonth()
                .getDisplayName(txtShort, localePtBr)
                .substring(0, 1).toUpperCase()
                + data.getMonth()
                .getDisplayName(txtShort, localePtBr)
                .substring(1);
        int dia = data.getDayOfMonth();
        int ano = data.getYear();

        return mes + " " + dia + ", " + ano;
    }

    private void selecionarDiaVencimentoDe(String dia) {
        click(this.calendarioVencimentoDe);

        Locator proximoMes = page.locator("(//*[@class='flatpickr-next-month'])[1]");
        String data = this.formatarData(this.atribuirData(dia, proximoMes));
        click(page.locator("(//*[@aria-label='" + data + "'])[1]"));
    }

    private void selecionarDiaAte(String dia) {
        click(this.calendarioAte);

        Locator proximoMes = page.locator("(//*[@class='flatpickr-next-month'])[2]");
        String data = this.formatarData(this.atribuirData(dia, proximoMes));
        click(page.locator("(//*[@aria-label='" + data + "'])[2]"));
    }

    private void preencherValor(String valor) {
        pressValue(this.txtValor, valor);
        click(this.titlePersonalizeValor);
        waitForSeconds(Config.WAIT_5_SECONDS);
    }

    private void clickValorMinimoMaximo(String minimoMaximo) {
        if (minimoMaximo.equalsIgnoreCase("minimo"))
            click(this.rbValorMinimo);
        else if (minimoMaximo.equalsIgnoreCase("maximo"))
            click(this.rbValorMaximo);
    }

    private void validarValoresAntecipacaoEventual(int validacao) {
        if (validacao == 1) {
            double valorSolicitado = replaceMonetaryValue(this.valorSolicitado.textContent());
            double valorDescontado = replaceMonetaryValue(this.valorDescontado.textContent());
            double valorReceber = replaceMonetaryValue(this.valorReceber.textContent());
            double vl1 = GeneralUtils.roundNumber(valorSolicitado - valorDescontado, 2, "UP");

            boolean verificacao = vl1 == valorReceber;
            Assert.assertTrue(verificacao);
        } else if (validacao == 2) {
            double valorDisponivelPersonalizado = replaceMonetaryValue(this.valorDisponivelPersonalizado.textContent());
            double valorSolicitacaoAntecipacao = replaceMonetaryValue(this.valorSolicitacaoAntecipacao.textContent());

            boolean verificacao = valorDisponivelPersonalizado >= valorSolicitacaoAntecipacao;
            Assert.assertTrue(verificacao);
        }
    }

    public void solicitarAntecipacaoEventual(
     String bandeiras
    ,String produtos
    ,String todoPeriodo
    ,String diaVencimentoDe
    ,String diaAte
    ,String valor
    ,String minimoMaximo) {
        solicitarAntecipacaoPage.waitForLoadSolicitarAntecipacao();
        solicitarAntecipacaoPage.clickSolicitarAntecipacaoEventual();

        waitIsVisibleForSeconds(this.titleAntecipacaoEventual, Config.WAIT_5_SECONDS);
        click(this.btnPersonalizarSolicitacaoAntecipacao);

        waitIsVisibleForSeconds(this.titlePersonalizarSolicitacaoAntecipacao, Config.WAIT_5_SECONDS);
        solicitarAntecipacaoPage.selectBandeiras(bandeiras);
        solicitarAntecipacaoPage.selectProdutos(produtos);
        this.checkTodoPeriodo(todoPeriodo, diaVencimentoDe, diaAte);
        this.preencherValor(valor);
        this.clickValorMinimoMaximo(minimoMaximo);

        this.validarValoresAntecipacaoEventual(1);
        solicitarAntecipacaoPage.clickSolicitarAntecipacao();
        solicitarAntecipacaoPage.waitForLoadingConfirmarSolicitacao();
        this.validarValoresAntecipacaoEventual(2);
        solicitarAntecipacaoPage.clickConfirmar();

        waitIsVisibleForSeconds(this.titleInformacoesGerais, Config.WAIT_5_SECONDS);
        click(this.btnGerarComprovante);
        waitForSeconds(Config.WAIT_10_SECONDS);
    }
}