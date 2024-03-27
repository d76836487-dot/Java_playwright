package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.AccessManagementPage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.login.LoginPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class AccessManagementSteps extends BaseSteps {

    @Autowired
    LoginPage loginPage;

    @Autowired
    AccessManagementPage accessManagementPage;

    @Given("usuário Master está logado no Portal do Cliente")
    public void masterIsLoggedIn() {
        if (!loginPage.userIsLogged()) {
            loginPage.forceNewLogin();
            loginPage.userIsLogged();
        }
    }

    @When("usuário clica em \"Gestão de Acessos\" no menu lateral esquerdo")
    public void userClicksAccessManagementOnSideMenu() {
        PageField field = pageField.from("Menu Lateral - Gestão de Acessos");
        field.click();
    }

    @Then("visualizará abas de Usuários e Convites pendentes")
    public void userWillSeeUserTabAndPendingInvitesTab() {
        accessManagementPage.ensureUserTabIsVisible();
        accessManagementPage.ensurePendingInvitesIsVisible();
    }

    @Then("visualizará campo Busca por usuário ou nome")
    public void userWillSeeSearchField() {
        accessManagementPage.ensureSearchFieldIsVisible();
    }

    @Then("visualizará botão Convidar novo usuário")
    public void userWillSeeInviteNewUserButton() {
        accessManagementPage.ensureInviteNewUserButtonIsVisible();
    }
}
