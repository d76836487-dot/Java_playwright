package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class CommonsPage extends BasePage {
    @Autowired
    ContractConfig contractConfig;

    public String getButtonWithTextIfVisible(String buttonTitle) {
        return getWholeTextIfVisible(page.getByRole(AriaRole.BUTTON,
                new Page.GetByRoleOptions().setName(buttonTitle)));
    }

    public String getWholeTextIfVisible(Locator locator) {
        waitUntilTrue(9, () -> locator.count() == 1);

        if (!locator.isVisible()) {
            return "Not visible";
        }
        return locator.textContent();
    }

    public void navigateToRoot() {
        page.navigate(contractConfig.getActiveUserProfile().url());
        assertThat(page).hasTitle(Pattern.compile(".+"));
    }

    public void clickButtonWithText(String buttonText) {
        page.getByText(buttonText).click();
    }

    public boolean elementIsVisibleNoWait(String dataTestId) {
        Locator locator = page.getByTestId(dataTestId);
        return locator.count() > 0 && locator.isVisible();
    }

    public boolean lateralMenuHasExpandedContaining(String identifier) {
        String buttonId = TestIdsConfig.getQuerySelector(String.format("Menu Lateral - %s", identifier));
        Locator button = page.locator(buttonId).last();
        assertThat(button).isVisible();
        assertThat(button.getByText(identifier)).isVisible();
        return true;
    }

    public List<String> getAllDataTestIds(String testId) {
        Locator allLocator = page.getByTestId(Pattern.compile(testId));
        return allLocator.all().stream()
                .map(locator -> locator.getAttribute("data-testid"))
                .toList();
    }

    public void scroll(int deltaY) {
        page.mouse().wheel(0, deltaY);
    }

    public void scrollToBottom() {
        Integer result = (Integer) page.evaluate("document.body.scrollHeight");
        page.mouse().wheel(0, result);
    }
}
