package com.fiserv.qabrazil.pages;

import java.util.Objects;
import java.util.regex.Pattern;

public class CheckedBasePage extends BasePage implements CheckCorrectUrl {

    private final Pattern urlPattern;

    public CheckedBasePage(Pattern urlPattern) {
        this.urlPattern = Objects.requireNonNull(urlPattern, "urlPattern must not be null");
    }

    @Override
    public void ensureWeAreAtTheCorrectPage() {
        ensureWeAreAtTheCorrectPage(new PageObject(page));
    }

    @Override
    public void ensureWeAreAtTheCorrectPage(PageObject page) {
        page.waitForURL(urlPattern);
    }
}
