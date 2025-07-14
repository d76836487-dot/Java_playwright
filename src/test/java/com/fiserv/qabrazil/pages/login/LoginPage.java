package com.fiserv.qabrazil.pages.login;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class LoginPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
    private Locator txtLogin;
    private Locator txtPassword;
    private Locator btnEntar;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[text()='Acesse sua conta']");
        this.txtLogin = page.locator("//*[@data-testid='login']");
        this.txtPassword = page.locator("//*[@data-testid='password']");
        this.btnEntar = page.locator("//*[@data-testid='entrar']");
    }

    public void acessarLoginPortal(String alianca) {
        String url = getPerfilAcesso(alianca).getUrlPortal();
        String user = getPerfilAcesso(alianca).getUsuario();
        String pass = getPerfilAcesso(alianca).getSenha();

        page.navigate(url);
        waitForLoad(page, true, true, true);
        this.realizarLogin(user, pass);
    }

    public void verificarLogin() { waitIsVisibleForSeconds(this.title, Config.WAIT_LEVEL_1); }
    public void preencherLogin(String login) { fillDigits(page, this.txtLogin, login); }
    public void preencherPassword(String password) { fillValue(this.txtPassword, password); }
    public void clickEntrar() { click(this.btnEntar); }

    public void realizarLogin(String user, String pass) {
        this.verificarLogin();
        this.preencherLogin(user);
        this.preencherPassword(pass);
        this.clickEntrar();
    }
}