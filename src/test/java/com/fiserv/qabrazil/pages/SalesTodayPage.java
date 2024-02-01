package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;

import java.time.Duration;
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
        return thereAreSalesWith(salesStatus, "vendas-hoje-coluna-status\\d");
    }

    public boolean thereAreSalesWithBrandName(String brandName) {
        return thereAreSalesWith(brandName, "vendas-hoje-coluna-bandeira");
    }
    public boolean thereAreSalesWith(String value, String testId) {
        rewindPagination();

        Locator paginationBtn = page.locator("//button[contains(@class,'pagination-button')]").last();

        boolean foundSaleWithValue;
        do {
            Locator salesElements = page.getByTestId(Pattern.compile(testId));

            foundSaleWithValue = waitUntilTrue(1, () ->
                    salesElements.filter(new Locator.FilterOptions().setHasText(value)).count() > 0);

            paginationBtn.click();
        } while (paginationBtn.isEnabled() && !foundSaleWithValue);

        return foundSaleWithValue;
    }

    private void rewindPagination() {
        Locator paginationBtn = page.locator("//button[contains(@class,'pagination-button')]").first();
        while (paginationBtn.isEnabled()) {
            paginationBtn.click();
            sleep(Duration.ofMillis(500));
        }
    }
}