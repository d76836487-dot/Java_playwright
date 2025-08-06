package com.fiserv.qabrazil.pages.login.primeiroAcesso;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class PrimeiroAcessoEtapa3Page extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
    private Locator txtSenha;
    private Locator txtConfirmarSenha;
    private Locator cbkTermosECondicoes;
    private Locator btnConfirmar;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[text()='Criar senha']");
        this.txtSenha = page.locator("(//*[contains(@id, 'Senha')])[1]");
        this.txtConfirmarSenha = page.locator("(//*[contains(@id, 'Senha')])[2]");
        this.cbkTermosECondicoes = page.locator("//*[contains(@type, 'checkbox')]");
        this.btnConfirmar = page.locator("//*[text()='Confirmar']");
    }

    private void verificarPrimeiroAcessoEtapa3() { waitIsVisibleForSeconds(this.title, Config.WAIT_LEVEL_1); }
    private void preencherSenha(String senha) { pressValue(this.txtSenha, senha); }
    private void preencherConfirmarSenha(String confirmarSenha) { pressValue(this.txtConfirmarSenha, confirmarSenha); }
    private void clickTermosCondicoes() { click(this.cbkTermosECondicoes); }
    private void clickConfirmar() { click(this.btnConfirmar); }

    public void realizarPrimeiroAcessoEtapa3(String senha) {
        this.verificarPrimeiroAcessoEtapa3();
        this.preencherSenha(senha);
        this.preencherConfirmarSenha(senha);
        this.clickTermosCondicoes();
        this.clickConfirmar();
    }
}