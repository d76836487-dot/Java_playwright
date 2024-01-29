package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.pages.LoginPage;
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

    @When("Usuário tenta logar na aplicacao")
    public void login() {
        loginPage.login();
    }

    @When("Usuário tenta logar na aplicacao em {string} com {string} e {string}")
    public void login(String url, String user, String pwd, Object ignoredDataTable) {
        loginPage.login(url, user, pwd);
    }

    @Then("Usuário estará com acesso")
    public void userHasAcessGranted() {
        boolean accessGranted = loginPage.userIsLogged();
        assertTrue(accessGranted);
    }

    @When("Usuário tenta logar na aplicacao com {string} e {string}")
    public void userTriesToLoginWith(String login, String password) {
        loginPage.login(config.getUrl(), login, password);
    }

    @Given("Usuário logou na aplicacao")
    public void userHasLoggedIn() {
        login();
        userHasAcessGranted();
    }

    @Then("Usuário será direcionado para tela de login")
    public void userIsAtLoginScreen() {
        loginPage.reload();
        boolean accessGranted = loginPage.userIsLogged();
        assertFalse(accessGranted);
    }

    @When("Usuário loga em outra sessão")
    public void userLogsAnotherSession() {
        loginPage.loginAnotherSession();
    }
}
