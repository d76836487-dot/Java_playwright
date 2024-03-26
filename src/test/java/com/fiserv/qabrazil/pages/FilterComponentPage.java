package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;

import java.time.Duration;
import java.util.Arrays;
import java.util.List;

import static com.fiserv.qabrazil.pages.PageField.assertThat;
import static com.fiserv.qabrazil.util.WaitUtil.retryIfGotException;
import static com.fiserv.qabrazil.util.WaitUtil.sleep;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;
import static org.testng.AssertJUnit.fail;

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

    public void allOptionsArePresent(String filter, String[] options) {
        Arrays.stream(options).forEach(o -> validateIsPresentAndVisible(o, filter));
    }

    private void validateIsPresentAndVisible(String option, String filter) {
        pageField.from(filter)
                .firstWith(x -> x.attributeDataTestidContains(option))
                .ifPresentOrElse(
                        el -> validateIsVisible(el, option),
                        () -> fail("Não foi encontrado o filtro %s".formatted(option))
                );
    }

    private void validateIsVisible(PageField filterOption, String option) {
        if(!filterOption.elementIsVisibleRightNow()) fail("O filtro não está visível: %s".formatted(option));
    }

    public void filterElementInSection(String itemName, String section, String filter) {
        pageField.from(section + " - Item " + filter)
                .firstWith(a -> a.attributeDataTestidContains(itemName))
                .ifPresentOrElse(el -> {

                    if(!el.elementIsVisibleRightNow()) {
                        pageField.from(section + " - Accordion " + filter).click();
                    }

                    el.check();
                    clickToFilter();
                },
                () -> fail("Nenhum filtro de %s encontrado".formatted(itemName))
        );
    }

    public List<String> getEcsAvailableForFilter(String displayName) {
        return pageField.from(displayName).allVisiblePageField()
                .map(field -> field.getLocator().getAttribute("data-testid"))
                .map(testId -> testId.replaceAll("\\D", ""))
                .toList();
    }
}
