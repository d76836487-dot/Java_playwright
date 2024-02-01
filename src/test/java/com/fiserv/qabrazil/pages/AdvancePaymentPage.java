package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;

import java.util.regex.Pattern;

@ScenarioComponent
public class AdvancePaymentPage extends BasePage {

    public void ensureWeAreAtAdvancePaymentPage() {
        page.waitForURL(Pattern.compile("^.*/Antecipacao$"));
    }
}
