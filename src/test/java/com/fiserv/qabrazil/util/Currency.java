package com.fiserv.qabrazil.util;

import com.fiserv.qabrazil.config.ContractConfig;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;

@Component
public class Currency {
    @Autowired
    ContractConfig contractConfig;

    public static NumberFormat currencyInstance;

    @PostConstruct
    public void init() {
        currencyInstance = DecimalFormat.getCurrencyInstance(Locale.forLanguageTag(contractConfig.getLocale()));
    }
    public static Number parseCurrency(String currency) throws ParseException {
        return currencyInstance.parse(currency.replace(' ', '\u00A0'));
    }
}
