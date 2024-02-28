package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.qabrazil.components.HeaderComponent;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertTrue;

public class HeaderSteps extends BaseSteps {
    @Autowired
    HeaderComponent headerComponent;
    @Autowired
    ApiUserDetailsService apiUserDetailsService;

    @Given("Todos os estabelecimentos foram selecionados no header")
    public void allDocumentsWereSelected() throws Exception {
        if (apiUserDetailsService.getEcs().size() == 1) return;

        headerComponent.selectAllDocuments();
    }

    @Then("Usuário verá modal para selecionar EC ou DTCO")
    public void userWillSeeModalToPickEC() {
        assertTrue(pageField.from("Header - Trocar Estabelecimento - Modal - Botão selecionar por Documento")
                .fieldIsOneVisibleAndEnabled());
        assertTrue(pageField.from("Header - Trocar Estabelecimento - Modal - Botão selecionar por Estabelecimento")
                .fieldIsOneVisibleAndEnabled());
    }
}
