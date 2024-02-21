package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.PageObject;
import com.fiserv.qabrazil.util.Identifier;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.UrlCheckers;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static com.fiserv.qabrazil.util.RequestMonitoring.ensureNoFlyingRequests;
import static org.assertj.core.api.Assertions.assertThat;
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

    @Then("Usuário verá botão com texto {string}")
    public void userWillSeeButtonWithText(String expectedButtonText) {
        String message = commonsPage.getButtonWithTextIfVisible(
                expectedButtonText.substring(0, Math.min(expectedButtonText.length(), 10)));
        assertEquals("Botão não encontrado na página", expectedButtonText, message);
    }

    @When("usuário clica {pageField}")
    @When("usuário clica no {pageFieldWithSection}")
    public void userClicks(PageField identifier) {
        identifier.click();
    }

    @When("usuário clica em/no {pageFieldWithSection} e uma nova aba se abre")
    public void userClicksAndNewTabOpens(PageField identifier) {
        newTab = identifier.clickAndNewTabOpens();
    }

    @Given("Usuário viu {string} em {pageField}")
    public void matchValuePerField(String expectedText, PageField pageField) {
        String textFound = pageField.getAsText();
        assumeThat(expectedText).isEqualTo(textFound);
    }

    @Then("Usuário verá em {pageField} o valor {string}")
    public void matchValuePerField(PageField pageField, String expectedText) {
        String textFound = pageField.getAsText();
        assertEquals(expectedText, textFound);
    }


    @Then("usuário verá em {pageField} valor maior que {double}")
    public void valueGreaterThan(PageField pageField, double value) {
        assertThat(pageField.getAsCurrency().doubleValue())
                .isGreaterThan(value);
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
    @Then("o Portal deve abrir as {string}")
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

    @Given("{shakespeareBoolean} o campo {pageField}")
    public void fieldIsOneVisibleAndEnabled(boolean value, PageField pageField) {
        assumeThat(pageField.fieldIsOneVisibleAndEnabled()).isEqualTo(value);
    }
}
