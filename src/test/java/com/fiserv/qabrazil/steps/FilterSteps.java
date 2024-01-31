package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.FilterComponentPage;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class FilterSteps {
    @Autowired
    FilterComponentPage filterComponentPage;

    @When("Usuário filtra por tudo, exceto {string}, em {string}")
    public void usuárioFiltraPor(String filterValue, String accordionName) {
        filterComponentPage.filterAllExcept(filterValue, accordionName);
    }
}
