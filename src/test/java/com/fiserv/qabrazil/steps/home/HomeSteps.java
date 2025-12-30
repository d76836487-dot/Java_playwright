package com.fiserv.qabrazil.steps.home;

import com.fiserv.qabrazil.pages.home.*;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class HomeSteps {    @Autowired
    HomePage homePage;
 
    @When("acessar dashboard {string}")
    public void acessar_dashboard(String dashboard) {
        homePage.acessarDashboard(dashboard);
    }

    @And("verifica o texto do rodape")
    public void verifica_o_texto_do_rodape() {
        homePage.verificarTextoRodape();
    }

    @And("visualizo o dashboard na Home logada")
    public void visualizo_o_dashboard_na_Home_logada() {}

    @Then("valido que o dashboard {string} {string}")
    public void valido_que_o_dashboard(String dashboard, String visivel) {
        homePage.isVisibleDashboard(dashboard, visivel);
    }
}