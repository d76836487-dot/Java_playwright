package com.fiserv.qabrazil.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.PageField;
import com.microsoft.playwright.Page;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class DateRangerPage {
    @Autowired
    Page page;

    public void userSelectsYesterday() {
        PageField.from("Date ranger - Image").click();
        PageField.from("Date ranger - Ontem").click();
    }
}
