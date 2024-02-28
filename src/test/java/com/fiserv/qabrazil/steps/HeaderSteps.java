package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.Then;

import static org.testng.AssertJUnit.assertTrue;

public class HeaderSteps extends BaseSteps {
    @Then("Usuário verá modal para selecionar EC ou DTCO")
    public void userWillSeeModalToPickEC() {
        assertTrue(pageField.from("Header - Trocar Estabelecimento - Modal - Botão selecionar por Documento")
                .fieldIsOneVisibleAndEnabled());
        assertTrue(pageField.from("Header - Trocar Estabelecimento - Modal - Botão selecionar por Estabelecimento")
                .fieldIsOneVisibleAndEnabled());
    }
}
