package com.fiserv.qabrazil.pages;

import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.util.Currency;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import io.cucumber.java.ParameterType;

import java.text.ParseException;
import java.util.List;
import java.util.stream.Collectors;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static org.testng.Assert.fail;

public class PageField {
    public static BrowserContext context;
    public static Page page;
    private final String displayName;
    private final String selector;
    private final Locator locator;

    public static PageField from(String displayName) {
        return new PageField(displayName);
    }

    public static List<PageField> allWithPrefix(String prefix) {
        return TestIdsConfig.getAllQuerySelector(prefix).stream()
                .map(pair -> from(pair.getKey()))
                .collect(Collectors.toList());
    }

    private PageField(String displayName) {
        this.displayName = displayName;
        selector = TestIdsConfig.getQuerySelector(displayName);
        locator = page.locator(selector);
    }

    public String getAsText() {
        if (!fieldIsOneVisibleAndEnabled()) {
            fail("Found none or more than one/Not visible/Not enabled");
        }

        locator.scrollIntoViewIfNeeded();
        locator.highlight();
        return locator.textContent();
    }

    public Currency getAsCurrency() {
        waitUntilTrue(() -> !quickGetTextContent().equals("R$ 0,00")); // it returns R$ 0,00 before setting the real value...
        String textFromElement = quickGetTextContent();
        try {
            return Currency.parse(textFromElement);
        } catch (ParseException ex) {
            throw new RuntimeException(
                    String.format("Failed parsing currency %s with selector %s", textFromElement, selector), ex);
        }
    }

    private String quickGetTextContent() {
        Locator locator = page.locator(selector);
        return locator.textContent();
    }

    public boolean fieldIsOneVisibleAndEnabled() {
        return waitUntilTrue(9, () -> locator.count() == 1 && locator.isVisible() && locator.isEnabled());
    }

    public boolean elementIsVisible() {
        Locator locator = page.locator(selector);
        return waitUntilTrue(locator::isVisible);
    }

    public boolean isChecked() {
        return page.locator(selector).isChecked();
    }

    public void check() {
        page.locator(selector).check();
    }

    public void uncheck() {
        page.locator(selector).uncheck();
    }

    public void click() {
        Locator locator = page.locator(selector);
        waitUntilTrue(locator::isVisible);
        locator.click();
    }

    public PageObject clickAndNewTabOpens() {
        Locator locator = page.locator(selector);
        waitUntilTrue(locator::isVisible);
        Page newTab = context.waitForPage(locator::click);
        return new PageObject(newTab);
    }

    @ParameterType("\"([^\"]+)\"")
    public static PageField pageField(String displayName) {
        return from(displayName);
    }

    @ParameterType("\"([^\"]+)\" (?:no|na) \"([^\"]+)\"")
    public static PageField pageFieldWithSection(String displayName, String section) {
        return from(section + " - " + displayName);
    }

    @Override
    public String toString() {
        return "Identifier{" +
                "displayName='" + displayName + '\'' +
                '}';
    }
}
