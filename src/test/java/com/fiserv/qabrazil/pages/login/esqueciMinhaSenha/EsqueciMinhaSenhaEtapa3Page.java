package com.fiserv.qabrazil.pages.login.esqueciMinhaSenha;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class EsqueciMinhaSenhaEtapa3Page extends GeneralUtils {
    @Autowired
    private Page page; 

    private Locator title;
    private Locator txtSenha;
    private Locator txtConfirmarSenha;
    private Locator btnConfirmar;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[text()='Criar senha']");
        this.txtSenha = page.locator("(//*[contains(@id, 'Senha')])[1]");
        this.txtConfirmarSenha = page.locator("(//*[contains(@id, 'Senha')])[2]");
        this.btnConfirmar = page.locator("//*[text()='Confirmar']");
    }

    private void verificarEsqueciMinhaSenhaEtapa3() { waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS); }
    private void preencherSenha(String senha) { pressValue(this.txtSenha, senha); }
    private void preencherConfirmarSenha(String confirmarSenha) { pressValue(this.txtConfirmarSenha, confirmarSenha); }
    private void clickConfirmar() { click(this.btnConfirmar); }

    public void realizarEsqueciMinhaSenhaEtapa3(String senha) {
        this.verificarEsqueciMinhaSenhaEtapa3();
        this.preencherSenha(senha);
        this.preencherConfirmarSenha(senha);
        this.clickConfirmar();
    }
}