package com.fiserv.qabrazil.pages;

import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.util.Currency;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import io.cucumber.java.ParameterType;

import java.text.ParseException;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static org.testng.Assert.fail;

public class PageField {
    public static Page page;
    private final String displayName;
    private final String selector;

    public static PageField from(String displayName) {
        return new PageField(displayName);
    }

    private PageField(String displayName) {
        this.displayName = displayName;
        selector = TestIdsConfig.getQuerySelector(displayName);
    }

    public String getAsText() {
        Locator locator = page.locator(selector);

        if (!waitUntilTrue(9, () -> fieldIsOk(locator))) {
            fail("Found none or more than one");
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

    private static boolean fieldIsOk(Locator locator) {
        return locator.count() == 1;
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
