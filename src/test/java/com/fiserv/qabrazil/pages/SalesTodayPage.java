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

    public boolean assertWholeTextIsVisible(String text, String testId) {
        assertThat(page.getByTestId(testId)).hasText(text);
        Locator element = page.getByTestId(testId);
        return element.textContent().equalsIgnoreCase(text) && element.isVisible();
    }

    public String getWholeTextIfVisible(String message) {
        Locator element = page.locator(String.format("//*[contains(text(),'%s')]", message));
        return getWholeTextIfVisible(element);
    }

    public String getWholeTextIfVisible(Locator element) {
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

    public boolean thereAreSalesWithStatus(String salesStatus) {
        Locator paginationBtn = page.locator("//button[contains(@class,'pagination-button')]").last();

        boolean foundSaleWithStatus;
        do {
            Locator salesStatusLabel = page.getByTestId(Pattern.compile("vendas-hoje-coluna-status\\d"));

            foundSaleWithStatus = waitUntilTrue(1, () ->
                    salesStatusLabel.filter(new Locator.FilterOptions().setHasText(salesStatus)).count() > 0);

            paginationBtn.click();
        } while (paginationBtn.isEnabled() && !foundSaleWithStatus);

        return foundSaleWithStatus;
    }
}