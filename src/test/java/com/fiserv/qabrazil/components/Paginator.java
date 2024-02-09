package com.fiserv.qabrazil.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.Duration;
import java.util.function.Supplier;

import static com.fiserv.qabrazil.util.WaitUtil.sleep;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;


@ScenarioComponent
public class Paginator extends BasePage {

    @Autowired
    private Page page;

    public boolean thereIsPagination() {
        // TODO: fix for testid
        return waitUntilTrue(
                () -> page.locator("//button[contains(@class,'pagination-button')]").count() > 0);
    }

    public void rewindPagination() {
        // TODO: fix for testid
        Locator previousPageBtn = page.locator("//button[contains(@class,'pagination-button')]").first();
        while (previousPageBtn.isEnabled()) {
            previousPageBtn.click();
            sleep(Duration.ofMillis(500));
        }
    }

    public Boolean anyMatch(Supplier<Boolean> condition) {
        if (!this.thereIsPagination()) return false;
        this.rewindPagination();

        return paginateUntil(condition);
    }

    private boolean paginateUntil(Supplier<Boolean> supplier) {
        // TODO: fix for testid
        Locator nextPageBtn = page.locator("//button[contains(@class,'pagination-button')]").last();
        boolean anyMatches;
        do {
            anyMatches = supplier.get();
            if(nextPageBtn.isEnabled()) {
                nextPageBtn.click();
            }
        } while (nextPageBtn.isEnabled() && !anyMatches);

        return anyMatches;
    }
}
