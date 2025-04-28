package com.fiserv.qabrazil.steps.home;

import com.fiserv.qabrazil.pages.home.*;
import io.cucumber.java.en.And;
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
}