package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;

import java.util.regex.Pattern;

@ScenarioComponent
public class ReportsPage extends BasePage {
    public void ensureWeAreAtReportsPage() {
        page.waitForURL(Pattern.compile("^.*/Relatorios$"));
    }
}
