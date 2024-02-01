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

        // TODO: fix for testid
        Locator nextPageBtn = page.locator("//button[contains(@class,'pagination-button')]").last();
        boolean foundSaleWithValue;
        do {
            foundSaleWithValue = foundSalesWithingCurrentPage(textLookingFor, testId);
            nextPageBtn.click();
        } while (nextPageBtn.isEnabled() && !foundSaleWithStatus);

        return foundSaleWithValue;
    }

    private boolean foundSalesWithingCurrentPage(String textLookingFor, String testId) {
        boolean foundSaleWithValue;
        Locator salesStatusLabel = page.getByTestId(Pattern.compile(testId));

        foundSaleWithValue = waitUntilTrue(1, () ->
                salesStatusLabel.filter(new Locator.FilterOptions().setHasText(textLookingFor)).count() > 0);
        return foundSaleWithValue;
    }

    private void rewindPagination() {
        Locator previousPageBtn = page.locator("//button[contains(@class,'pagination-button')]").first();
        while (previousPageBtn.isEnabled()) {
            previousPageBtn.click();
            sleep(Duration.ofMillis(500));
        }
    }
}