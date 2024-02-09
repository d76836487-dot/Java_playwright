package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.WeekReceiptScheduleComponent;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assumptions.assumeThat;

public class WeekReceiptScheduleSteps {

    @Autowired
    private WeekReceiptScheduleComponent weekReceiptScheduleComponent;

    @Given("{shakespeareBoolean} Agenda de recebimentos da semana para exibir")
    public void weekReceiptScheduleLoadedCorrectly(boolean value) {
        assumeThat(weekReceiptScheduleComponent.receivablesAvailable())
                .isEqualTo(value);
    }

    @When("visualizar o box \"Agenda de recebimentos da semana\"")
    public void viewScheduleBox() {
        weekReceiptScheduleComponent.isVisible();
    }

    @Then("usuário visualizará 5 dias com as respectivas informações data, mês, dia da semana, valor líquido, e quantidade de depósitos realizados")
    public void shouldSeeAllRequiredInformation() {
        weekReceiptScheduleComponent.containsDatesAndMonths();
        weekReceiptScheduleComponent.containsWeekDates();
        weekReceiptScheduleComponent.containsNetValueAndNumberOfDeposits();
    }

    @Then("usuário visualizará a mensagem “Você não possui nenhum recebimento previsto para essa semana”")
    public void shouldSeeAMessageDoNotHaveReceiptForThisWeek() {
        weekReceiptScheduleComponent.assertThatThereAreNoReceivablesAvailableMessage();
    }

    @And("usuário visualizará um botão \"Ver recebimentos detalhado\"")
    public void shouldSeeViewDetailedReceiptsButton() {
        weekReceiptScheduleComponent.assertThatViewDetailedReceiptsButtonIsVisible();
    }

    @ParameterType("existir|não existir")
    public boolean shakespeareBoolean(String value) {
        return value.equals("existir");
    }
}
