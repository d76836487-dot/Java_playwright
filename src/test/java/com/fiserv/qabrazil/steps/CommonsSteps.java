package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.PageObject;
import com.fiserv.qabrazil.util.Identifier;
import com.fiserv.qabrazil.util.UrlCheckers;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static com.fiserv.qabrazil.util.RequestMonitoring.ensureNoFlyingRequests;
import static org.assertj.core.api.Assumptions.assumeThat;
import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class CommonsSteps {

    @Autowired
    CommonsPage commonsPage;

    @Autowired
    UrlCheckers urlCheckers;

    private PageObject newTab;

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
    @Given("Usuário NÃO viu mensagem {string}")
    public void userWillNotSeeMessage(String expectedMessage) {
        String message = commonsPage.getWholeTextIfVisible(
                expectedMessage.substring(0, Math.min(expectedMessage.length(), 10)));
        assumeThat(message.equals("Not visible")).isFalse();
    }

    @And("Usuário verá botão com texto {string}")
    public void userWillSeeButtonWithText(String expectedButtonText) {
        String message = commonsPage.getButtonWithTextIfVisible(
                expectedButtonText.substring(0, Math.min(expectedButtonText.length(), 10)));
        assertEquals("Botão não encontrado na página", expectedButtonText, message);
    }

    @When("usuário clica {identifier}")
    @When("usuário clica no {identifierAndSection}")
    public void userClicks(Identifier identifier) {
        String elementSelector = identifier.selector();
        commonsPage.clickButton(elementSelector);
    }

    @When("usuário clica em/no {identifierAndSection} e uma nova aba se abre")
    public void userClicksAndNewTabOpens(Identifier identifier) {
        String elementSelector = identifier.selector();
        newTab = commonsPage.clickButtonAndNewTabOpens(elementSelector);
    }

    @Then("Usuário verá em {identifier} o valor {string}")
    public void matchValuePerField(Identifier identifier, String expectedText) {
        String textFound = commonsPage.getTextFromElement(identifier);
        assertEquals(expectedText, textFound);
    }

    @Then("Usuário verá em {identifier} o valor {string} - se existir")
    public void matchValuePerFieldOptional(Identifier identifier, String expectedText) {
        String testId = identifier.testId();
        if (commonsPage.elementIsVisibleNoWait(testId)) {
            String textFound = commonsPage.getTextFromElement(identifier);
            assertEquals(expectedText, textFound);
        }
    }

    @Then("Usuário verá em todos os campos {identifier} o valor {string} - se existir")
    public void matchValueAllField(Identifier identifier, String expectedText) {
        String testId = identifier.testId();
        List<String> allTextsFound = commonsPage.getAllTextsFromElement(testId);
        for (String textFound: allTextsFound) {
            assertEquals(expectedText, textFound);
        }
    }

    @Then("será direcionado para a jornada de {string}")
    public void ensureWeAreAtTheRightPage(String pageName) {
        urlCheckers.forPage(pageName).ensureWeAreAtTheCorrectPage();
    }

    @Then("será direcionado para a jornada de {string} na nova aba")
    public void ensureWeAreAtTheRightPageInANewTab(String pageName) {
        urlCheckers.forPage(pageName).ensureWeAreAtTheCorrectPage(newTab);
    }

    @When("Usuário passa o mouse sobre {string}")
    public void userHoversOver(String identifier) {
        String elementSelector = TestIdsConfig.getQuerySelector(identifier);
        commonsPage.hoverOver(elementSelector);
    }

    @Then("O menu lateral expandiu contendo {string}")
    public void lateralMenuExpandsContaining(String identifier) {
        assertTrue("Menu lateral não está expandido", commonsPage.lateralMenuHasExpandedContaining(identifier));
    }

    @And("Todas as requisições HTTP foram respondidas")
    public void ensureAllHttpRequestsGotAnswer() {
        ensureNoFlyingRequests();
    }
}
