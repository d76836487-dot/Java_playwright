package com.fiserv.qabrazil.pages.antecipacao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.testng.Assert;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;

import jakarta.annotation.PostConstruct;

@ScenarioComponent
public class AntecipacaoAutomaticaPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator titleAntecipacaoAutomatica;
    private Locator slcFrequencia;
    private Locator slcDiaRecebimento;
    private Locator titleDadosContratacao;
    private Locator labelDataContratacao;

    @Autowired
    SolicitarAntecipacaoPage solicitarAntecipacaoPage;

    @PostConstruct
    private void loadLocators() {
        this.titleAntecipacaoAutomatica = page.locator("//*[text()='Antecipação automática']");
        this.slcFrequencia = page.locator("(//*[text()='Frequência'])[1]");
        this.slcDiaRecebimento = page.locator("//*[text()='Dia de recebimento']");
        this.titleDadosContratacao = page.locator("//*[text()='Dados da contratação']");
        this.labelDataContratacao = page.locator("//label[span[text()='Contratação']]/following-sibling::span");
    }

    private void selectFrequencia(String frequencia) {
        click(this.slcFrequencia);

        // Diária;Semanal;Quinzenal;Mensal
        if (frequencia.equalsIgnoreCase("Diária"))
            click(page.locator("(//*[text()='Diária'])[1]"));
        else
            click(page.locator("//*[text()='" + frequencia +  "']"));
    }

    private void selectDiaRecebimento(String frequencia, String diaRecebimento) {
        click(this.slcDiaRecebimento);

        switch (frequencia) {
            case "Diária":
                // Diário
                click(page.locator("(//*[text()='Diário'])[1]"));
                break;

            case "Semanal":
                // Segunda-feira;Terça-feira;Quarta-feira;Quinta-feira;Sexta-feira
                click(page.locator("(//*[text()='" + diaRecebimento + "'])[1]"));
                break;

            case "Quinzenal":
                // 1-15 até (crescente +1) 16-30
                click(page.locator("(//*[text()='" + diaRecebimento + "'])[1]"));
                break;

            case "Mensal":
                // 1 até (crescente +1) 31
                click(page.locator("(//div/span[text()='" + diaRecebimento + "'])[1]"));
                break;
        }
    }

    private void validarDataContratacao() {
        Date currentDate = new Date();
        Locale localePtBr = Locale.forLanguageTag("pt-BR");
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", localePtBr);

        String currentDateFormatted = formatter.format(currentDate);
        String labelDataContratacao = this.labelDataContratacao.textContent().trim();

        boolean verificacao = (currentDateFormatted.equalsIgnoreCase(labelDataContratacao));
        Assert.assertTrue(verificacao);
    }

    public void solicitarAntecipacaoAutomatica(
     String bandeiras
    ,String produtos
    ,String frequencia
    ,String diaRecebimento) {
        solicitarAntecipacaoPage.waitForLoadSolicitarAntecipacao();
        solicitarAntecipacaoPage.clickSolicitarAntecipacaoAutomatica();

        waitIsVisibleForSeconds(this.titleAntecipacaoAutomatica, Config.WAIT_5_SECONDS);

        solicitarAntecipacaoPage.selectBandeiras(bandeiras);
        solicitarAntecipacaoPage.selectProdutos(produtos);
        this.selectFrequencia(frequencia);
        this.selectDiaRecebimento(frequencia, diaRecebimento);

        solicitarAntecipacaoPage.clickSolicitarAntecipacao();
        solicitarAntecipacaoPage.waitForLoadingConfirmarSolicitacao();
        solicitarAntecipacaoPage.clickConfirmar();

        waitIsVisibleForSeconds(this.titleDadosContratacao, Config.WAIT_10_SECONDS);
        this.validarDataContratacao();
    }
}