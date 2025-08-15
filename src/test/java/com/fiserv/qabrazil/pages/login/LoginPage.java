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
    private Locator linkEsqueciMinhaSenha;
    private Locator btnEntar;
    private Locator btnPrimeiroAcesso;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[text()='Acesse sua conta']");
        this.txtLogin = page.locator("//*[@data-testid='login']");
        this.txtPassword = page.locator("//*[@data-testid='password']");
        this.linkEsqueciMinhaSenha = page.locator("//*[text()='Esqueci minha senha']");
        this.btnEntar = page.locator("//*[@data-testid='entrar']");
        this.btnPrimeiroAcesso = page.locator("//*[text()='Primeiro acesso']");
    }

    public void verificarLogin() { waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS); }

    public void acessarPortal(String alianca) {
        String url = getPerfilAcesso(alianca).getUrlPortal();
        page.navigate(url);
        this.verificarLogin();
    }

    public void acessarLoginPortal(String alianca) {
        String url = getPerfilAcesso(alianca).getUrlPortal();
        String user = getPerfilAcesso(alianca).getUsuario();
        String pass = getPerfilAcesso(alianca).getSenha();

        page.navigate(url);
        this.realizarLogin(user, pass);
    }

    private void preencherLogin(String login) { pressValue(this.txtLogin, login); }
    private void preencherPassword(String password) { pressValue(this.txtPassword, password); }
    public void clickEsqueciMinhaSenha() { click(this.linkEsqueciMinhaSenha); }
    private void clickEntrar() { click(this.btnEntar); }
    public void clickPrimeiroAcesso() { click(this.btnPrimeiroAcesso); }

    public void realizarLogin(String user, String pass) {
        this.verificarLogin();
        this.preencherLogin(user);
        this.preencherPassword(pass);
        this.clickEntrar();
    }
}