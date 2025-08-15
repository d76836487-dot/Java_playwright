package com.fiserv.qabrazil.pages.login.esqueciMinhaSenha;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.login.LoginPage;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class EsqueciMinhaSenhaEtapa1Page extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
    private Locator txtUsuario;
    private Locator btnContinuar;

    @Autowired
    LoginPage loginPage;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[text()='Redefinir senha']");
        this.txtUsuario = page.locator("//*[contains(@placeholder, 'Usuário')]");
        this.btnContinuar = page.locator("//*[text()='Continuar']");
    }

    private void verificarEsqueciMinhaSenhaEtapa1() { waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS); }
    private void preencherUsuario(String usuario) { pressValue(this.txtUsuario, usuario); }
    private void clickContinuar() { click(this.btnContinuar); }

    public void realizarEsqueciMinhaSenhaEtapa1(String usuario) {
        loginPage.clickEsqueciMinhaSenha();

        this.verificarEsqueciMinhaSenhaEtapa1();
        this.preencherUsuario(usuario);
        this.clickContinuar();
    }
}