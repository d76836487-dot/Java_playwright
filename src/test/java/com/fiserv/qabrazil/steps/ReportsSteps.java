package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.ReportsPage;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

public class ReportsSteps {

    @Autowired
    ReportsPage reportPage;

    @Then("será direcionado para a jornada de Relatórios")
    public void shouldBeAtReportsPage() {
        reportPage.ensureWeAreAtReportsPage();
    }
}
