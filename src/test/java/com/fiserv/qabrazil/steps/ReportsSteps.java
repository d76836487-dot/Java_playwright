package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.ReportsPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assumptions.assumeThat;

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
        assumeThat(reportsPage.thereAreReportsExtracted()).isTrue();
    }

    @Then("Usuário visualizará as {csv} na tabela")
    public void userWillSeeTheseColumnsInTheTable(String[] columns) {
        reportsPage.tableHasColumns(columns);
    }

    @Then("Usuário visualizará o nome do relatório sendo NOMEALIANÇA_TipoDoArquivo_dd-mm-yyyy_dd-mm-yyyy")
    public void userWillSeeTheReportNameHavingCorrectFormat() {
        reportsPage.userWillSeeTheReportNameHavingCorrectFormat();
    }
}
