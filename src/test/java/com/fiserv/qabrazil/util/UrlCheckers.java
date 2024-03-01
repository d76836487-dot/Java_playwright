package com.fiserv.qabrazil.util;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.CheckCorrectUrl;
import com.fiserv.qabrazil.pages.PageObject;
import com.microsoft.playwright.Page;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;
import java.util.regex.Pattern;

@ScenarioComponent
public class UrlCheckers {

    @Autowired
    Page page;

    @Autowired
    Map<String, CheckCorrectUrl> urlCheckers;

    public CheckCorrectUrl forPage(String pageName) {
        CheckCorrectUrl pageChecker = urlCheckers.get(pageName);
        if (pageChecker == null) {
            throw new IllegalArgumentException("Cannot check correct url for page " + pageName);
        }
        return pageChecker;
    }

    public CheckCorrectUrl forUrl(String url) {
        Pattern urlPattern = Pattern.compile("^" + RegexUtil.escape(url) + "$");
        return new CheckCorrectUrl() {
            @Override
            public void ensureWeAreAtTheCorrectPage() {
                ensureWeAreAtTheCorrectPage(new PageObject(page));
            }

            @Override
            public void ensureWeAreAtTheCorrectPage(PageObject page) {
                page.waitForURL(urlPattern);
            }
        };
    }
}
