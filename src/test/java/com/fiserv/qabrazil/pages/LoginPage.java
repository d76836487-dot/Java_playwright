package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.automation.playwright.configuration.StorageState;
import com.fiserv.qabrazil.config.ContractConfig;
import com.microsoft.playwright.*;
import com.microsoft.playwright.options.AriaRole;
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

    public boolean pageHasImageWith(String contract) {
        Pattern pattern = Pattern.compile(String.format(".*%s", contract));
        System.out.println(page.getByTestId("header-brand-img"));
        page.getByTestId("header-brand-img").evaluate("elm => elm.parentNode.innerHTML");
        assertThat(page.getByTestId("header-brand-img"))
                .hasAttribute("src", pattern);

        return page.getByTestId("header-brand-img").isVisible();
    }

    public synchronized void login() {
        if (StorageState.stateIsReady()) {
            goTo(StorageState.loggedUrl);
        } else {
            login(contractConfig.getUrl(), contractConfig.getUser(), contractConfig.getPassword());
        }
        startMonitoringRequests(page, contractConfig);
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
    }

    public synchronized boolean userIsLogged() {
        boolean isLogged = waitUntilTrue(() ->
                page.getByRole(AriaRole.LINK, new Page.GetByRoleOptions().setName("Sair")).first().isVisible());
        saveStorageState();
        return isLogged;
    }

    private void saveStorageState() {
        if (StorageState.stateIsReady()) return;

        StorageState.storageState = browserContext.storageState();
        StorageState.loggedUrl = page.url();
    }

    public void loginAnotherSession() throws Exception {
        Page swipePage = page;
        try (BrowserContext newBrowserContext = browser.newContext();
             Page newPage = newBrowserContext.newPage()) {
            page = newPage;
            login(contractConfig.getUrl(), contractConfig.getUser(), contractConfig.getPassword());
            if (!userIsLogged()) {
                throw new Exception("Não foi possível logar em outra sessão.");
            }
        }
        page = swipePage;
    }

    public void clickOnForgotMyPasswordButton() {
        page.getByText("Esqueci minha senha").click();
        page.waitForURL(Pattern.compile("^.*/EsqueceuSenha$"));
    }
}
