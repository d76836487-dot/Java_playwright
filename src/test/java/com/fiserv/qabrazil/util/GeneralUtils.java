package com.fiserv.qabrazil.util;

import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.LoadState;

import java.time.Duration;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

public class GeneralUtils {
    public static void pressDigit(Page page, Locator locator, String data) {
        locator.focus();

        for (int i = 0; i <= (data.length() - 1); i++) {
            char digit = data.charAt(i);

            if (digit == '0')
                page.keyboard().press("Digit0");
            else if (digit == '1')
                page.keyboard().press("Digit1");
            else if (digit == '2')
                page.keyboard().press("Digit2");
            else if (digit == '3')
                page.keyboard().press("Digit3");
            else if (digit == '4')
                page.keyboard().press("Digit4");
            else if (digit == '5')
                page.keyboard().press("Digit5");
            else if (digit == '6')
                page.keyboard().press("Digit6");
            else if (digit == '7')
                page.keyboard().press("Digit7");
            else if (digit == '8')
                page.keyboard().press("Digit8");
            else if (digit == '9')
                page.keyboard().press("Digit9");
        }
    }

    public static void waitForLoad(Page page, boolean load, boolean domContentLoaded, boolean networkidle) {
        if (load)
            page.waitForLoadState(LoadState.LOAD);
        if (domContentLoaded)
            page.waitForLoadState(LoadState.DOMCONTENTLOADED);
        if (networkidle)
            page.waitForLoadState(LoadState.NETWORKIDLE);
    }

    public static void waitForSeconds(int seconds) {
        int i = seconds;

        while (i > 0) {
            WaitUtil.sleep(Duration.ofMillis(1000L));
            i--;
        }
    }

    public static void waitIsVisibleForSeconds(Locator locator, int seconds) {
        int i = seconds;

        while (i > 0) {
            if (locator.isVisible()) {
                assertThat(locator).isVisible();
                i = 0;
            } else {
                WaitUtil.sleep(Duration.ofMillis(1000L));
                i--;
            }
        }
    }
}