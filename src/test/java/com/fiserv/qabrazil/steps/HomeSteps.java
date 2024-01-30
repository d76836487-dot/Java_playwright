package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.HomePage;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertTrue;

public class HomeSteps {
    @Autowired
    HomePage homePage;

    @When("Usuário acessou o Home")
    public void ensureWeAreAtHome() {
        homePage.ensureWeAreAtHome();
    }

    @Then("Usuário verá card Antecipação")
    public void userSeesAnticipationCard() {
        boolean cardAnticipation = homePage.anticipationCardIsVisible();
        assertTrue("Card antecipação não é visível", cardAnticipation);
    }
}
