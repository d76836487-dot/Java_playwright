package com.fiserv.qabrazil.steps.home;

import com.fiserv.automation.api.dto.EcCodsDto;
import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.qabrazil.util.UrlCheckers;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.assertj.core.api.Assumptions.assumeThat;

public class ReceivableUnitReceiptScheduleSteps extends BaseSteps {

    @Autowired
    ApiUserDetailsService apiUserDetailsService;

    @Autowired
    UrlCheckers urlCheckers;

    @Given("instituição tem apenas um documento")
    public void institutionHasOnlyOneDocument() throws Exception {
        List<String> documents = apiUserDetailsService.getUserDetail().ecCods.stream()
                .map(EcCodsDto::getDocument)
                .distinct()
                .toList();

        assumeThat(documents)
                .hasSize(1);
    }

    @Then("usuário visualizará em {string} do respectivo Documento sem a Opção no Header de Alterar Documento")
    public void ensureWeAreAtTheCorrectPageAndHeaderDoNotHaveChangeDocument(String pageName) {
        urlCheckers.forPage(pageName).ensureWeAreAtTheCorrectPage();
    }
}
