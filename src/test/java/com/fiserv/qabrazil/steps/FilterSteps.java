package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.FilterComponentPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class FilterSteps {
    @Autowired
    FilterComponentPage filterComponentPage;

    @When("Usuário filtra por tudo, exceto {string}, em {string}")
    public void userFiltersBy(String filterValue, String accordionName) {
        filterComponentPage.filterAllExcept(filterValue, accordionName);
    }

    @Given("Usuário filtrou por {string} nos {string} de {string}")
    @When("Usuário filtra por {string} nos {string} de {string}")
    public void userFiltersBy(String itemName, String section, String filter) {
        filterComponentPage.filterElementInSection(itemName, section, filter);
    }

    @Then("usuário verá no filtro {string} as opções {csv}")
    public void userWillSeeInFiltersTheOptions(String filter, String[] options) {
        filterComponentPage.allOptionsArePresent(filter, options);
    }
}
