package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.WaitUtil;
import com.microsoft.playwright.Locator;

import java.time.Duration;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class HomePage extends CheckedBasePage {

    public HomePage() {
        super(Pattern.compile("^.*/Home$"));
    }

    public void ensureWeAreAtHome() {
        ensureWeAreAtTheCorrectPage();
    }

    public boolean anticipationCardIsVisible() {
        // TODO: change for data-testid
        return waitUntilTrue(() -> page.locator("#LadoDireito").getByText("Antecipação", new Locator.GetByTextOptions().setExact(true)).count() == 1);
    }

    public void clickOnButtonSeeAllInSalesTodaySection() {
        // TODO: fix selector
        Locator btn = page.locator("//a[@href=\"/Hoje\"]/*/span");
        assertThat(btn).containsText("Ver tudo");
        btn.click();
    }

    public void closeAllPopups() {
        Locator closeButton = page.locator(".popup-dialog a");
        while (closeButton.count() != 0) {
            closeButton.click();
            WaitUtil.sleep(Duration.ofMillis(500));
        }
    }
}