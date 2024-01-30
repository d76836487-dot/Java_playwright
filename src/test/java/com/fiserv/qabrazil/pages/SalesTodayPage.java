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