package com.fiserv.qabrazil.pages.login;

import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.automation.mfa.MfaGenerator;
import com.fiserv.automation.playwright.configuration.StorageState;
import com.fiserv.qabrazil.components.HeaderComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.microsoft.playwright.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

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

    public boolean pageHasImageWith(String contract) {
        Pattern pattern = Pattern.compile(String.format(".*%s", contract));
        System.out.println(page.getByTestId("header-brand-img"));
        page.getByTestId("header-brand-img").evaluate("elm => elm.parentNode.innerHTML");
        assertThat(page.getByTestId("header-brand-img"))
                .hasAttribute("src", pattern);

        return page.getByTestId("header-brand-img").isVisible();
    }

    public void forceNewLogin() {
        storageState.clearState();
        loginWithOneRetry();
    }

    public synchronized void loginAndGetHomeReady() {
        loginWithOneRetry();

        selectECOrDtcoPage.selectAllDocumentsIfAvailable();
        startMonitoringRequests(page, contractConfig);
        headerComponent.selectShowValuesButton(true);
        closeAllPopups();
    }

    public synchronized void loginWithOneRetry() {
        if (storageState.stateIsReady() && apiUserDetailsService.tokenIsStillValid()) {
            navigateTo(storageState.getLoggedUrl());
        } else {
            login(contractConfig.getActiveUserProfile().url(), contractConfig.getActiveUserProfile().user(), contractConfig.getActiveUserProfile().password());
        }

        if (notLoggedAtAll()) {
            log.info("Logging não funcionou. Reiniciando e tentando novamente");
            login(contractConfig.getActiveUserProfile().url(), contractConfig.getActiveUserProfile().user(), contractConfig.getActiveUserProfile().password());
        }
    }

    private boolean notLoggedAtAll() {
        PageField buttonSelectEstablishment = pageField.from("Trocar Estabelecimento - Botão selecionar por Documento");

        return !waitUntilTrue(() -> page.getByTestId("head-sair").isVisible() || buttonSelectEstablishment.elementIsVisibleRightNow());
    }

    public void loginAndStartMonitoringRequests(String url, String user, String pwd) {
        login(url, user, pwd);
        startMonitoringRequests(page, contractConfig);
    }


    public void applicationlogin(String url, String user, String pwd) {
        navigateTo(url);
        page.getByTestId("login").pressSequentially(user);
        page.getByTestId("password").fill(pwd);
        page.getByTestId("entrar").click();
    }
    public void login(String url, String user, String pwd) {
        navigateTo(url);
        page.getByTestId("login").pressSequentially(user);
        page.getByTestId("password").fill(pwd);
        page.getByTestId("entrar").click();

        if (hasMfa()) {
            List<Locator> inputs = pageField.from("Login - Campo Token MFA").getLocator().locator("input").all();
            String token = mfaGenerator.getToken();
            for (int i = 0; i < token.length(); i++) {
                inputs.get(i).pressSequentially("" + token.charAt(i));
            }
            pageField.from("Login - Botão Confirmar Token MFA").click();
        }

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
}
