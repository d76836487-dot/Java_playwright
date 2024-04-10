package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.BusinessPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class BusinessSteps extends BaseSteps {
    @Autowired
    private BusinessPage businessPage;

    @When("Usuário acessou página de Negócio")
    public void shouldBeAtReportsPage() {
        businessPage.navigateTo();
    }
}

