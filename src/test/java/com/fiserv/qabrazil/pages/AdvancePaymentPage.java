package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

import static com.fiserv.qabrazil.config.TestIdsConfig.getQuerySelector;

@ScenarioComponent
@Component("Antecipação")
public class AdvancePaymentPage extends CheckedBasePage {

    public AdvancePaymentPage() {
        super(Pattern.compile("^.*/Antecipacao$"));
    }

    public void navigateTo() {
        String linkTo = getQuerySelector("Menu Lateral - Antecipação");
        page.locator(linkTo).last().click();
        page.waitForURL(Pattern.compile("^.*/Antecipacao$"));
    }
}
