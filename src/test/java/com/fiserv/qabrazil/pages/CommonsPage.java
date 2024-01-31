package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.regex.Pattern;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class CommonsPage extends BasePage{

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
        waitUntilTrue(3, () -> locator.count() == 1);

        if (!locator.isVisible()) {
            return "Not visible";
        }
        return locator.textContent();
    }

    public boolean assertWholeTextIsVisible(String text, String testId) {
        assertThat(page.getByTestId(testId)).hasText(text);
        Locator element = page.getByTestId(testId);
        return element.textContent().equalsIgnoreCase(text) && element.isVisible();
    }

    public void navigateToRoot() {
        page.navigate("https://" + contractConfig.getUrl());
        assertThat(page).hasTitle(Pattern.compile(".+"));
    }

    public void clickButtonWithText(String buttonText) {
        page.getByText(buttonText).click();
    }

    public void clickButtonTestId(String testId) {
        Locator locator = page.getByTestId(testId);
        assertThat(locator).isVisible();
        locator.click();
    }
}
