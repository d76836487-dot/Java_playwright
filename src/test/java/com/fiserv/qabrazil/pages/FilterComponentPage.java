package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.microsoft.playwright.Locator;

import java.time.Duration;

import static com.fiserv.qabrazil.util.WaitUtil.retryIfGotException;
import static com.fiserv.qabrazil.util.WaitUtil.sleep;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class FilterComponentPage extends BasePage {

    public void filterAllExcept(String filterValue, String accordionName) {
        openAccordion(accordionName);
        checkAll(accordionName);

        String testId = TestIdsConfig.getTestId("Filter - " + accordionName + " - " + filterValue);
        Locator filterButton = page.getByTestId(testId);
        assertThat(filterButton).isVisible();
        filterButton.click();

        clickToFilter();
    }

    private void checkAll(String accordionName) {
        String checkAllTestId = TestIdsConfig.getTestId("Filter - " + accordionName + " - Check all");
        Locator checkAllButton = page.getByTestId(checkAllTestId);
        assertThat(checkAllButton).isVisible();
        checkAllButton.check();
    }

    public void openAccordion(String accordionName) {
        String accordionTestId = TestIdsConfig.getTestId("Filter - Accordion - " + accordionName);
        Locator accordion = page.getByTestId(accordionTestId);

        retryIfGotException(() -> {
            openFilterOptions();
            accordion.highlight();
            accordion.click();
        });
    }

    private void openFilterOptions() {
        assertThat(page.getByTestId("vendas-hoje-link-filtrar")).isVisible();
        assertThat(page.getByTestId("vendas-hoje-link-filtrar")).isEnabled();

        page.getByTestId("vendas-hoje-link-filtrar").click();
    }

    private void clickToFilter() {
        Locator filterResultsButton = page.getByTestId("generic-filter-btn-resultados");
        filterResultsButton.click();
        sleep(Duration.ofSeconds(2));
    }
}
