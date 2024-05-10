package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.qabrazil.components.DateRangerPage;
import com.fiserv.qabrazil.consistency.ConsistencyFile;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;

import static org.assertj.core.api.Assertions.assertThat;
import static org.testng.AssertJUnit.assertEquals;

public class CalendarSteps extends BaseSteps {
    @Autowired
    DateRangerPage calendarPage;

    @Autowired
    ConsistencyFile consistencyFile;

    @Given("Usuário selecionou Botão Período")
    @When("Usuário seleciona Botão Período")
    public void openCalendar() {
        calendarPage.openCalendarComponent();
    }

    @When("Usuário seleciona Ontem")
    public void userSelectsYesterday() {
        calendarPage.userSelectsYesterday();
    }


    @Given("Usuário selecionou Mês Atual")
    @When("Usuário seleciona Mês Atual")
    public void userSelectsThisMonth() {
        calendarPage.userSelectsThisMonth();
    }

    @When("Usuário seleciona Últimos 7 Dias")
    public void userSelectsLast7Days() {
        calendarPage.userSelectsLastSevenDays();
    }

    @When("Usuário seleciona Últimos 14 Dias")
    public void userSelectsLast14Days() {
        calendarPage.userSelectsLastFourteenDays();
    }

    @When("Usuário seleciona Últimos 30 Dias")
    public void userSelectsLast30Days() {
        calendarPage.userSelectsLastThirdDays();
    }

    @When("Usuário seleciona Próximos 14 Dias")
    public void userSelectsNext14Days() {
        calendarPage.userSelectsNextFourteenDays();
    }

    @When("Usuário seleciona Próximos 30 Dias")
    public void userSelectsNext30Days() {
        calendarPage.userSelectsNextThirdDays();
    }

    @Then("{selectedDayOnCalendar} representará {expectedDay}")
    public void selectedDay(int dayOnCalendar, int expectedDay) {
        assertEquals(expectedDay, dayOnCalendar);
    }

    @Then("{selectedYearMonthDayOnCalendar} representará {expectedYearMonthDay}")
    public void selectedDate(String yearMonthDayOnCalendar, String expectedYearMonthDay) {
        assertThat(yearMonthDayOnCalendar)
                .isEqualTo(expectedYearMonthDay);
    }

    @Then("{typedDateOnCalendar} representará {expectedYearMonthDay}")
    public void typedDate(String typedDateOnCalendar, String calculatedDate) {
        assertEquals(calculatedDate, typedDateOnCalendar);
    }

    @ParameterType("'(Date ranger -.* Selecionada)'")
    public int selectedDayOnCalendar(String displayName) {
        return pageField.from(displayName).getAsNumber();
    }

    @ParameterType("'(Date ranger -.* Selecionada)'")
    public String selectedYearMonthDayOnCalendar(String displayName) {
        int year = Integer.parseInt(pageField.from("Date ranger - Ano").getInputValue());
        int month = Integer.parseInt(pageField.from("Date ranger - Mês").getInputValue()) + 1;
        int day = pageField.from(displayName).getAsNumber();
        return LocalDate.of(year, month, day).toString();
    }

    @ParameterType("'(dia início do mês|dia final do mês|dia de ontem|dia de sete dias atrás)'")
    public int expectedDay(String expectedDate) {
        LocalDate day = DateUtil.calculateLocalDate(expectedDate);
        return day.getDayOfMonth();
    }

    @ParameterType("'(data início do mês|data final do mês|data de ontem|data de sete dias atrás)'")
    public String expectedYearMonthDay(String expectedDate) {
        LocalDate day = DateUtil.calculateLocalDate(expectedDate);
        return day.toString();
    }

    @ParameterType("'(Date ranger -.* Digitado)'")
    public String typedDateOnCalendar(String displayName) {
        return pageField.from(displayName).getInputValue();
    }

    @Given("Usuário selecionou data com base no arquivo de consistência")
    @When("Usuário seleciona data com base no arquivo de consistência")
    public void selectsDate() {
        String dateToType = consistencyFile.getAnyDayGeneralInfo().date;

        calendarPage.userSelectsSpecificDay(dateToType);
    }

    @Then("Abrirá componente de calendário que deve vir por default \"Este Mês\"")
    public void calendarComponentOpensWithThisMonthAsDefault() {
        calendarPage.ensureThisMonthIsSelected();
    }

    @Then("Usuário pode selecionar a data conforme desejado")
    public void userWishesForADateAndSelectIt() {
        calendarPage.userClicksOnDays(15, 22);
    }

    @Then("Usuário pode preencher a data conforme desejado")
    public void userWishesForADateAndTypeIt() {
        calendarPage.userSelectsSpecificDay("01012024");
    }
}
