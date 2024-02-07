package com.fiserv.qabrazil.util;

import com.fiserv.qabrazil.pages.CheckCorrectUrl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class UrlCheckers {

    @Autowired
    Map<String, CheckCorrectUrl> urlCheckers;

    public CheckCorrectUrl forPage(String pageName) {
        CheckCorrectUrl pageChecker = urlCheckers.get(pageName);
        if (pageChecker == null) {
            throw new IllegalArgumentException("Cannot check correct url for page " + pageName);
        }
        return pageChecker;
    }
}
