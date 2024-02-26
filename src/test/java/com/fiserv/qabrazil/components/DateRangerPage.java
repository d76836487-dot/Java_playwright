package com.fiserv.qabrazil.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.microsoft.playwright.Page;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.Duration;

import static com.fiserv.qabrazil.util.WaitUtil.sleep;

@ScenarioComponent
public class DateRangerPage extends BasePage {
    @Autowired
    Page page;

    public void userSelectsYesterday() {
        bandaidSMP57();
        pageField.from("Date ranger - Image").click();
        pageField.from("Date ranger - Ontem").click();
    }

    public void userSelectsThisMonth() {
        bandaidSMP57();
        PageField.from("Date ranger - Image").click();
        PageField.from("Date ranger - Mês Atual").click();
    }

    private void bandaidSMP57() {
        // TODO: remove after SMP-57 has been closed
        sleep(Duration.ofSeconds(2));
        page.mouse().wheel(0, 180);
    }
}
