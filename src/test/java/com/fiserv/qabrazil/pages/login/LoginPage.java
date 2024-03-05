package com.fiserv.qabrazil.pages.login;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.automation.playwright.configuration.StorageState;
import com.fiserv.qabrazil.components.HeaderComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.microsoft.playwright.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class LoginPage extends BasePage {
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

    public boolean pageHasImageWith(String contract) {
        Pattern pattern = Pattern.compile(String.format(".*%s", contract));
        System.out.println(page.getByTestId("header-brand-img"));
        page.getByTestId("header-brand-img").evaluate("elm => elm.parentNode.innerHTML");
        assertThat(page.getByTestId("header-brand-img"))
                .hasAttribute("src", pattern);

        return page.getByTestId("header-brand-img").isVisible();
    }

    public synchronized void login() {
        if (storageState.stateIsReady()) {
            goTo(storageState.getLoggedUrl());
        } else {
            login(contractConfig.getActiveUserProfile().url(), contractConfig.getActiveUserProfile().user(), contractConfig.getActiveUserProfile().password());
        }
        selectECOrDtcoPage.selectAllDocumentsIfAvailable();
        startMonitoringRequests(page, contractConfig);
        headerComponent.selectShowValuesButton(true);
    }

    public void forceNewLogin() {
        login(contractConfig.getActiveUserProfile().url(), contractConfig.getActiveUserProfile().user(), contractConfig.getActiveUserProfile().password());
    }

    public void loginAndStartMonitoringRequests(String url, String user, String pwd) {
        login(url, user, pwd);
        startMonitoringRequests(page, contractConfig);
    }

    public void login(String url, String user, String pwd) {
        goTo(url);
        page.getByTestId("login").pressSequentially(user);
        page.getByTestId("password").fill(pwd);
        page.getByTestId("entrar").click();

        storageState.clearState();
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
