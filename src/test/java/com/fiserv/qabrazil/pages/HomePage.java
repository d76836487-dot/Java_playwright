package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;

import java.util.regex.Pattern;

@ScenarioComponent
public class HomePage extends BasePage {

    public void ensureWeAreAtHome() {
        page.waitForURL(Pattern.compile("^.*/Home$"));
    }

    public boolean anticipationCardIsVisible() {
        // TODO: change for data-testid
        return waitUntilTrue(() -> page.locator("#LadoDireito").getByText("Antecipação", new Locator.GetByTextOptions().setExact(true)).count() == 1);
    }

    public void clickOnButtonSeeAllInSalesTodaySection() {
        // TODO: fix selector
        Locator btn = page.locator("//a[@href=\"/Hoje\"]/*/span");
        assert btn.textContent().equals("Ver tudo");
        btn.click();
    }
}