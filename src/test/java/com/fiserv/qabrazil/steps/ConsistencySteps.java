package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.consistency.ConsistencyFile;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.Map;

import static org.testng.AssertJUnit.assertEquals;

public class ConsistencySteps extends BaseSteps {
    @Autowired
    ConsistencyFile consistencyFile;

    @Given("Carregou arquivo com histórico do {string} de {int} dias úteis")
    public void thereIsFileWithInfo(String screen, int weekday) throws IOException {
        consistencyFile.loadForOneDay(screen, weekday);
    }

    @Then("Campo {string} terá mesmo valor que consultado antes, salvando em arquivo")
    public void assertSameValueAndSave(String displayName) {
        String actualValue = pageField.from(displayName).getAsText();
        compareValueWithFile(displayName, actualValue);
    }

    @Then("Campo {string} terá valor {string}, salvando em arquivo")
    public void assertSameValueAndSave(String displayName, String actualValue) {
        compareValueWithFile(displayName, actualValue);
    }

    private void compareValueWithFile(String displayName, String actualValue) {
        Map<String, String> values = consistencyFile.getAnyDayGeneralInfo().values;
        String expectedValue = values.get(displayName);

        if (hasOlderReferenceToCompare(expectedValue)) {
            assertEquals(expectedValue, actualValue);
        } else {
            values.put(displayName, actualValue);
            consistencyFile.saveFile();
        }
    }

    private static boolean hasOlderReferenceToCompare(String expectedValue) {
        return expectedValue != null;
    }
}
