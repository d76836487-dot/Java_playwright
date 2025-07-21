package com.fiserv.qabrazil.util;

import com.fiserv.qabrazil.enums.PerfilAcessoEnum;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.LoadState;

import java.time.Duration;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

public class GeneralUtils extends WaitUtil {
    private static void pressDigits(Page page, String digits) {
        for (int i = 0; i <= (digits.length() - 1); i++) {
            char digit = digits.charAt(i);

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
            sleep(Duration.ofMillis(1000L));
            i--;
        }
    }

    public static void waitIsVisibleForSeconds(Locator locator, int seconds) {
        int i = seconds;

        while (i > 0) {
            if (locator.isVisible()) {
                assertThat(locator).isVisible();
                locator.scrollIntoViewIfNeeded();
                i = 0;
            } else {
                sleep(Duration.ofMillis(1000L));
                i--;
            }
        }
    }

    public static void waitIsNotVisibleForSeconds(Locator locator, int seconds) {
        int i = seconds;

        while (i > 0) {
            sleep(Duration.ofMillis(1000L));
            i--;
        }

        assertThat(locator).not().isVisible();
    }

    public static void checkIfValueIsNotEmpty(Locator locator) {
        waitIsVisibleForSeconds(locator, Config.WAIT_LEVEL_1);
        assertThat(locator).not().isEmpty();
    }

    public static void click(Locator locator) {
        locator.scrollIntoViewIfNeeded();
        locator.click();
    }

    public static void fillValue(Locator locator, String value) {
        locator.focus();
        locator.clear();
        locator.fill(value);
    }

    public static void fillDigits(Page page, Locator locator, String value) {
        locator.focus();
        locator.clear();
        pressDigits(page, value);
    }

    public static double replaceMonetaryValue(String monetaryValue) {
        return Double.parseDouble(
            monetaryValue
                .replace(" ", "")
                .replace(".", "")
                .replace(",", ".")
                .replace("R$", "")
        );
    }

    public static int getIntLocator(Locator locator) {
        return Integer.parseInt(locator.textContent().trim());
    }

    public static double getDoubleLocator(Locator locator) {
        return replaceMonetaryValue(locator.textContent());
    }

    public static int convertToInt(String value) { return Integer.parseInt(value.trim()); }

    public static double convertToDouble(String value) { return replaceMonetaryValue(value); }

    public static PerfilAcessoEnum getPerfilAcesso(String alianca) {
        return switch (alianca) {
            case "bin" -> PerfilAcessoEnum.BIN;
            case "binCedidos" -> PerfilAcessoEnum.BIN_CEDIDOS;
            case "binFranqueador" -> PerfilAcessoEnum.BIN_FRANQUEADOR;
            case "binFranqueado" -> PerfilAcessoEnum.BIN_FRANQUEADO;
            case "sicredi" -> PerfilAcessoEnum.SICREDI;
            case "sicrediCedidos" -> PerfilAcessoEnum.SICREDI_CEDIDOS;
            case "sicrediFranqueador" -> PerfilAcessoEnum.SICREDI_FRANQUEADOR;
            case "sicrediFranqueado" -> PerfilAcessoEnum.SICREDI_FRANQUEADO;
            case "azulzinha" -> PerfilAcessoEnum.AZULZINHA;
            case "azulzinhaCedidos" -> PerfilAcessoEnum.AZULZINHA_CEDIDOS;
            case "azulzinhaFranqueador" -> PerfilAcessoEnum.AZULZINHA_FRANQUEADOR;
            case "azulzinhaFranqueado" -> PerfilAcessoEnum.AZULZINHA_FRANQUEADO;
            case "afinz" -> PerfilAcessoEnum.AFINZ;
            case "afinzCedidos" -> PerfilAcessoEnum.AFINZ_CEDIDOS;
            case "afinzFranqueador" -> PerfilAcessoEnum.AFINZ_FRANQUEADOR;
            case "afinzFranqueado" -> PerfilAcessoEnum.AFINZ_FRANQUEADO;
            case "claropay" -> PerfilAcessoEnum.CLAROPAY;
            case "claropayCedidos" -> PerfilAcessoEnum.CLAROPAY_CEDIDOS;
            case "claropayFranqueador" -> PerfilAcessoEnum.CLAROPAY_FRANQUEADOR;
            case "claropayFranqueado" -> PerfilAcessoEnum.CLAROPAY_FRANQUEADO;
            default -> PerfilAcessoEnum.BIN;
        };
    }
}