package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.HelpPage;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

public class HelpSteps {

    @Autowired
    HelpPage helpPage;

    @Then("usuário visualiza o componente WhatsApp na cor azul no canto inferior à direita da tela")
    public void shouldSeeWhatsAppChatButton() {
        helpPage.shouldSeeWhatsAppChatButton();
    }
}
