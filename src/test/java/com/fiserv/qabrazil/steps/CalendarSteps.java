package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.components.DateRangerPage;
import com.fiserv.qabrazil.consistency.ConsistencyFile;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import static org.testng.AssertJUnit.assertEquals;

public class CalendarSteps extends BaseSteps {
    @Autowired
    DateRangerPage calendarPage;

    @Autowired
    ConsistencyFile consistencyFile;

    @When("Usuário seleciona Ontem")
    public void userSelectsYesterday() {
        calendarPage.userSelectsYesterday();
    }


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

    @When("Usuário seleciona Próximos 30 Dias")
    public void userSelectsNext30Days() {
        calendarPage.userSelectsNextThirdDays();
    }

    @Then("{selectedDayOnCalendar} representará {expectedDay}")
    public void selectedDay(int dayOnCalendar, int expectedDay) {
        assertEquals(expectedDay, dayOnCalendar);
    }

    @Then("{typedDateOnCalendar} representará {expectedYearMonthDay}")
    public void typedDate(String typedDateOnCalendar, String calculatedDate) {
        assertEquals(calculatedDate, typedDateOnCalendar);
    }

    @ParameterType("'(Date ranger -.* Selecionada)'")
    public int selectedDayOnCalendar(String displayName) {
        return pageField.from(displayName).getAsNumber();
    }

    @ParameterType("'(dia início do mês|dia de ontem|dia de sete dias atrás)'")
    public int expectedDay(String expectedDate) {
        Calendar day = calculateCalendar(expectedDate);
        return day.get(Calendar.DAY_OF_MONTH);
    }

    @ParameterType("'(data início do mês|data de ontem|data de sete dias atrás)'")
    public String expectedYearMonthDay(String expectedDate) {
        Calendar day = calculateCalendar(expectedDate);
        return new SimpleDateFormat("yyyy-MM-dd").format(day.getTime());
    }

    @ParameterType("'(Date ranger -.* Digitado)'")
    public String typedDateOnCalendar(String displayName) {
        return pageField.from(displayName).getInputValue();
    }

    private Calendar calculateCalendar(String expectedDate) {
        Calendar day = Calendar.getInstance();
        switch (expectedDate) {
            case "dia início do mês":
            case "data início do mês":
                day.set(Calendar.DAY_OF_MONTH, 1);
                break;
            case "dia de sete dias atrás":
            case "data de sete dias atrás":
                day.add(Calendar.DAY_OF_MONTH, -7);
                break;
            case "dia de ontem":
            case "data de ontem":
                day.add(Calendar.DAY_OF_MONTH, -1);
                break;
            default:
                throw new IllegalStateException("Unexpected value: " + expectedDate);
        }
        return day;
    }
    @Given("Usuário selecionou data com base no arquivo de consistência")
    @When("Usuário seleciona data com base no arquivo de consistência")
    public void selectsDate() {
        String dateToType = consistencyFile.getAnyDayGeneralInfo().date;

        calendarPage.userSelectsSpecificDay(dateToType);
    }
}
