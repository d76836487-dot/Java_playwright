package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.service.ApiUserDetailsService;
import com.fiserv.qabrazil.components.HeaderComponent;
import io.cucumber.java.en.Given;
import org.springframework.beans.factory.annotation.Autowired;

public class HeaderSteps {
    @Autowired
    HeaderComponent headerComponent;

    @Autowired
    ApiUserDetailsService apiUserDetailsService;

    @Given("Todos os estabelecimentos foram selecionados no header")
    public void allDocumentsWereSelected() throws Exception {
        if (apiUserDetailsService.getEcs().size() == 1) return;

        headerComponent.selectAllDocuments();
    }
}
