package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.components.HeaderComponent;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.PageObject;
import com.fiserv.qabrazil.util.UrlCheckers;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.List;

import static com.fiserv.qabrazil.pages.PageField.assertThat;
import static com.fiserv.qabrazil.util.RequestMonitoring.ensureNoFlyingRequests;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assumptions.assumeThat;
import static org.testng.AssertJUnit.*;

public class CommonsSteps {

    @Autowired
    CommonsPage commonsPage;

    @Autowired
    HeaderComponent headerComponent;

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

    @Then("Usuário verá {pageField}")
    public void userWillSee(PageField pageField) {
        assertTrue("Campo %s não está visível como esperado".formatted(pageField.getDisplayName()),
                pageField.elementIsVisibleRightNow());
    }

    @Given("usuário clicou no {pageField}")
    @Given("usuário clicou no {pageFieldWithSection}")
    @When("usuário clica {pageField}")
    @When("usuário clica em/no {pageFieldWithSection}")
    public void userClicks(PageField identifier) {
        identifier.click();
    }

    @When("usuário clica em/no {pageField} e uma nova aba se abre")
    @When("usuário clica em/no {pageFieldWithSection} e uma nova aba se abre")
    public void userClicksAndNewTabOpens(PageField identifier) {
        newTab = identifier.clickAndNewTabOpens();
    }

    @Given("Usuário viu {string} em {pageField}")
    public void matchValuePerField(String expectedText, PageField pageField) {
        String textFound = pageField.getAsText();
        assumeThat(expectedText).isEqualTo(textFound);
    }

    @Then("Usuário verá em {pageField} o valor/texto/rótulo {string}")
    @Then("Usuário verá em {pageField} o valor/texto/rótulo")
    public void matchValuePerField(PageField pageField, String expectedText) {
        String textFound = pageField.getAsText();
        assertEquals(expectedText, textFound);
    }

    @Then("Usuário verá em todos os {pageField} o mesmo valor/texto/rótulo {string}")
    public void matchValueForAllFields(PageField pageField, String expectedText) {
        List<String> textsFound = pageField.getAllAsText();
        for(String textFound: textsFound) {
            assertEquals(expectedText, textFound);
        }
    }

    @Then("Usuário não verá nenhum {pageField}")
    public void notVisible(PageField pageField) {
        assertFalse("%s não deveria ser visível".formatted(pageField.getDisplayName()),
                pageField.elementIsVisibleRightNow());
    }

    @Then("Usuário verá em {pageField} as opções {csv}")
    public void matchValuesPerFields(PageField pageField, String[] expectedTexts) {
        List<String> valuesFound = pageField.getAllAsText();
        assertThat(valuesFound).containsExactly(expectedTexts);
    }

    @Then("Usuário verá o accordion em {pageField} as opções abaixo somente")
    public void userWillOnlySeeInFiltersTheOptions(String filter, String allOptions) {
        List<String> expectedOptions = Arrays.stream(allOptions.split(","))
                .map(String::trim)
                .sorted()
                .toList();
        commonsPage.allOptionsArePresentAndExclusive(filter, expectedOptions);
    }

    @Then("usuário verá em {pageField} valor maior que {double}")
    public void valueGreaterThan(PageField pageField, double value) {
        assertThat(pageField.getAsCurrency().doubleValue())
                .isGreaterThan(value);
    }

    @Then("Usuário verá em {pageField} o valor {string} - se existir")
    public void matchValuePerFieldOptional(PageField pageField, String expectedText) {
        if (pageField.elementIsVisibleRightNow()) {
            assertThat(pageField).containsText(expectedText);
        }
    }

    @Then("Usuário verá em todos os campos {pageField} o valor {string} - se existir")
    public void matchValueAllField(PageField pageField, String expectedText) {
        List<String> allTextsFound = pageField.getAllAsText();
        for (String textFound: allTextsFound) {
            assertEquals(expectedText, textFound);
        }
    }

    @Then("será direcionado para a jornada/página de {string}")
    @Then("o Portal deve abrir as {string}")
    public void ensureWeAreAtTheRightPage(String pageName) {
        urlCheckers.forPage(pageName).ensureWeAreAtTheCorrectPage();
        commonsPage.closeAllPopups();
    }

    @Then("será direcionado para a jornada de {string} na nova aba")
    public void ensureWeAreAtTheRightPageInANewTab(String pageName) {
        urlCheckers.forPage(pageName).ensureWeAreAtTheCorrectPage(newTab);
        commonsPage.closeAllPopups();
    }

    @Then("usuário será direcionado para url {string} na nova aba")
    public void ensureWeAreAtTheRightUrlInANewTab(String url) {
        urlCheckers.forUrl(url).ensureWeAreAtTheCorrectPage(newTab);
        commonsPage.closeAllPopups();
    }

    @When("Usuário passa o mouse sobre {pageField}")
    public void userHoversOver(PageField pageField) {
        pageField.hoverOver();
    }

    @Then("O menu lateral expandiu contendo {string}")
    public void lateralMenuExpandsContaining(String identifier) {
        assertTrue("Menu lateral não está expandido", commonsPage.lateralMenuHasExpandedContaining(identifier));
    }

    @Given("Todas as requisições HTTP foram respondidas")
    public void ensureAllHttpRequestsGotAnswer() {
        ensureNoFlyingRequests();
    }

    @Given("Todas as barras de carregamento sumiram")
    public void noLoadedBars() {
        commonsPage.allLoadingBarsAreGone();
    }

    @Given("{shakespeareBoolean} o campo {pageField}")
    public void fieldIsOneVisibleAndEnabled(boolean value, PageField pageField) {
        assumeThat(pageField.fieldIsOneVisibleAndEnabled()).isEqualTo(value);
    }

    @Then("{pageField} não mais estará visível")
    public void willNoLongerBeVisible(PageField pageField) {
        assertFalse("Deveria não estar visível", pageField.elementIsVisibleRightNow());
    }

    @Then("Usuário verá em {pageField} o placeholder {string}")
    public void comparePlaceholder(PageField pageField, String expectedPlaceholder) {
        assertEquals("Placeholder do campo %s é diferente".formatted(pageField.getDisplayName()),
                expectedPlaceholder, pageField.getPlaceholder());
    }

    @Then("Botão {pageField} estará visível e desabilitado")
    public void pageFieldIsDisabled(PageField pageField) {
        assertFalse("Botão %s não parece estar desabilitado".formatted(pageField.getDisplayName()),
                pageField.fieldIsOneVisibleAndDisabled());
    }

    @Then("usuário visualizará em {sectionWithPageField}")
    public void userWillSeeElement(PageField pageField) {
        assertTrue("Deveria estar visível", pageField.elementIsVisibleRightNow());
    }

    @Then("visualizará na tela de {string}, logotipo da instituição, os ícones ocultar valores, ajuda, notificações e sair")
    public void userWillSeeOnPageAllHeaderElements(String pageName) {
        ensureWeAreAtTheRightPage(pageName);
        headerComponent.ensureAllHeaderElementsArePresent();
    }

    @Then("Usuário visualizará o campo {pageFieldWithSection}")
    public void pageFieldIsVisible(PageField pageField) {
        assertThat(pageField).isVisible();
    }

    @Then("Usuário verá em {pageField} na cor primária {string}")
    public void userWillSeeColor(PageField allPageField, String expectedColor) {
        for(PageField pageField: allPageField.getAllVisiblePageField()) {
            String actualPrimaryColor = commonsPage.getPrimaryColor(pageField);

            assertEquals(expectedColor, actualPrimaryColor);
        }
    }
}
