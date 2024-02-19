package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.WeekReceiptScheduleComponent;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import static org.assertj.core.api.Assumptions.assumeThat;

public class WeekReceiptScheduleSteps {

    @Autowired
    private WeekReceiptScheduleComponent weekReceiptScheduleComponent;

    @Given("{shakespeareBoolean} Agenda de recebimentos da semana para exibir")
    public void weekReceiptScheduleLoadedCorrectly(boolean value) {
        assumeThat(weekReceiptScheduleComponent.receivablesAvailable())
                .withFailMessage("Esperava *%s* agenda de recebimentos", value ? "existir" : "não existir")
                .isEqualTo(value);
    }

    @When("visualizar o box \"Agenda de recebimentos da semana\"")
    public void viewScheduleBox() {
        weekReceiptScheduleComponent.isVisible();
    }

    @Then("usuário visualizará 5 dias com as respectivas informações data, mês, dia da semana, valor líquido, e quantidade de depósitos realizados")
    public void shouldSeeAllRequiredInformation() {
        weekReceiptScheduleComponent.containsDates();
        weekReceiptScheduleComponent.containsMonths();
        weekReceiptScheduleComponent.containsWeekDates();
        weekReceiptScheduleComponent.containsNetValues();
        weekReceiptScheduleComponent.containsNumberOfDeposits();
    }

    @Then("usuário visualizará o dia \"hoje\" destacado e os dias anteriores com valores verdes e os próximos com letras pretas")
    public void devoVisualizarODiaHojeDestacadoEOsDiasAnterioresComValoresVerdesEOsPróximosComLetrasPretas() {
        weekReceiptScheduleComponent.containsHighlightedInformation();
    }

    @Then("usuário visualizará a mensagem “Você não possui nenhum recebimento previsto para essa semana”")
    public void shouldSeeAMessageDoNotHaveReceiptForThisWeek() {
        weekReceiptScheduleComponent.assertThatThereAreNoReceivablesAvailableMessage();
    }

    @And("usuário visualizará um botão \"Ver recebimentos detalhado\"")
    public void shouldSeeViewDetailedReceiptsButton() {
        weekReceiptScheduleComponent.assertThatViewDetailedReceiptsButtonIsVisible();
    }

    @ParameterType("(não )?(existir|existem)")
    public boolean shakespeareBoolean(String not, String ignoredValue) {
        return StringUtils.isEmpty(not);
    }
}
