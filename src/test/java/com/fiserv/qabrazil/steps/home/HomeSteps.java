package com.fiserv.qabrazil.steps.home;

import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.home.HomeCustomizeModal;
import com.fiserv.qabrazil.pages.home.HomePage;
import com.fiserv.qabrazil.util.Currency;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;
import org.testng.Assert;

import java.time.LocalTime;

import static com.fiserv.qabrazil.config.TestIdsConfig.getQuerySelector;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assumptions.assumeThat;
import static org.testng.AssertJUnit.assertEquals;

public class HomeSteps extends BaseSteps {

    @Autowired
    CommonsPage commonsPage;

    @Autowired
    HomePage homePage;

    @Autowired
    HomeCustomizeModal homeCustomizeModal;

    @Autowired
    Page page;


    @When("Usuário acessou o Home")
    @Given("que estou na tela “início” do Portal")
    public void ensureWeAreAtHome() {
        homePage.ensureWeAreAtHome();
        homePage.closeAllPopups();
        waitUntilTrue(360, homePage::hasNoLoadingBars);
    }

    @Then("Usuário {booleanValue} card Antecipação")
    public void userSeesAnticipationCard(boolean cardShouldBeVisible) {
        boolean cardAnticipation = homePage.anticipationCardIsVisible();
        assertThat(cardAnticipation)
                .withFailMessage("Esperava card estar " + (cardShouldBeVisible ? "visível" : "invisivel") + ", mas não estava")
                .isEqualTo(cardShouldBeVisible);
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

    @Then("Calcula Card Recebimentos")
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

    @And("{string} esta visivel no acesso rapido")
    public void estaVisivelNoAcessoRapido(String arg0) {
        homePage.cheTextElementOnage(arg0);
    }

    @And("{string} esta visivel na home")
    public void estaVisivelNaHome(String arg0) {
        homePage.cheTextElementOnage(arg0);
    }

    @Then("verifica mensagem em tela {string}")
    public void verificaMensagemEmTela(String arg0) {
        homePage.cheTextElementOnage(arg0);
    }

    @And("check screen text {string}")
    public void checkScreenText(String arg0) {
        homePage.cheTextElementOnage(arg0);
    }

    @And("Usuário clica em ver tudo no card {string}")
    public void usuárioClicaEmVerTudoNoCard(String arg0) {
        if(arg0.equals("Recebimentos")) {
            homePage.usuárioClicaEmVerTudoNoCardRecebimento(arg0);
        }

        if(arg0.equals("Últimas vendas")) {
            homePage.usuárioClicaEmVerTudoNoCardultimasVendas(arg0);
        }
        if(arg0.equals("Agenda de recebimentos da semana")) {
            homePage.usuárioClicaEmVerTudoNoCarAgRecSem(arg0);
        }




    }

    @And("waiting time {string}")
    public void waitingTime(String arg0) throws InterruptedException {
    int cont = 0;
    int seg=0;
    int minuto=0;
        System.out.println("Teste de >>>> " + arg0 + " Minutos");
        LocalTime myTime = LocalTime.now();
        System.out.println("Tempo " + myTime);



            for (int i = 0; i < 1000000; i++) {

                cont += 1;

                if (cont == 11500) {
                    minuto += 1;
                    cont = 0;
                    myTime = LocalTime.now();
                    System.out.println("Tempo " + myTime);
                    System.out.println("Aguarde para que a sesão caia >>> passou " + minuto + " minuto");
                }



                String inputTextField = String.valueOf(page.getByRole(AriaRole.HEADING, new Page.GetByRoleOptions().setName("Sessão Expirada")).isVisible());
                if (inputTextField.isEmpty()) {
                    Assert.assertEquals("A sessao caiu em menor tempo previsto", "", String.valueOf(inputTextField));
                }

                if( arg0.equals("5") && minuto==5){

                    break;
                }
                if( arg0.equals("14") && minuto==14){
                    break;
                }

                if( arg0.equals("15") && minuto==15){
                    break;
                }
            }


        }




    @And("Check empty session")
    public void checkEmptySession() {

        commonsPage.clickOnMenu("Vendas","Relatório de vendas","");


        String inputTextField = String.valueOf(page.getByRole(AriaRole.HEADING, new Page.GetByRoleOptions().setName("Sessão Expirada")).isVisible());
        if (inputTextField.isEmpty()) {
            Assert.assertEquals("A sessao caiu em menor tempo previsto", "", String.valueOf(inputTextField));
        }


        String inputTextField2=page.locator("data-testid=vendas-hoje-card-total-vendas").textContent();
      if (inputTextField2.equals("0")){
            Assert.assertEquals("A sessao caiu antes do previsto",inputTextField,"R$ 0,00");
        }
    }
}
