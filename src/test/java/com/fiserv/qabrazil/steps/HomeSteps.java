package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.HomePage;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.*;

public class HomeSteps {

    @Autowired
    CommonsPage commonsPage;

    @Autowired
    HomePage homePage;

    @When("Usuário acessou o Home")
    @Given("que estou na tela “início” do Portal")
    public void ensureWeAreAtHome() {
        homePage.ensureWeAreAtHome();
    }

    @Then("Usuário {booleanValue} card Antecipação")
    public void userSeesAnticipationCard(boolean cardShouldBeVisible) {
        boolean cardAnticipation = homePage.anticipationCardIsVisible();
        assertEquals("Visibilidade do card inesperada", cardAnticipation, cardShouldBeVisible);
    }

    @ParameterType(value = "verá|não verá")
    public Boolean booleanValue(String value) {
        return value.equals("verá");
    }

    @When("na seção Vendas Hoje clicar no botão \"Ver tudo\"")
    public void clickOnButtonSeeAllInSalesTodaySection() {
        homePage.clickOnButtonSeeAllInSalesTodaySection();
    }

    @Then("será direcionado ao menu \"Vendas Hoje\"")
    public void shouldNavigateToSalesTodayPage() {
        homePage.hasRedirectedTo("/Hoje");
    }

    @When("clicar no botão {string}")
    public void clickOnButton(String buttonText) {
        commonsPage.clickButtonWithText(buttonText);
    }

    @Then("Total de Recebimentos será igual ao recebimento de hoje + futuro previsto")
    public void totalReceivableMatches() {
        String totalReceivableId = TestIdsConfig.getTestId("Home - Card Recebimento - Total Recebimento");
        String todayReceivableId = TestIdsConfig.getTestId("Home - Card Recebimento - Recebimento Hoje");
        String foreseenReceivableId = TestIdsConfig.getTestId("Home - Card Recebimento - Recebimento Previsto");

        double totalReceivable = commonsPage.getNumbersFromElement(totalReceivableId);
        double todayReceivable = commonsPage.getNumbersFromElement(todayReceivableId);
        double foreseenReceivable = commonsPage.getNumbersFromElement(foreseenReceivableId);

        assertEquals("Total of receivable not matching sum for today and foreseen",
                totalReceivable, todayReceivable + foreseenReceivable);
    }
}
