package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.SelectECOrDtcoPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertTrue;

public class SelectECOrDtcoSteps extends BaseSteps {
    @Autowired
    SelectECOrDtcoPage selectECOrDtcoPage;

    @Then("Usuário verá modal para selecionar EC ou DTCO")
    public void userWillSeeModalToPickEC() {
        assertTrue("Parece que a modal para trocar estabelecimentos não está aberta",
                pageField.from("Header - Trocar Estabelecimento - Modal - Botão selecionar por Documento")
                .fieldIsOneVisibleAndEnabled());
        assertTrue("Parece que a modal para trocar estabelecimentos não está aberta",
                pageField.from("Header - Trocar Estabelecimento - Modal - Botão selecionar por Estabelecimento")
                .fieldIsOneVisibleAndEnabled());
    }

    @Then("Usuário visualizará a aba Estabelecimento por padrão")
    public void tabEstablishmentIsSelected() {
        assertTrue("Aba estabelecimento não está selecionada por padrão",
                selectECOrDtcoPage.tabEstablishmentIsSelected());
    }
}
