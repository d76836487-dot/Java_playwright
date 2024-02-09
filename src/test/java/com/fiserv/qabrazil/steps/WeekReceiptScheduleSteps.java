package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.WeekReceiptScheduleComponent;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assumptions.assumeThat;

public class WeekReceiptScheduleSteps {

    @Autowired
    private WeekReceiptScheduleComponent weekReceiptScheduleComponent;

    @Given("Agenda de recebimentos da semana carregou")
    public void weekReceiptScheduleLoadedCorrectly() {
        assumeThat(weekReceiptScheduleComponent.receivablesAvailable())
                .isTrue();
    }

    @When("visualizar o box \"Agenda de recebimentos da semana\"")
    public void viewScheduleBox() {
        weekReceiptScheduleComponent.isVisible();
    }

    @Then("devo visualizar 5 dias com as respectivas informações data, mês, dia da semana, valor líquido, e quantidade de depósitos realizados")
    public void shouldSeeAllRequiredInformation() {
        weekReceiptScheduleComponent.containsDatesAndMonths();
        weekReceiptScheduleComponent.containsWeekDates();
        weekReceiptScheduleComponent.containsNetValueAndNumberOfDeposits();
    }
}
