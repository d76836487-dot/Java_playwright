package com.fiserv.qabrazil.pages;

import com.microsoft.playwright.Page;

import java.util.regex.Pattern;

public class PageObject {

    private final Page page;

    public PageObject(Page page) {
        this.page = page;
    }

    public void waitForURL(Pattern urlPattern) {
        page.waitForURL(urlPattern);
    }
}
