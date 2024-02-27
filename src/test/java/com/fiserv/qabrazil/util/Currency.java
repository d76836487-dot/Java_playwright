package com.fiserv.qabrazil.util;

import com.fiserv.qabrazil.config.ContractConfig;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;

public class Currency {

    @Component
    static class Config {

        @Autowired
        ContractConfig contractConfig;

        @PostConstruct
        public void init() {
            currencyInstance = DecimalFormat.getCurrencyInstance(Locale.forLanguageTag(contractConfig.getActiveUserProfile().locale()));
        }
    }

    private static NumberFormat currencyInstance;

    private final double value;

    public Currency(double value) {
        this.value = value;
    }

    public static Number parseCurrency(String currency) throws ParseException {
        return currencyInstance.parse(currency.replace(' ', '\u00A0'));
    }

    public static Currency parse(String text) throws ParseException {
        return new Currency(currencyInstance.parse(text.replace(' ', '\u00A0')).doubleValue());
    }

    public double doubleValue() {
        return value;
    }
}
