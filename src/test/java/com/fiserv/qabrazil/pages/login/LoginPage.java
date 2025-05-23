package com.fiserv.qabrazil.pages.login;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.enums.PerfilAcessoEnum;
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
        String url = "";
        String user = "";
        String pass = "";

        switch (alianca) {
            case "bin":
                url = PerfilAcessoEnum.BIN.getUrlPortal();
                user = PerfilAcessoEnum.BIN.getUsuario();
                pass = PerfilAcessoEnum.BIN.getSenha();
                break;

            case "sicredi":
                url = PerfilAcessoEnum.SICREDI.getUrlPortal();
                user = PerfilAcessoEnum.SICREDI.getUsuario();
                pass = PerfilAcessoEnum.SICREDI.getSenha();
                break;

            case "azulzinha":
                url = PerfilAcessoEnum.AZULZINHA.getUrlPortal();
                user = PerfilAcessoEnum.AZULZINHA.getUsuario();
                pass = PerfilAcessoEnum.AZULZINHA.getSenha();
                break;

            case "afinz":
                url = PerfilAcessoEnum.AFINZ.getUrlPortal();
                user = PerfilAcessoEnum.AFINZ.getUsuario();
                pass = PerfilAcessoEnum.AFINZ.getSenha();
                break;

            case "claropay":
                url = PerfilAcessoEnum.CLAROPAY.getUrlPortal();
                user = PerfilAcessoEnum.CLAROPAY.getUsuario();
                pass = PerfilAcessoEnum.CLAROPAY.getSenha();
                break;

            case "binCedidos":
                url = PerfilAcessoEnum.BIN_CEDIDOS.getUrlPortal();
                user = PerfilAcessoEnum.BIN_CEDIDOS.getUsuario();
                pass = PerfilAcessoEnum.BIN_CEDIDOS.getSenha();
                break;

            case "sicrediCedidos":
                url = PerfilAcessoEnum.SICREDI_CEDIDOS.getUrlPortal();
                user = PerfilAcessoEnum.SICREDI_CEDIDOS.getUsuario();
                pass = PerfilAcessoEnum.SICREDI_CEDIDOS.getSenha();
                break;

            case "azulzinhaCedidos":
                url = PerfilAcessoEnum.AZULZINHA_CEDIDOS.getUrlPortal();
                user = PerfilAcessoEnum.AZULZINHA_CEDIDOS.getUsuario();
                pass = PerfilAcessoEnum.AZULZINHA_CEDIDOS.getSenha();
                break;

            case "afinzCedidos":
                url = PerfilAcessoEnum.AFINZ_CEDIDOS.getUrlPortal();
                user = PerfilAcessoEnum.AFINZ_CEDIDOS.getUsuario();
                pass = PerfilAcessoEnum.AFINZ_CEDIDOS.getSenha();
                break;

            case "claropayCedidos":
                url = PerfilAcessoEnum.CLAROPAY_CEDIDOS.getUrlPortal();
                user = PerfilAcessoEnum.CLAROPAY_CEDIDOS.getUsuario();
                pass = PerfilAcessoEnum.CLAROPAY_CEDIDOS.getSenha();
                break;
        }

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