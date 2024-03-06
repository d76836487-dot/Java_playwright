package com.fiserv.qabrazil.steps.home;

import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.home.HomeCustomizeModal;
import com.fiserv.qabrazil.pages.home.HomePage;
import com.fiserv.qabrazil.util.Currency;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assumptions.assumeThat;
import static org.testng.AssertJUnit.assertEquals;

public class HomeSteps extends BaseSteps {

    @Autowired
    CommonsPage commonsPage;

    @Autowired
    HomePage homePage;

    @Autowired
    HomeCustomizeModal homeCustomizeModal;

    @When("Usuário acessou o Home")
    @Given("que estou na tela “início” do Portal")
    public void ensureWeAreAtHome() {
        homePage.ensureWeAreAtHome();
        homePage.closeAllPopups();
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
        PageField todayReceivableId = pageField.from("Home - Card Recebimento - Recebimento Hoje");
        PageField foreseenReceivableId = pageField.from("Home - Card Recebimento - Recebimento Previsto");
        PageField totalReceivableId = pageField.from("Home - Card Recebimento - Total Recebimento");

        Currency todayReceivable = todayReceivableId.getAsCurrency();
        Currency foreseenReceivable = foreseenReceivableId.getAsCurrency();
        Currency totalReceivable = totalReceivableId.getAsCurrency();

        assertEquals("Total of receivable not matching sum for today and foreseen",
                totalReceivable.doubleValue(), todayReceivable.doubleValue() + foreseenReceivable.doubleValue(), 0.001);
    }

    @Given("{string} está disponível na \"Home - acesso rápido\"")
    public void quickAccessContainsItem(String identifier) {
        PageField elementSelector = pageField.from("Home - acesso rápido - " + identifier);
        if (!elementSelector.elementIsVisible()) {
            commonsPage.clickButtonWithText("Personalizar");

            assumeThat(homeCustomizeModal.select(identifier))
                    .withFailMessage("Could not select the element \"%s\", not available in the options".formatted(identifier))
                    .isTrue();
        }
    }

    @Given("{shakespeareBoolean} valores futuros a/para receber")
    public void thereAreValuesToReceiveInTheFuture(boolean value) {
        Currency totalReceivable = pageField.from("Home - Card Recebimento - Recebimento Previsto").getAsCurrency();
        var assumption = assumeThat(totalReceivable.doubleValue());
        if (value) {
            assumption
                    .withFailMessage("Não existem valores futuros a receber")
                    .isGreaterThan(0);
        } else {
            assumption
                    .withFailMessage("Existem valores futuros a receber")
                    .isEqualTo(0);
        }
    }

    @Given("Usuário tinha de mais de uma notificação")
    public void userHasMoreThanOneNotification() {
        boolean zeroNotifications = pageField.from("Header - Notificações").getAsText().contains("0Notificações");
        System.out.printf("Notifications: %b - %s%n", zeroNotifications, pageField.from("Header - Notificações").getAsText());
        assumeThat(zeroNotifications).isFalse();
    }
}
