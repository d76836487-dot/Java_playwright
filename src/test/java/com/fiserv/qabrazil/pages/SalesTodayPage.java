package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;

import java.util.regex.Pattern;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class SalesTodayPage extends BasePage {

    public void navigateTo() {
        getLateralMenuLocator().click();
        page.waitForURL(Pattern.compile("^.*/Hoje$"));
    }

    public String getWholeTextIfVisible(String message) {
        Locator element = page.locator(String.format("//*[contains(text(),'%s')]", message));

        if(element == null)
            return "Not found";
        if (!element.isVisible()) {
            return "Not visible";
        }
        return element.textContent();
    }

    public void hoverMenuOnSalesMenu() {
        getLateralMenuLocator().hover();
    }

    public boolean lateralMenuHasExpanded() {
        assertThat(getLateralMenuLocator().locator("//span[contains(text(),'Vendas')]")).isVisible();
        return true;
    }

    private Locator getLateralMenuLocator() {
        return page.getByTestId("menu-vendas").last();
    }
}
