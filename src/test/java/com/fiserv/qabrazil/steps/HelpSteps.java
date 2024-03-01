package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.HelpPage;
import com.fiserv.qabrazil.steps.home.HomeCustomizeModalSteps;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class HelpSteps {

    @Autowired
    CommonsPage commonsPage;

    @Autowired
    HelpPage helpPage;

    @Then("usuário visualiza o componente WhatsApp na cor azul no canto inferior à direita da tela")
    public void shouldSeeWhatsAppChatButton() {
        helpPage.shouldSeeWhatsAppChatButton();
    }

    @Given("usuário está na página Ajuda")
    public void userNavigatesToHelpPage() {
        helpPage.navigateTo();
    }

    @When("usuário move a tela através do scroll")
    public void userScrolls() {
        commonsPage.scroll(20);
        commonsPage.scroll(20);
        commonsPage.scroll(20);
        commonsPage.scroll(20);
        commonsPage.scroll(20);
    }

    @When("usuário move a tela através do scroll até o final da página")
    public void userScrollsToTheEndOfThePage() {
        commonsPage.scrollToBottom();
    }

    @Then("usuário visualizará o componente Whatsapp acompanhando a rolagem da tela")
    public void whatsAppChatButtonShouldHavePositionFixed() {
        helpPage.whatsAppChatButtonShouldHavePositionFixed();
    }

    @Then("usuário visualizará o campo Atendimento pelo Whatsapp contendo a frase e o número do telefone sublinhado:")
    public void userSeesFieldWithSentenceAndPhoneNumberHighlighted(String expectedText) {
        helpPage.assertBottomWhatsAppText(HomeCustomizeModalSteps.csv(expectedText));
    }
}
