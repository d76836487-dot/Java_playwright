package com.fiserv.qabrazil.pages;

import com.fiserv.qabrazil.config.TestIdsConfig;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import io.cucumber.java.ParameterType;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

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
            return "Found more than one/Not visible/Not Enabled";
        }

        locator.scrollIntoViewIfNeeded();
        locator.highlight();
        return locator.textContent();
    }

    private static boolean fieldIsOk(Locator locator) {
        return locator.count() == 1 && locator.isVisible() && locator.isEnabled();
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
