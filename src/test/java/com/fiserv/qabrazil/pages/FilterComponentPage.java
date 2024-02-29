package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;

import java.time.Duration;

import static com.fiserv.qabrazil.pages.PageField.assertThat;
import static com.fiserv.qabrazil.util.WaitUtil.retryIfGotException;
import static com.fiserv.qabrazil.util.WaitUtil.sleep;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class FilterComponentPage extends BasePage {

    public void filterAllExcept(String filterValue, String accordionName) {
        openAccordion(accordionName);
        checkAll(accordionName);

        PageField filterButton = pageField.from("Filter - " + accordionName + " - " + filterValue);
        assertThat(filterButton).isVisible();
        filterButton.click();

        clickToFilter();
    }

    private void checkAll(String accordionName) {
        PageField checkAllButton = pageField.from("Filter - " + accordionName + " - Check all");
        assertThat(checkAllButton).isVisible();
        checkAllButton.check();
    }

    public void openAccordion(String accordionName) {
        Locator accordion = pageField.from("Filter - Accordion - " + accordionName).getLocator();

        retryIfGotException(() -> {
            openFilterOptions();
            accordion.highlight();
            accordion.click();
        });
    }

    private void openFilterOptions() {
        Locator locator = page.getByTestId("vendas-hoje-link-filtrar");
        assertThat(locator).isVisible();
        assertThat(locator).isEnabled();

        locator.click();
    }

    private void clickToFilter() {
        Locator filterResultsButton = page.getByTestId("generic-filter-btn-resultados");
        filterResultsButton.click();
        sleep(Duration.ofSeconds(2));
    }
}
