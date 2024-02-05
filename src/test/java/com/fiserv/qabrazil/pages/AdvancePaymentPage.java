package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@ScenarioComponent
@Component("Antecipação")
public class AdvancePaymentPage extends CheckedBasePage {

    public AdvancePaymentPage() {
        super(Pattern.compile("^.*/Antecipacao$"));
    }
}
