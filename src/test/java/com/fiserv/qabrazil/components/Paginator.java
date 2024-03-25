package com.fiserv.qabrazil.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;

import java.time.Duration;
import java.util.Iterator;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.function.Supplier;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import static com.fiserv.qabrazil.util.WaitUtil.sleep;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;


@ScenarioComponent
public class Paginator extends BasePage {

    public boolean thereIsNothingToPaginate() {
        // TODO: fix for testid
        return !waitUntilTrue(
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

    public void forEach(Runnable runnable) {
        if (this.thereIsNothingToPaginate()) return;
        this.rewindPagination();

        new PageIterator(page).stream().forEach(x -> runnable.run());
    }

    public Boolean anyMatch(Supplier<Boolean> condition) {
        if (this.thereIsNothingToPaginate()) return false;
        this.rewindPagination();

        return new PageIterator(page).anyMatch(condition);
    }

    public boolean allMatch(Supplier<Boolean> condition) {
        if (this.thereIsNothingToPaginate()) return true;
        this.rewindPagination();

        return new PageIterator(page).allMatch(condition);
    }

    private static class PageIterator implements Iterator<Void> {

        final Locator nextPageBtn;
        private boolean firstIteration;

        PageIterator(Page page) {
            // TODO: fix for testid
            this.nextPageBtn = page.locator("//button[contains(@class,'pagination-button')]").last();
            firstIteration = true;
        }

        @Override
        public boolean hasNext() {
            return firstIteration || (nextPageBtn.count() > 0 && nextPageBtn.isEnabled());
        }

        @Override
        public Void next() {
            if (firstIteration) {
                firstIteration = false;
            } else {
                nextPageBtn.click();
            }
            return null;
        }

        public boolean anyMatch(Supplier<Boolean> supplier) {
            return stream().anyMatch(x -> supplier.get());
        }

        public boolean allMatch(Supplier<Boolean> supplier) {
            return stream().allMatch(x -> supplier.get());
        }

        private Stream<Object> stream() {
            return StreamSupport.stream(Spliterators.spliteratorUnknownSize(this, Spliterator.ORDERED), false);
        }
    }
}
