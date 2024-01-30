package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;

import java.util.regex.Pattern;

@ScenarioComponent
public class HomePage extends BasePage {

    public void ensureWeAreAtHome() {
        page.waitForURL(Pattern.compile("^.*/Home$"));
    }
}