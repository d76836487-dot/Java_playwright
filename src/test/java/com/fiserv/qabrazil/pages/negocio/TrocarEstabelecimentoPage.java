package com.fiserv.qabrazil.pages.negocio;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class TrocarEstabelecimentoPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
    private Locator rbEC;
    private Locator btnSelecionar;
 
    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[text()='Selecionar Estabelecimento comercial']");
        this.rbEC = page.locator("(//*[contains(@data-testid, 'radio-button-ec-')])[1]");
        this.btnSelecionar = page.locator("//*[@data-testid='negocio-selecionar-estabelecimento']");
    }

    private void verificarTrocarEstabelecimento() { waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS); }

    private void clickPrimeiroEC() { click(this.rbEC); }

    private void clickSelecionar() { click(this.btnSelecionar); }

    public void realizarTrocaEstabelecimento() {
        this.verificarTrocarEstabelecimento();
        this.clickPrimeiroEC();
        this.clickSelecionar();
        waitForSeconds(Config.WAIT_5_SECONDS);
    }
}