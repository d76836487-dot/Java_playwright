package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;

import java.time.Duration;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class FilterComponentPage extends BasePage {
    public void filterAllExcept(String filterValue, String accordionName) {
        openFilterOptions();
        openAccordion(accordionName);
        checkAll();

        Locator filterButton = page.getByTestId(String.format("generic-filter-check-status-%s", filterValue));
        assertThat(filterButton).isVisible();
        filterButton.uncheck();

        clickToFilter();
    }

    private void checkAll() {
        Locator checkAllButton = page.getByTestId("generic-filter-check-all-status");
        assertThat(checkAllButton).isVisible();
        checkAllButton.check();
    }

    private void openFilterOptions() {
        page.getByTestId("vendas-hoje-link-filtrar").click();
    }

    private void openAccordion(String accordionName) {
        Locator accordion = page.getByTestId("generic-filter-accordion-title-status").
                filter(new Locator.FilterOptions().setHasText(accordionName));
        assertThat(accordion).isVisible();
        accordion.click();
    }

    private void clickToFilter() {
        Locator filterResultsButton = page.getByTestId("generic-filter-btn-resultados");
        filterResultsButton.click();
        sleep(Duration.ofSeconds(2));
    }
}
