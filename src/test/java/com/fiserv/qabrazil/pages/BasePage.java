package com.fiserv.qabrazil.pages;

import com.fiserv.qabrazil.config.ContractConfig;
import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.RegexUtil;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Page;
import org.awaitility.Awaitility;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.ParseException;
import java.time.Duration;
import java.util.List;
import java.util.function.Supplier;
import java.util.regex.Pattern;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

public abstract class BasePage {

    @Autowired
    protected ContractConfig contractConfig;

    @Autowired
    protected BrowserContext context;

    @Autowired
    protected Page page;

    public void sleep(Duration duration) {
        Awaitility.await()
                .pollInSameThread()
                .pollDelay(duration)
                .forever()
                .until(() -> true);
    }

    protected void retryUntilTrue(Runnable runToTry, Supplier<Boolean> untilTrue)  {
        for(int numTries = 0; numTries < 3; numTries++) {
            runToTry.run();
            if (untilTrue.get()) {
                return;
            }
            sleep(Duration.ofSeconds(5));
        }
        throw new RuntimeException("Nao atingiu condição de sucesso...");
    }

    protected boolean waitUntilTrue(Supplier<Boolean> untilTrue) {
        return waitUntilTrue(30, untilTrue);
    }

    protected boolean waitUntilTrue(int totalRetries, Supplier<Boolean> untilTrue)  {
        for(int numTries = 0; numTries < totalRetries; numTries++) {
            try {
                if (untilTrue.get()) {
                    return true;
                }
            } catch (RuntimeException ignored) {}
            sleep(Duration.ofMillis(500));
        }
        return false;
    }

    public List<Number> getAllNumbersFromCurrencyElement(String testId) {
        List<String> textFromElement = getAllTextsFromElement(testId);
        return textFromElement.stream()
                .map(BasePage::convertToNumber)
                .toList();
    }

    public Number getNumberFromCurrencyElement(String testId) {
        waitUntilTrue(() -> !getTextFromElement(testId).equals("R$ 0,00")); // it returns R$ 0,00 before setting the real value...
        String textFromElement = getTextFromElement(testId);
        try {
            return Currency.parseCurrency(textFromElement);
        } catch (ParseException e) {
            throw new RuntimeException(
                    String.format("Failed parsing currency %s with testId %s", textFromElement, testId));
        }
    }

    public List<String> getAllTextsFromElement(String testId) {
        waitUntilTrue(() -> page.getByTestId(testId).count() >= 1);
        return page.getByTestId(testId).allTextContents();
    }

    public String getTextFromElement(String testId) {
        waitUntilTrue(() -> page.getByTestId(testId).count() == 1);
        return page.getByTestId(testId).textContent();
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

    public void goTo(String path) {
        page.navigate(path);
        assertThat(page).hasTitle(Pattern.compile(".+"));
    }

    public String toUrl(String uri) {
        return "^" + RegexUtil.escape(contractConfig.getUrl() + uri) + "$";
    }
}

