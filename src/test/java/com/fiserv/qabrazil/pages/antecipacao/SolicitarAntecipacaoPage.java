package com.fiserv.qabrazil.pages.antecipacao;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class SolicitarAntecipacaoPage extends GeneralUtils {
    @Autowired
    private Page page; 

    private Locator titleSolicitarAntecipacao;
    private Locator btnSolicitarAtencipacaoAutomatica;
    private Locator btnSolicitarAtencipacaoEventual;

    // Campos em comum
    private Locator slcBandeiras;
    private Locator btnSolicitarAntecipacao;
    private Locator titleConfirmarSolicitacao;
    private Locator btnConfirmar;

    @PostConstruct
    private void loadLocators() {
        this.titleSolicitarAntecipacao = page.locator("//*[contains(text(), 'para antecipação')]");
        this.btnSolicitarAtencipacaoAutomatica = page.locator("//*[text()='Solicitar antecipação automática']");
        this.btnSolicitarAtencipacaoEventual = page.locator("//*[text()='Solicitar antecipação eventual']");

        // Campos em comum
        this.slcBandeiras = page.locator("//*[text()='Bandeiras']");
        this.btnSolicitarAntecipacao = page.locator("//*[text()='Solicitar antecipação']");
        this.titleConfirmarSolicitacao = page.locator("//*[text()='Deseja confirmar a solicitação de antecipação?']");
        this.btnConfirmar = page.locator("//*[text()='Confirmar']");
    }

    public void waitForLoadSolicitarAntecipacao() {
        waitForSeconds(Config.WAIT_10_SECONDS);
        waitIsVisibleForSeconds(this.titleSolicitarAntecipacao, Config.WAIT_5_SECONDS);
    }

    public void clickSolicitarAntecipacaoAutomatica() { click(this.btnSolicitarAtencipacaoAutomatica); }

    public void clickSolicitarAntecipacaoEventual() { click(this.btnSolicitarAtencipacaoEventual); }

    // Campos em comum
    private void clearBandeiras() {
        // remover seleção de todas as bandeiras
        String[] listaBandeiras = "MasterCard;Visa;Amex;Cabal;Hiper;ELO".split(";");
        for (String item : listaBandeiras)
            page.locator("//*[text()='" + item + "']/preceding-sibling::*/input[@type='checkbox']").click();
    }

    public void selectBandeiras(String bandeira) {
        this.slcBandeiras.scrollIntoViewIfNeeded();
        this.slcBandeiras.hover();
        for (int i = 1; i < 3; i++)
            page.locator("//*[text()='Visa']/preceding-sibling::*/input[@type='checkbox']").click();

        this.slcBandeiras.hover();
        this.clearBandeiras();

        this.slcBandeiras.hover();
        String[] listaBandeiras = bandeira.split(";");
        for (String item : listaBandeiras)
            page.locator("//*[text()='" + item + "']/preceding-sibling::*/input[@type='checkbox']").click();
    }

    public void selectProdutos(String produto) {
        click(page.locator("//*[text()='Produtos']"));
        // Todos;Crédito à vista;Crédito Parcelado
        click(page.locator("(//span[text()='" + produto + "'])[1]"));
    }

    public void clickSolicitarAntecipacao() { click(this.btnSolicitarAntecipacao); }

    public void waitForLoadingConfirmarSolicitacao() {
        waitIsVisibleForSeconds(this.titleConfirmarSolicitacao, Config.WAIT_5_SECONDS);
    }

    public void clickConfirmar() { click(this.btnConfirmar); }
}