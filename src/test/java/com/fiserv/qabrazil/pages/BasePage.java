package com.fiserv.qabrazil.pages;

import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.Identifier;
import com.fiserv.qabrazil.util.RegexUtil;
import com.fiserv.qabrazil.util.WaitUtil;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.time.Duration;
import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.WaitUtil.sleep;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

public abstract class BasePage {

    @Autowired
    protected ContractConfig contractConfig;

    @Autowired
    protected PageField.Factory pageField;

    @Autowired
    protected Page page;

    public List<Number> getAllNumbersFromCurrencyElement(String testId) {
        List<String> textFromElement = getAllTextsFromElement(testId);
        return textFromElement.stream()
                .map(BasePage::convertToNumber)
                .toList();
    }

    public List<String> getAllTextsFromElement(String testId) {
        return getAllTextsFromElement(Pattern.compile(testId));
    }

    public List<String> getAllTextsFromElement(Pattern testId) {
        waitUntilTrue(() -> page.getByTestId(testId).count() >= 1);
        Locator locator = page.getByTestId(testId);
        if (locator.count() >= 1) {
            locator.first().scrollIntoViewIfNeeded();
            locator.first().highlight();
        }
        return locator.allTextContents();
    }

    public String getTextFromElement(Identifier identifier) {
        return getTextFromElement(identifier.testId());
    }

    public String getTextFromElement(String testId) {
        waitUntilTrue(() -> page.getByTestId(testId).count() == 1);
        Locator locator = page.getByTestId(testId);
        locator.scrollIntoViewIfNeeded();
        locator.highlight();
        return locator.textContent();
    }

    public String getTitle() {
        return page.title();
    }

    public void reload() {
        page.reload();
        sleep(Duration.ofSeconds(3));
    }

    public void hasRedirectedTo(String uri) {
        String url = toUrl(uri);
        assertThat(page).hasURL(Pattern.compile(url));
    }

    private static Number convertToNumber(String text) {
        try {
            return Currency.parseCurrency(text);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public void navigateTo(String path) {
        page.navigate(path);
        assertThat(page).hasTitle(Pattern.compile(".+"));
        closeAllPopups();
    }

    public String toUrl(String uri) {
        return "^" + RegexUtil.escape(contractConfig.getActiveUserProfile().url() + uri) + "$";
    }

    public void closeAllPopups() {
        closeAllPopups(page);
    }

    public static void closeAllPopups(Page page) {
        sleep(Duration.ofMillis(300));
        Locator closeButton = page.locator(".popup-dialog a");
        while (closeButton.count() != 0) {
            closeButton.click();
            WaitUtil.sleep(Duration.ofMillis(500));
        }
    }

    public boolean hasNotLoadingOverlay() {
        return pageField.from("Loading Indicator").getCount() == 0;
    }
}

