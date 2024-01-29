package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.CommonsPage;
import com.microsoft.playwright.Page;
import io.cucumber.java.After;
import io.cucumber.java.Scenario;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
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
        String message = commonsPage.getWholeTextIfVisible(expectedMessage.substring(0, 10));
        assertEquals("Mensagem não encontrada na página", expectedMessage, message);
    }

}
