package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.exclusaoContaPage;
import com.fiserv.qabrazil.pages.login.LoginPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class exclusaoContaSteps {

    @Autowired
    LoginPage loginPage;

     @Autowired
     exclusaoContaPage exclusaoContapage;

    @Given("que o usuário esteja logado {string} {string} {string}")
    public void que_o_usuário_esteja_logado(String User, String Pass, String Env) {
        loginPage.applicationlogin(Env,User,Pass);
    }

    @When("clicar no Meu perfil no cabeçalho")
    public void clicar_no_meu_perfil_no_cabeçalho() {
        exclusaoContapage.clicar_no_meu_perfil_no_cabecalho();
    }

    @Then("waiting")
    public void waiting() throws InterruptedException {
        Thread.sleep(1000);



    }

}