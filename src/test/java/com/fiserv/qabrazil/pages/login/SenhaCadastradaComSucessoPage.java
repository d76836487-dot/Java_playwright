package com.fiserv.qabrazil.pages.login;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class SenhaCadastradaComSucessoPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[text()='Senha cadastrada com sucesso']");
    }

    public void verificarSenhaCastradaComSucesso() { waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS); }
}