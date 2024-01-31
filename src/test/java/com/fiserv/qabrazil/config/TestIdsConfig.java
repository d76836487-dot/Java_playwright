package com.fiserv.qabrazil.config;

import java.util.Map;

public class TestIdsConfig {
    private static final Map<String, String> testIdMaps = Map.of(
            "na seção Vendas Hoje - Ver Tudo", "home-card-vendas-hoje-link-ver-tudo",
            "Filter - Accordion - Status (0)", "generic-filter-accordion-title-status",
            "Filter - Accordion - Bandeiras (0)", "generic-filter-accordion-title-bandeira",
            "Filter - Status (0) - Check all", "generic-filter-check-all-status",
            "Filter - Bandeiras (0) - Check all", "generic-filter-check-all-bandeiras",
            "Filter - Status (0) - Test root", "generic-filter-check-status-",
            "Filter - Bandeiras (0) - Test root", "generic-filter-div-bandeira-");

    public static String getTestId(String identifier) {
        return testIdMaps.getOrDefault(identifier, "Didn't find test id for " + identifier);
    }
}
