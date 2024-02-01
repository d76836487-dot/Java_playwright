package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.microsoft.playwright.Page;
import io.cucumber.java.After;
import io.cucumber.java.Scenario;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertEquals;

public class CommonsSteps {

    @Autowired
    CommonsPage commonsPage;

    @Autowired
    Page page;

    @After
    public void tearDown(Scenario scenario) {
        if (scenario.isFailed()) {
            scenario.attach(page.screenshot(new Page.ScreenshotOptions().setFullPage(true)),
                    "image/png", "Screen Shot");
            scenario.attach(page.content(), "text/html", "Content");
        }
    }

    @Given("Usuário acessou o portal")
    public void userAccessedThePortal() {
        commonsPage.navigateToRoot();
    }

    @Then("Usuário verá mensagem {string}")
    public void userWillSeeMessage(String expectedMessage) {
        String message = commonsPage.getWholeTextIfVisible(
                expectedMessage.substring(0, Math.min(expectedMessage.length(), 10)));
        assertEquals("Mensagem não encontrada na página", expectedMessage, message);
    }

    @And("Usuário verá botão com texto {string}")
    public void userWillSeeButtonWithText(String expectedButtonText) {
        String message = commonsPage.getButtonWithTextIfVisible(
                expectedButtonText.substring(0, Math.min(expectedButtonText.length(), 10)));
        assertEquals("Botão não encontrado na página", expectedButtonText, message);
    }

    @When("usuário clica {string}")
    @When("usuário clica em/no {string}")
    public void userClicks(String identifier) {
        String elementSelector = TestIdsConfig.getQuerySelector(identifier);
        commonsPage.clickButton(elementSelector);
    }

    @Then("Usuário verá em {string} o valor {string}")
    public void matchValuePerField(String identifier, String expectedText) {
        String testId = TestIdsConfig.getTestId(identifier);
        String textFound = commonsPage.getTextFromElement(testId);
        assertEquals(expectedText, textFound);
    }
}
