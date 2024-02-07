package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.ReportsPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertTrue;

public class ReportsSteps {

    @Autowired
    ReportsPage reportsPage;

    @Then("será direcionado para a jornada de Relatórios")
    public void shouldBeAtReportsPage() {
        reportsPage.ensureWeAreAtReportsPage();
    }

    @Given("Usuário acessa página de Relatórios( através do menu lateral)")
    public void userGoesToReportsPage() {
        reportsPage.navigateTo();
    }

    @Given("Usuário não está na página de Relatórios")
    public void userIsNotInReportsPage() {
        reportsPage.ensureIsNotInReportsPage();
    }

    @Given("Existem relatórios já extraídos")
    public void thereAreReportsExtracted() {
        assertTrue("Não foram encontrados relatórios extraídos", reportsPage.thereAreReportsExtracted());
    }

    @Then("Usuário visualizará as {csv} na tabela")
    public void userWillSeeTheseColumnsInTheTable(String[] columns) {
        reportsPage.tableHasColumns(columns);
    }
}
