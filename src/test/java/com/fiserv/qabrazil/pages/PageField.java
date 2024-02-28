package com.fiserv.qabrazil.pages;

import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.util.Currency;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import io.cucumber.java.ParameterType;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.util.List;
import java.util.stream.Collectors;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static org.testng.Assert.fail;

public class PageField {
    public static class Factory {

        @Autowired
        private BrowserContext context;
        @Autowired
        private Page page;

        public PageField from(String displayName) {
            return new PageField(displayName, context, page);
        }

        public List<PageField> allWithPrefix(String prefix) {
            return TestIdsConfig.getAllQuerySelector(prefix).stream()
                    .map(pair -> from(pair.getKey()))
                    .collect(Collectors.toList());
        }

        @ParameterType("\"([^\"]+)\"")
        public PageField pageField(String displayName) {
            return from(displayName);
        }

        @ParameterType("\"([^\"]+)\" (?:no|na|em) \"([^\"]+)\"")
        public PageField pageFieldWithSection(String displayName, String section) {
            return from(section + " - " + displayName);
        }

    }

    private final String displayName;
    private final BrowserContext context;
    private final String selector;
    private final Locator locator;

    private PageField(String displayName, BrowserContext context, Page page) {
        this.displayName = displayName;
        this.context = context;

        selector = TestIdsConfig.getQuerySelector(displayName);
        locator = page.locator(selector);
    }

    public Locator getLocator() {
        return locator;
    }

    public int getAsNumber() {
        return Integer.parseInt(getAsText());
    }

    public String getAsText() {
        validateIsUsableAndHighlight();
        return locator.textContent();
    }

    public String getInputValue() {
        validateIsUsableAndHighlight();
        return locator.inputValue();
    }

    public List<String> getAllAsText() {
        if (waitUntilTrue(3, () -> locator.count() > 0)) {
            locator.all().get(0).scrollIntoViewIfNeeded();
            locator.all().get(0).highlight();
        }

        return locator.allTextContents();
    }

    public Currency getAsCurrency() {
        waitUntilTrue(() -> !quickGetTextContent().equals("R$ 0,00")); // it returns R$ 0,00 before setting the real value...
        String textFromElement = quickGetTextContent();
        return getParsed(textFromElement);
    }

    public List<Currency> getAllAsCurrency() {
        List<String> textFromElement = getAllAsText();
        return textFromElement.stream()
                .map(this::getParsed)
                .toList();
    }

    private Currency getParsed(String textFromElement) {
        try {
            return Currency.parse(textFromElement);
        } catch (ParseException ex) {
            throw new RuntimeException(
                    String.format("Failed parsing currency %s with selector %s", textFromElement, selector), ex);
        }
    }

    private String quickGetTextContent() {
        return locator.textContent();
    }

    public boolean fieldIsOneVisibleAndEnabled() {
        return waitUntilTrue(() -> locator.count() == 1 && locator.isVisible() && locator.isEnabled());
    }

    public boolean elementIsVisible() {
        return waitUntilTrue(locator::isVisible);
    }

    public boolean elementIsVisibleRightNow() {
        return locator.isVisible();
    }

    public boolean isChecked() {
        return locator.isChecked();
    }

    public void check() {
        locator.check();
    }

    public void uncheck() {
        locator.uncheck();
    }

    public void click() {
        validateIsUsableAndHighlight();
        locator.click();
    }

    private void validateIsUsableAndHighlight() {
        if (foundNone()) fail("Não encontrei nenhum - %s".formatted(selector));
        if (foundMany()) {
            locator.first().scrollIntoViewIfNeeded();
            locator.first().highlight();
            fail("Encontrei mais de um - %s".formatted(selector));
        }

        locator.scrollIntoViewIfNeeded();
        locator.highlight();

        if (!waitUntilTrue(locator::isVisible)) fail("Não é visível - %s".formatted(selector));
        if (!waitUntilTrue(locator::isEnabled)) fail("Não está habilitado - %s".formatted(selector));
    }

    private boolean foundMany() {
        return !waitUntilTrue(() -> locator.count() <= 1);
    }

    private boolean foundNone() {
        return !waitUntilTrue(() -> locator.count() > 0);
    }

    public PageObject clickAndNewTabOpens() {
        waitUntilTrue(locator::isVisible);
        Page newTab = context.waitForPage(locator::click);
        return new PageObject(newTab);
    }

    @Override
    public String toString() {
        return "Identifier{" +
                "displayName='" + displayName + '\'' +
                '}';
    }
}
