package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.CommonsPage;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertEquals;

public class CommonsSteps {

    @Autowired
    CommonsPage commonsPage;

    @Then("Usuário verá mensagem {string}")
    public void userWillSeeMessage(String expectedMessage) {
        String message = commonsPage.getWholeTextIfVisible(expectedMessage.substring(0, 10));
        assertEquals("Mensagem não encontrada na página", expectedMessage, message);
    }

}
