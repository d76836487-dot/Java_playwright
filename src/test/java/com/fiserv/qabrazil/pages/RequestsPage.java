package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@ScenarioComponent
@Component("Solicitações")
public class RequestsPage extends CheckedBasePage {

    public RequestsPage() {
        super(Pattern.compile("^.+/Solicitacoes"));
    }
}
