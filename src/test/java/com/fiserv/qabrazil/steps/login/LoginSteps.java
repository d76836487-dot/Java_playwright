package com.fiserv.qabrazil.steps.login;

import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.pages.login.LoginPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertFalse;
import static org.testng.AssertJUnit.assertTrue;

public class LoginSteps {
    @Autowired
    LoginPage loginPage;

    @Autowired
    ContractConfig config;

    @When("Usuário tenta logar na aplicação")
    public void login() {
        loginPage.login();
    }

    @When("Usuário tenta logar na aplicação em {string} com {string} e {string}")
    public void login(String url, String user, String pwd, Object ignoredDataTable) {
        loginPage.login(url, user, pwd);
    }

    @Given("Usuário acessou com sucesso")
    @Then("Usuário estará com acesso")
    public void userHasAccessGranted() {
        boolean accessGranted = loginPage.userIsLogged();
        assertTrue(accessGranted);
    }

    @When("Usuário tenta logar na aplicação com {string} e {string}")
    public void userTriesToLoginWith(String login, String password) {
        loginPage.login(config.getUrl(), login, password);
    }

    @Given("Usuário logou na aplicação")
    public void userHasLoggedIn() {
        login();
        userHasAccessGranted();
    }

    @Then("Usuário será direcionado para tela de login")
    public void userIsAtLoginScreen() {
        loginPage.reload();
        boolean accessGranted = loginPage.userIsLogged();
        assertFalse(accessGranted);
    }

    @When("Usuário loga em outra sessão")
    public void userLogsAnotherSession() throws Exception {
        loginPage.loginAnotherSession();
    }

    @When("Usuário loga com senha errada")
    public void userLogsInWithWrongPassword() {
        loginPage.loginAndStartMonitoringRequests(config.getUrl(), config.getUser(), "senhaerrada");
    }

    @Given("Usuário clicou no botão esqueci minha senha")
    public void userClickedForgotMyPasswordButton() {
        loginPage.clickOnForgotMyPasswordButton();
    }
}
