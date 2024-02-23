package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.components.DateRangerPage;
import com.fiserv.qabrazil.pages.PageField;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;

import static org.testng.AssertJUnit.assertEquals;

public class CalendarSteps {
    @Autowired
    DateRangerPage calendarPage;

    @When("Usuário seleciona Ontem")
    public void userSelects() {
        calendarPage.userSelectsYesterday();
    }

    @Then("Data seleciona representa dia anterior")
    public void confirmYesterdayIsSelected() {
        int initialDate = PageField.from("Date ranger - Início Data Selecionada").getAsNumber();
        int finalDate = PageField.from("Date ranger - Fim Data Selecionada").getAsNumber();

        Calendar yesterday = Calendar.getInstance();
        yesterday.add(Calendar.DAY_OF_MONTH, -1);

        assertEquals("Dia inicial de 'Ontem' é diferente", yesterday.get(Calendar.DAY_OF_MONTH), initialDate);
        assertEquals("Dia final de 'Ontem' é diferente", yesterday.get(Calendar.DAY_OF_MONTH), finalDate);
    }
}
