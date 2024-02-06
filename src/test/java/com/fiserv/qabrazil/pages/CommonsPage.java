package com.fiserv.qabrazil.pages;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class CommonsPage extends BasePage {

    @Autowired
    ContractConfig contractConfig;

    @Autowired
    BrowserContext browserContext;

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

    public String getApiAccessToken() throws JsonProcessingException {
        String token = browserContext.storageState();

        Map j = new ObjectMapper().readValue(token, Map.class);

        List bla = ((List) ((Map) ((List) j.get("origins")).get(0)).get("localStorage"));
        String value = (String) bla.stream().filter(
                k -> ((Map) k).get("name").equals("$OS_Users$Fiserv$ClientVars$AccessToken")).map(k -> ((Map) k).get("value")).findFirst().orElse(null);
        System.out.printf("AccessToken: %s\n", value);
        return value;
    }
}
