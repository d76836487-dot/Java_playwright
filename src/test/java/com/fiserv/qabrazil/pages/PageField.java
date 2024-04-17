package com.fiserv.qabrazil.pages;

import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.util.Currency;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.assertions.LocatorAssertions;
import io.cucumber.java.ParameterType;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static org.testng.Assert.fail;

public class PageField {

    public static LocatorAssertions assertThat(PageField pageField) {
        return new PageFieldAssertions(pageField);
    }

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

        @ParameterType("\"([^\"]+)\" (?:no|na|em|na seção) \"([^\"]+)\"")
        public PageField pageFieldWithSection(String displayName, String section) {
            return from(section + " - " + displayName);
        }

        @ParameterType("\"([^\"]+)\" o \"([^\"]+)\"")
        public PageField sectionWithPageField(String section, String displayName) {
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

    private PageField(String displayName, BrowserContext context, String selector, Locator locator) {
        this.displayName = displayName;
        this.context = context;
        this.selector = selector;
        this.locator = locator;
    }

    public List<PageField> getAllPageField() {
        return allPageField().toList();
    }

    public List<PageField> getAllVisiblePageField() {
        return allVisiblePageField().toList();
    }

    public Optional<PageField> firstWith(Predicate<PageField> condition) {
        return allPageField()
                .filter(condition)
                .findFirst();
    }

    public PageField firstOf() {
        return allVisiblePageField().findFirst().orElseThrow(() -> new RuntimeException("Couldn't find any of %s".formatted(selector)));
    }

    public Stream<PageField> allVisiblePageField() {
        return locator.all().stream()
                .filter(Locator::isVisible)
                .map(sublocator -> new PageField(displayName, context, selector, sublocator));
    }

    private Stream<PageField> allPageField() {
        return locator.all().stream()
                .map(sublocator -> new PageField(displayName, context, selector, sublocator));
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
            highlightIfPossible();
        }

        return locator.allTextContents();
    }

    public Currency getAsCurrency() {
        waitUntilTrue(() -> !quickGetTextContent().equals("R$ 0,00") || !quickGetTextContent().equals("- R$ 0,00")); // it returns R$ 0,00 before setting the real value...
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
            textFromElement = textFromElement.replaceAll("- R\\$", "-R\\$");
            textFromElement = textFromElement.replaceAll("(R\\$)\\D*", "$1 ");
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

    public boolean fieldIsOneVisibleAndDisabled() {
        waitUntilTrue(() -> locator.count() == 1);
        highlightIfPossible();
        return waitUntilTrue(() -> locator.count() == 1 && locator.isVisible() && !locator.isEnabled());
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

    public void hoverOver() {
        locator.last().hover();
    }

    public void hoverAway() {
        locator.last().page().mouse().move(0, 0);
    }

    public void click() {
        validateIsUsableAndHighlight();
        locator.click();
    }

    private void validateIsUsableAndHighlight() {
        if (foundNone()) fail("Não encontrei nenhum - %s".formatted(selector));
        if (foundMany()) {
            highlightIfPossible();
            fail("Encontrei mais de um - %s".formatted(selector));
        }

        highlightIfPossible();

        if (!waitUntilTrue(locator::isVisible)) fail("Não é visível - %s".formatted(selector));
        if (!waitUntilTrue(120, locator::isEnabled)) fail("Não está habilitado - %s".formatted(selector));
    }

    private boolean foundMany() {
        return !waitUntilTrue(() -> locator.count() <= 1);
    }

    private boolean foundNone() {
        return !waitUntilTrue(() -> locator.count() > 0);
    }

    public String getPlaceholder() {
        return locator.getAttribute("placeholder");
    }

    public String getDisplayName() {
        return displayName;
    }

    public void pressSequentially(String textToType) {
        locator.pressSequentially(textToType);
    }

    public int getCount() {
        return locator.count();
    }

    public List<String> getClasses() {
        return List.of(getLocator().getAttribute("class").split(" "));
    }

    public PageObject clickAndNewTabOpens() {
        waitUntilTrue(locator::isVisible);
        Page newTab = context.waitForPage(locator::click);
        BasePage.closeAllPopups(newTab);
        return new PageObject(newTab);
    }

    void highlightIfPossible() {
        if (locator.count() >= 1) {
            locator.first().scrollIntoViewIfNeeded();
            locator.first().highlight();
        }
    }

    public boolean attributeDataTestidContainsAnyOf(List<String> texts) {
        return texts.stream().anyMatch(this::attributeDataTestidContains);
    }

    public boolean attributeDataTestidContains(String text) {
        return locator.getAttribute("data-testid").contains(text);
    }

    @Override
    public String toString() {
        return "Identifier{" +
                "displayName='" + displayName + '\'' +
                '}';
    }
}
