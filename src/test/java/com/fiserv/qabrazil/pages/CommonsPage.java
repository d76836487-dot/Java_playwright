package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.regex.Pattern;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class CommonsPage extends BasePage {

    @Autowired
    ContractConfig contractConfig;

    public String getWholeTextIfVisible(String message) {
        return getWholeTextIfVisible(page.locator(String.format("//*[contains(text(),'%s')]", message)));
    }

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
        page.navigate(contractConfig.getUrl());
        assertThat(page).hasTitle(Pattern.compile(".+"));
    }

    public void clickButtonWithText(String buttonText) {
        page.getByText(buttonText).click();
    }

    public void clickButton(String selector) {
        Locator locator = page.locator(selector);
        waitUntilTrue(locator::isVisible);
        locator.click();
    }

    public PageObject clickButtonAndNewTabOpens(String selector) {
        Locator locator = page.locator(selector);
        waitUntilTrue(locator::isVisible);
        Page newTab = context.waitForPage(locator::click);
        return new PageObject(newTab);
    }

    public boolean elementIsVisible(String selector) {
        Locator locator = page.locator(selector);
        return waitUntilTrue(locator::isVisible);
    }

    public void hoverOver(String selector) {
        Locator locator = page.locator(selector).last();
        locator.hover();
    }

    public boolean lateralMenuHasExpandedContaining(String identifier) {
        String buttonId = TestIdsConfig.getQuerySelector(String.format("Menu Lateral - %s", identifier));
        Locator button = page.locator(buttonId).last();
        assertThat(button).isVisible();
        assertThat(button.getByText(identifier)).isVisible();
        return true;
    }
}
