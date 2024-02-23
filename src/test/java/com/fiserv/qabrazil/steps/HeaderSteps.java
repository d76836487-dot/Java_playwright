package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.components.HeaderComponent;
import io.cucumber.java.en.Given;
import org.springframework.beans.factory.annotation.Autowired;

public class HeaderSteps {
    @Autowired
    HeaderComponent headerComponent;

    @Given("Todos os estabelecimentos foram selecionados no header")
    public void allDocumentsWereSelected() {
        headerComponent.selectAllDocuments();
    }
}
