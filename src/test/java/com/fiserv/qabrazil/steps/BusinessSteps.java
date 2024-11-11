package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.BusinessPage;
import com.fiserv.qabrazil.pages.home.HomePage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.And;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class BusinessSteps extends BaseSteps {
    @Autowired
    private BusinessPage businessPage;

    @Autowired
    HomePage homePage;

    @When("Usuário acessou página de Negócio")
    public void shouldBeAtReportsPage() {
        businessPage.navigateTo();
    }

    @And("{string} esta visivel na pagina de negócios")
    public void estaVisivelNaPaginaDeNegócios(String arg0) {
        homePage.cheTextElementOnage(arg0);
    }
}

