package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.AdvancePaymentPage;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

public class AdvancePaymentSteps {

    @Autowired
    AdvancePaymentPage advancePaymentPage;

    @Then("será direcionado para a jornada de Antecipação")
    public void shouldBeAtAdvancePaymentPage() {
        advancePaymentPage.ensureWeAreAtAdvancePaymentPage();
    }
}
