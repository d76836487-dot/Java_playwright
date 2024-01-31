package com.fiserv.qabrazil.config;

import java.util.Map;

public class TestIdsConfig {
    private static final Map<String, String> testIdMaps = Map.of(
            "na seção Vendas Hoje - Ver Tudo", "home-card-vendas-hoje-link-ver-tudo",
            "Filter - Accordion - Status (0)", "generic-filter-accordion-title-status",
            "Filter - Accordion - Bandeiras (0)", "generic-filter-accordion-title-bandeira",
            "Filter - Status (0) - Check all", "generic-filter-check-all-status",
            "Filter - Bandeiras (0) - Check all", "generic-filter-check-all-bandeiras",
            "Filter - Status (0) - Autorizada", "generic-filter-check-status-Autorizada",
            "Filter - Status (0) - Recusada", "generic-filter-check-status-Recusada",
            "Filter - Status (0) - Estornada", "generic-filter-check-status-Estornada",
            "Filter - Bandeiras (0) - Mastercard", "generic-filter-div-bandeira-Mastercard",
            "Filter - Bandeiras (0) - Visa", "generic-filter-div-bandeira-Visa");

    public static String getTestId(String identifier) {
        return testIdMaps.getOrDefault(identifier, "Didn't find test id for " + identifier);
    }
}
