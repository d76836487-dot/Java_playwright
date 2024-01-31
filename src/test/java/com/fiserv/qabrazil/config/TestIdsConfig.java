package com.fiserv.qabrazil.config;

import java.util.Map;

public class TestIdsConfig {
    private static final Map<String, String> testIdMaps = Map.of(
            "na seção Vendas Hoje - Ver Tudo", "home-card-vendas-hoje-link-ver-tudo");

    public static String getTestId(String identifier) {
        return testIdMaps.getOrDefault(identifier, "Didn't find test id for " + identifier);
    }
}
