package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class CommonsPage {

    @Autowired
    Page page;

    public String getWholeTextIfVisible(String message) {
        assertThat(page.locator(String.format("//*[contains(text(),'%s')]", message))).hasCount(1);

        Locator element = page.locator(String.format("//*[contains(text(),'%s')]", message));

        if (!element.isVisible()) {
            return "Not visible";
        }
        return element.textContent();
    }

}
