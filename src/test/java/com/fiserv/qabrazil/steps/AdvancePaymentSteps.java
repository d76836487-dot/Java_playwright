package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.AdvancePaymentPage;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.And;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class AdvancePaymentSteps extends BaseSteps {
    @Autowired
    private AdvancePaymentPage advancePaymentPage;

    @When("Usuário acessou página de Antecipação")
    public void shouldBeAtReportsPage() {
        advancePaymentPage.navigateTo();
    }


}
