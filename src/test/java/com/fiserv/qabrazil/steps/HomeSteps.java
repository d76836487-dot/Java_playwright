package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.HomePage;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class HomeSteps {
    @Autowired
    HomePage homePage;

    @When("Usuário acessou o Home")
    public void ensureWeAreAtHome() {
        homePage.ensureWeAreAtHome();
    }
}
