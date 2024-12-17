package com.fiserv.qabrazil.pages.login;

import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.automation.mfa.MfaGenerator;
import com.fiserv.automation.playwright.configuration.StorageState;
import com.fiserv.qabrazil.components.HeaderComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Browser;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.testng.Assert;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class LoginPage extends BasePage {
    private static final Logger log = LoggerFactory.getLogger(LoginPage.class);

    @Autowired
    ContractConfig contractConfig;

    @Autowired
    BrowserContext browserContext;

    @Autowired
    Browser browser;

    @Autowired
    HeaderComponent headerComponent;

    @Autowired
    private StorageState storageState;

    @Autowired
    private SelectECOrDtcoPage selectECOrDtcoPage;

    @Autowired
    MfaGenerator mfaGenerator;

    @Autowired
    private ApiUserDetailsService apiUserDetailsService;


    @Autowired
    private CommonsPage commonsPage;


    public void openBrowser(String arg0){
        page.navigate(arg0);
        //DriverFactory.openBrowser(arg0);
    }

    public boolean pageHasImageWith(String contract) {
        Pattern pattern = Pattern.compile(String.format(".*%s", contract));
        System.out.println(page.getByTestId("header-brand-img"));
        page.getByTestId("header-brand-img").evaluate("elm => elm.parentNode.innerHTML");
        assertThat(page.getByTestId("header-brand-img"))
                .hasAttribute("src", pattern);

        return page.getByTestId("header-brand-img").isVisible();
    }

    public void forceNewLogin() throws InterruptedException {
        storageState.clearState();
        loginWithOneRetry("");
    }

    public synchronized void loginAndGetHomeReady() throws InterruptedException {
        //loginWithOneRetry("");

        //selectECOrDtcoPage.selectAllDocumentsIfAvailable();
        //startMonitoringRequests(page, contractConfig);
        //headerComponent.selectShowValuesButton(true);
        //closeAllPopups();

        loginHHomeReady();
    }
    public synchronized void loginHHomeReady() throws InterruptedException {

        //loginWithOneRetry("");

        selectECOrDtcoPage.checkModalAutomaticIsOpen();
        //startMonitoringRequests(page, contractConfig);
        //headerComponent.selectShowValuesButton(true);
        closeAllPopups();
    }

    public synchronized void newLogin(String url, String user, String pwd) throws InterruptedException {
        if(url.isEmpty() && user.isEmpty() && pwd.isEmpty()) {
            loginWithOneRetry("");
        }else {
           login(url, user, pwd);
        }
        Thread.sleep(5000);
        selectECOrDtcoPage.checkModalAutomaticIsOpen();
        closeAllPopups();
    }


    public synchronized void loginWithOneRetry(String url) throws InterruptedException {
        String URL="";

        if(url.isEmpty()){
         URL= contractConfig.getActiveUserProfile().url();
        }else{
            URL = url;
        }

        if (storageState.stateIsReady() && apiUserDetailsService.tokenIsStillValid()) {
            navigateTo(storageState.getLoggedUrl());
        } else {
            login(URL, contractConfig.getActiveUserProfile().user(), contractConfig.getActiveUserProfile().password());
        }

       /* if (notLoggedAtAll()) {
            log.info("Logging não funcionou. Reiniciando e tentando novamente");
            login(contractConfig.getActiveUserProfile().url(), contractConfig.getActiveUserProfile().user(), contractConfig.getActiveUserProfile().password());
        }*/
    }

    private boolean notLoggedAtAll() {
        PageField buttonSelectEstablishment = pageField.from("Trocar Estabelecimento - Botão selecionar por Documento");

        return !waitUntilTrue(() -> page.getByTestId("head-sair").isVisible() || buttonSelectEstablishment.elementIsVisibleRightNow());
    }

    public void loginAndStartMonitoringRequests(String url, String user, String pwd) throws InterruptedException {
        login(url, user, pwd);
        startMonitoringRequests(page, contractConfig);
    }


    public void applicationlogin(String url, String user, String pwd) {
        navigateTo(url);
        page.getByTestId("login").pressSequentially(user);
        page.getByTestId("password").fill(pwd);
        page.getByTestId("entrar").click();
    }
    public void login(String url, String user, String pwd) throws InterruptedException {
        navigateTo(url);
        page.getByTestId("login").pressSequentially(user);
        page.getByTestId("password").fill(pwd);
        page.getByTestId("entrar").click();

        /*if (hasMfa()) {
            List<Locator> inputs = pageField.from("Login - Campo Token MFA").getLocator().locator("input").all();
            String token = mfaGenerator.getToken();
            for (int i = 0; i < token.length(); i++) {
                inputs.get(i).pressSequentially("" + token.charAt(i));
            }
            pageField.from("Login - Botão Confirmar Token MFA").click();
        }*/

      //  Thread.sleep(4000);



       /* boolean gotSomething = waitUntilTrue(6, () ->
                page.locator("//*[contains(text(), 'Não foi possível acessar o canal neste momento. Tente novamente mais tarde.')]").count() == 1);

        if (!gotSomething) {
            throw new RuntimeException("Ambiente offline");
        }*/

       storageState.clearState();
    }

    private boolean hasMfa() {
        return pageField.from("Login - Campo Token MFA").elementIsVisible();
    }

    public boolean userIsLogged() {
        return waitUntilTrue(() -> page.getByTestId("head-sair").isVisible());
    }

    public void saveStorageState() {
        storageState.init(browserContext.storageState(), page.url());
    }

    public void loginAnotherSession() throws Exception {
        Page swipePage = page;
        try (BrowserContext newBrowserContext = browser.newContext();
            Page newPage = newBrowserContext.newPage()) {
            page = newPage;
            login(contractConfig.getActiveUserProfile().url(), contractConfig.getActiveUserProfile().user(), contractConfig.getActiveUserProfile().password());
            if (!userIsLogged()) {
                throw new Exception("Não foi possível logar em outra sessão.");
            }
        }
        page = swipePage;
        storageState.clearState();
    }

    public void clickOnForgotMyPasswordButton() {
        page.getByText("Esqueci minha senha").click();
        page.waitForURL(Pattern.compile("^.*/EsqueceuSenha$"));
    }

    public void logonportal(String arg0, String arg1) throws InterruptedException, IOException {
        Config.acessLogonCount =0;
        String Ret ="";

        page.locator("data-testid=login").type(arg0);
        page.locator("data-testid=password").type(arg1);
        page.locator("data-testid=entrar").click();

        for (int i = 0; i < 1200; i++) {
            Config.acessLogonCount +=1;
             Ret = commonsPage.retryLogin();
            if (Ret.equals("S")) {
                break;
            }
        }

        System.out.println(Config.acessLogonCount);
        if (Ret.equals("")) {
            Config.errorLogonCount +=1;
            /*
            FileWriter arq = new FileWriter("C:\\eveidencia\\error.txt");
            PrintWriter gravarArq = new PrintWriter(arq);
            gravarArq.printf("Resultado " + Config.errorLogonCount);
            arq.close();
            */
            Assert.fail();
        }

        // - 2FA
        if(Config.Totp.equals("YES")) {

            page.locator("data-testid=login-nome-dispositivo-0").click();
            /* page.navigate("https://totp.app/");*/


            if (hasMfa()) {
                List<Locator> inputs = pageField.from("Login - Campo Token MFA").getLocator().locator("input").all();
                String token = mfaGenerator.getToken();
                for (int i = 0; i < token.length(); i++) {
                    inputs.get(i).pressSequentially("" + token.charAt(i));
                }
                pageField.from("Login - Botão Confirmar Token MFA").click();
            }

     boolean gotSomething = waitUntilTrue(6, () -> page.locator("//*[contains(text(), 'Não foi possível acessar o canal neste momento. Tente novamente mais tarde.')]").count() == 1);
            if (gotSomething) {
                throw new RuntimeException("Ambiente offline");
            }
        }



Thread.sleep(3000);
        if (Ret.equals("S")) {
            for (int i = 0; i < 500; i++) {
                if (page.getByText("Personalize sua visualização").isVisible()) {
                    selectECOrDtcoPage.checkModalAutomaticIsOpen();
                    break;
                }
            }
        }

        //Contador de Sucesso
        if(page.getByText("Acesso rápido").isVisible()){
            Config.sucessLogonCount +=1;
            /*
            FileWriter arq = new FileWriter("C:\\eveidencia\\sucess.txt");
            PrintWriter gravarArq = new PrintWriter(arq);
            gravarArq.printf("Resultado " + Config.sucessLogonCount);
            arq.close();
            */
        }

    }

    public void usuárioClicaNoMenuAjuda() {
        page.navigate(Config.url  + "/Ajuda");

    }

    public void logonportalEasy(String arg0, String arg1) throws InterruptedException, IOException {
        Config.acessLogonCount = 0;
        String Ret = "";

        page.locator("id=b2-b2-b4-InputMask").type(arg0);
        page.locator("id=b2-b2-Input_Password").type(arg1);
        page.locator("data-testid=entrar").click();
    }

    // |INÍCIO| - Refatoração do Login
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
                url = Config.bin_url;
                user = Config.bin_user;
                pass = Config.bin_pass;
                break;
            case "sicredi":
                url = Config.sicredi_url;
                user = Config.sicredi_user;
                pass = Config.sicredi_pass;
                break;
            case "azulzinha":
                url = Config.azulzinha_url;
                user = Config.azulzinhaz_user;
                pass = Config.azulzinha_pass;
                break;
            case "afinz":
                url = Config.afinz_url;
                user = Config.afinz_user;
                pass = Config.afinzi_pass;
                break;
        }
        Config.url = url;

        page.navigate(url);
        this.realizarLogin(user, pass);
    }

    public void verificarLogin() {
        assertThat(title).isVisible();
    }

    public void preencherLogin(String login) { GeneralUtils.pressDigit(page, this.txtLogin, login); }

    public void preencherPassword(String password) { this.txtPassword.fill(password); }

    public void clickEntrar() { this.btnEntar.click(); }

    public void realizarLogin(String user, String pass) {
        this.verificarLogin();
        this.preencherLogin(user);
        this.preencherPassword(pass);
        this.clickEntrar();
    }
    // |FIM| - Refatoração do Login
}