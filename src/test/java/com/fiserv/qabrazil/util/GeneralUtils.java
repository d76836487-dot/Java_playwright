package com.fiserv.qabrazil.util;

import com.fiserv.qabrazil.enums.PerfilAcessoEnum;
import com.microsoft.playwright.Locator;

import java.time.Duration;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

public class GeneralUtils extends WaitUtil {
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

    public static void pressValue(Locator locator, String value) {
        locator.focus();
        locator.clear();
        locator.pressSequentially(value);
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
            case "binSecundario" -> PerfilAcessoEnum.BIN_SECUNDARIO;
            case "binCedidos" -> PerfilAcessoEnum.BIN_CEDIDOS;
            case "binFranqueador" -> PerfilAcessoEnum.BIN_FRANQUEADOR;
            case "binFranqueado" -> PerfilAcessoEnum.BIN_FRANQUEADO;
            case "sicredi" -> PerfilAcessoEnum.SICREDI;
            case "sicrediSecundario" -> PerfilAcessoEnum.SICREDI_SECUNDARIO;
            case "sicrediCedidos" -> PerfilAcessoEnum.SICREDI_CEDIDOS;
            case "sicrediFranqueador" -> PerfilAcessoEnum.SICREDI_FRANQUEADOR;
            case "sicrediFranqueado" -> PerfilAcessoEnum.SICREDI_FRANQUEADO;
            case "azulzinha" -> PerfilAcessoEnum.AZULZINHA;
            case "azulzinhaSecundario" -> PerfilAcessoEnum.AZULZINHA_SECUNDARIO;
            case "azulzinhaCedidos" -> PerfilAcessoEnum.AZULZINHA_CEDIDOS;
            case "azulzinhaFranqueador" -> PerfilAcessoEnum.AZULZINHA_FRANQUEADOR;
            case "azulzinhaFranqueado" -> PerfilAcessoEnum.AZULZINHA_FRANQUEADO;
            case "afinz" -> PerfilAcessoEnum.AFINZ;
            case "afinzSecundario" -> PerfilAcessoEnum.AFINZ_SECUNDARIO;
            case "afinzCedidos" -> PerfilAcessoEnum.AFINZ_CEDIDOS;
            case "afinzFranqueador" -> PerfilAcessoEnum.AFINZ_FRANQUEADOR;
            case "afinzFranqueado" -> PerfilAcessoEnum.AFINZ_FRANQUEADO;
            case "claropay" -> PerfilAcessoEnum.CLAROPAY;
            case "claropaySecundario" -> PerfilAcessoEnum.CLAROPAY_SECUNDARIO;
            case "claropayCedidos" -> PerfilAcessoEnum.CLAROPAY_CEDIDOS;
            case "claropayFranqueador" -> PerfilAcessoEnum.CLAROPAY_FRANQUEADOR;
            case "claropayFranqueado" -> PerfilAcessoEnum.CLAROPAY_FRANQUEADO;
            default -> PerfilAcessoEnum.BIN;
        };
    }
}