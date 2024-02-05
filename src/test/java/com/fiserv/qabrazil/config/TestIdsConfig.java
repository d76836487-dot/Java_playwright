package com.fiserv.qabrazil.config;

import java.util.Map;
import static java.util.Map.entry;

public class TestIdsConfig {
    private static final Map<String, String> testIdMaps = Map.ofEntries(
            entry("na seção Vendas Hoje - Ver Tudo", "home-card-vendas-hoje-link-ver-tudo"),
            entry("Filter - Accordion - Status (0)", "generic-filter-accordion-title-status"),
            entry("Filter - Accordion - Bandeiras (0)", "generic-filter-accordion-title-bandeira"),
            entry("Filter - Status (0) - Check all", "generic-filter-check-all-status"),
            entry("Filter - Bandeiras (0) - Check all", "generic-filter-check-all-bandeiras"),
            entry("Filter - Status (0) - Autorizada", "generic-filter-check-status-Autorizada"),
            entry("Filter - Status (0) - Recusada", "generic-filter-check-status-Recusada"),
            entry("Filter - Status (0) - Estornada", "generic-filter-check-status-Estornada"),

            entry("Filter - Produtos (0) - Crédito", "generic-filter-check-produto-Crédito"),
            entry("Filter - Produtos (0) - Crédito Internacional", "generic-filter-check-produto-Crédito-Internacional"),
            entry("Filter - Produtos (0) - Débito", "generic-filter-check-produto-Débito"),
            entry("Filter - Produtos (0) - Débito Internacional", "generic-filter-check-produto-Débito-Internacional"),
            entry("Filter - Produtos (0) - Refeição", "generic-filter-check-produto-Refeição"),
            entry("Filter - Produtos (0) - Alimentação", "generic-filter-check-produto-Alimentação"),
            entry("Filter - Produtos (0) - Premium", "generic-filter-check-produto-Premium"),
            entry("Filter - Produtos (0) - Cultura", "generic-filter-check-produto-Cultura"),
            entry("Filter - Produtos (0) - Auto", "generic-filter-check-produto-Auto"),
            entry("Filter - Produtos (0) - Gift", "generic-filter-check-produto-Gift"),
            entry("Filter - Produtos (0) - Corporativo", "generic-filter-check-produto-Corporativo"),
            entry("Filter - Produtos (0) - Benefícios", "generic-filter-check-produto-Benefícios"),
            entry("Filter - Produtos (0) - Mutiplo", "generic-filter-check-produto-Multiplo"),

            entry("Filter - Bandeiras (0) - Mastercard", "generic-filter-div-bandeira-Mastercard"),
            entry("Filter - Bandeiras (0) - Visa", "generic-filter-div-bandeira-Visa"),

            entry("Vendas Hoje - Resumo - Quantidade Vendas", "vendas-hoje-card-total-vendas"),
            entry("Vendas Hoje - Resumo - Valor Vendas", "vendas-hoje-card-vlr-bruto"),

            entry("Home - Card Vendas Hoje - Valor Vendas Hoje", "home-card-vendas-hoje-text-vlr"),
            entry("Home - Card Vendas Hoje - Percentual Vendas Hoje", "home-card-vendas-hoje-text-percentual-down"),

            entry("Home - Card Recebimento - Total Recebimento", "home-card-recebimentos-text-vlrliquido"),
            entry("Home - Card Recebimento - Recebimento Hoje", "home-card-recebimentos-text-vlrliquido-hoje"),
            entry("Home - Card Recebimento - Recebimento Previsto", "home-card-recebimentos-text-vlrliquido-previsto")
            );


    // TODO: trocar por data-testid
    private static final Map<String, String> otherSelectors = Map.ofEntries(
            entry("item Antecipação no acesso rápido", ".ContainersDesktop [href='/Antecipacao']"),
            entry("item Relatórios no acesso rápido", ".ContainersDesktop #Link_Relatorios")
    );

    public static String getTestId(String identifier) {
        return testIdMaps.getOrDefault(identifier, "Didn't find test id for " + identifier);
    }

    public static String getQuerySelector(String identifier) {
        if (testIdMaps.containsKey(identifier)) {
            return "[data-testid=" + getTestId(identifier) + "]";
        } else if (otherSelectors.containsKey(identifier)) {
            return otherSelectors.get(identifier);
        }
        throw new IllegalArgumentException("No selector found for " + identifier);
    }
}
