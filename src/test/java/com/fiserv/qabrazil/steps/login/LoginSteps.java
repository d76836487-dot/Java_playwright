package com.fiserv.qabrazil.steps.login;



import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.login.LoginPage;


import com.fiserv.qabrazil.util.Config;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

import static org.testng.AssertJUnit.assertFalse;
import static org.testng.AssertJUnit.assertTrue;

public class LoginSteps extends BasePage {
    @Autowired
    LoginPage loginPage;

    @Autowired
    ContractConfig contractConfig;


    @Given("open portal {string} and logon")
    public void openPortalAnd(String arg0) throws Throwable {
       String url=null;
        String user=null;
        String pass=null;

        if(arg0.equals("sicredi")){
            url = Config.sicredi_url;
            user = Config.sicredi_user;
            pass = Config.sicredi_pass;
        }

        if(arg0.equals("afinz")){
            url = Config.afinz_url;
            user = Config.afinz_user;
            pass = Config.afinzi_pass;
        }
        if(arg0.equals("azulzinha")){
            url = Config.azulzinha_url;
            user = Config.azulzinhaz_user;
            pass = Config.azulzinha_pass;
        }
        if(arg0.equals("bin")){
            url = Config.bin_url;
            user = Config.bin_user;
            pass = Config.bin_pass;
        }
        loginPage.openBrowser(url);

        loginPage.logonportal(user,pass);

        Thread.sleep(1000);
    }



    @Given("Usuário efetue logon")
    public void usuário_efetue_logon() {
        // Write code here that turns the phrase above into concrete actions
        loginPage.applicationlogin(contractConfig.getActiveUserProfile().url(), contractConfig.getActiveUserProfile().user(), contractConfig.getActiveUserProfile().password());

    }




    @When("Usuário loga na aplicação")
    public void login() throws InterruptedException {
        loginPage.loginAndGetHomeReady();
    }

    @Given("Usuário efetue logon no portal do cliente {string} {string} {string}")
    public void usuário_efetue_logon_no_portal_EC(String url,String user,String pass) throws InterruptedException, IOException {
       // loginPage.loginAndGetHomeReady();
       // loginPage.newLogin(url,user,pass);
        loginPage.logonportal(user,pass);
        loginPage.loginAndGetHomeReady();

    }


    @When("Usuário tenta logar na aplicação em \"([^\"]*)\" com \"([^\"]*)\" e \"([^\"]*)\"$")
    public void login(String url, String user, String pwd, Object ignoredDataTable) throws InterruptedException {
        loginPage.login(url, user, pwd);
    }

    @Given("Usuário acessou com sucesso")
    @Then("Usuário estará com acesso e sessão foi salva")
    public void userHasAccessGranted() {
        boolean accessGranted = loginPage.userIsLogged();
        if (accessGranted) {
            loginPage.saveStorageState();
        }
        assertTrue(accessGranted);
    }

    @When("Usuário tenta logar na aplicação com \"([^\"]*)\" e \"([^\"]*)\"")
    public void userTriesToLoginWith(String login, String password) throws InterruptedException {
        loginPage.login(contractConfig.getActiveUserProfile().url(), login, password);
    }

    @Given("Usuário logou na aplicação, selecionou todos os documentos e salvou sessão")
    public void userHasLoggedIn() throws InterruptedException {
        login();
        userHasAccessGranted();
    }

    @Then("Usuário será direcionado para tela de login")
    public void userIsAtLoginScreen() {
        loginPage.reload();
        boolean accessGranted = loginPage.userIsLogged();
        if (accessGranted) {
            loginPage.saveStorageState();
        }
        assertFalse(accessGranted);
    }

    @When("Usuário loga em outra sessão")
    public void userLogsAnotherSession() throws Exception {
        loginPage.loginAnotherSession();
    }

    @When("Usuário loga com senha errada")
    public void userLogsInWithWrongPassword() throws InterruptedException {
        loginPage.loginAndStartMonitoringRequests(contractConfig.getActiveUserProfile().url(), contractConfig.getActiveUserProfile().user(), "senhaerrada");
    }

    @Given("Usuário clicou no botão esqueci minha senha")
    public void userClickedForgotMyPasswordButton() {
        loginPage.clickOnForgotMyPasswordButton();
    }


    @When("usuário clica no Menu Ajuda")
    public void usuárioClicaNoMenuAjuda() {
        loginPage.usuárioClicaNoMenuAjuda();
    }
}
