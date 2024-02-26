package com.fiserv.qabrazil.config;

import org.apache.commons.lang3.tuple.Pair;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.Map.entry;

public class TestIdsConfig {
    private static final Map<String, String> testIdMaps = Map.<String, String>ofEntries(
            entry("na seção Vendas Hoje - Ver Tudo", "home-card-vendas-hoje-link-ver-tudo"),
            entry("Filter - Accordion - Status (0)", "generic-filter-accordion-title-status"),
            entry("Filter - Accordion - Bandeiras (0)", "generic-filter-accordion-title-bandeira"),
            entry("Filter - Accordion - Produtos (0)", "generic-filter-accordion-title-produtos"),
            entry("Filter - Accordion - Estabelecimento (0)", "generic-filter-accordion-title-estabelecimentos"),
            entry("Filter - Status (0) - Check all", "generic-filter-check-all-status"),
            entry("Filter - Bandeiras (0) - Check all", "generic-filter-check-all-bandeiras"),
            entry("Filter - Produtos (0) - Check all", "generic-filter-check-all-produtos"),
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

            entry("Filter - Estabelecimentos (0)", "generic-filter-check-estabelecimento-.*"),

            entry("Vendas Hoje - Resumo - Quantidade Vendas", "vendas-hoje-card-total-vendas"),
            entry("Vendas Hoje - Resumo - Valor Vendas", "vendas-hoje-card-vlr-bruto"),
            entry("Vendas Hoje - Histórico - Coluna Valor Bruto", "vendas-hoje-coluna-vlr-bruto\\d"),
            entry("Vendas Hoje - Histórico - Coluna Data Hora", "vendas-hoje-coluna-data-venda"),
            entry("Vendas Hoje - Histórico - Coluna Produto", "vendas-hoje-coluna-produto"),
            entry("Vendas Hoje - Histórico - Coluna Parcela", "vendas-hoje-coluna-parcela"),
            entry("Vendas Hoje - Histórico - Coluna Canal", "vendas-hoje-coluna-canal"),
            entry("Vendas Hoje - Histórico - Coluna Terminal", "vendas-hoje-coluna-terminal"),
            entry("Vendas Hoje - Histórico - Coluna Status", "vendas-hoje-coluna-status\\d"),
            entry("Vendas Hoje - Histórico - Coluna Estabelecimento", "vendas-hoje-coluna-estabelecimento\\d"),

            entry("Header - Notificações", "head-notificacoes"),

            entry("Home - Card Vendas Hoje - Valor Vendas Hoje", "home-card-vendas-hoje-text-vlr"),
            entry("Home - Card Vendas Hoje - Percentual Vendas Hoje", "home-card-vendas-hoje-text-percentual-down"),

            entry("Home - Card Recebimento - Total Recebimento", "home-card-recebimentos-text-vlrliquido"),
            entry("Home - Card Recebimento - Recebimento Hoje", "home-card-recebimentos-text-vlrliquido-hoje"),
            entry("Home - Card Recebimento - Recebimento Previsto", "home-card-recebimentos-text-vlrliquido-previsto"),

            entry("Home - Card Últimas Vendas - Valor", "home-card-ultimas-vendas-text-valor-venda"),
            entry("Home - Card Últimas Vendas - Tipo", "home-card-ultimas-vendas-text-tipo-venda"),
            entry("Home - Card Últimas Vendas - Data", "home-card-ultimas-vendas-text-data-venda"),
            entry("Home - Card Últimas Vendas - Hora", "home-card-ultimas-vendas-text-hora-venda"),

            entry("Home - Card Antecipação - ECs", "home-card-antecipacao-text-ec"),
            entry("Home - Card Antecipação - Valor", "home-card-antecipacao-text-valor"),
            entry("Home - Card Antecipação - Botão Ir", "home-card-antecipacao-btn-antecipacao"),

            entry("Home - acesso rápido - item Antecipação", "home-card-personalizar-link-antecipacao"),
            entry("Home - acesso rápido - item Relatórios", "home-card-personalizar-link-relatorios"),
            entry("Home - acesso rápido - item Informe de rendimento", "home-card-personalizar-link-informe-rendimento"),
            entry("Home - acesso rápido - item Vendas", "home-card-personalizar-link-vendas"),
            entry("Home - acesso rápido - item Solicitações", "home-card-personalizar-link-solicitacoes"),
            entry("Home - acesso rápido - item Meu negócio", "home-card-personalizar-link-negocio"),

            entry("Home - personalizar - item Antecipação", "home-personalizar-check-antecipacao"),
            entry("Home - personalizar - item Relatórios", "home-personalizar-check-relatorios"),
            entry("Home - personalizar - item Informe de rendimento", "home-personalizar-check-informe-rendimento"),
            entry("Home - personalizar - item Vendas", "home-personalizar-check-vendas"),
            entry("Home - personalizar - item Solicitações", "home-personalizar-check-solicitacoes"),
            entry("Home - personalizar - item Meu negócio", "home-personalizar-check-negocio"),
            entry("Home - personalizar - botão confirmar", "home-personalizar-btn-personalizar"),

            entry("Home - Agenda Recebimento - Dia Segunda", "home-card-recebimentos-semana-text-dia-segunda"),
            entry("Home - Agenda Recebimento - Mês Segunda", "home-card-recebimentos-semana-text-mes-segunda"),
            entry("Home - Agenda Recebimento - Dia da semana Segunda", "home-card-recebimentos-semana-text-segunda"),
            entry("Home - Agenda Recebimento - Valor Segunda", "home-card-recebimentos-semana-text-segunda-valor"),
            entry("Home - Agenda Recebimento - Qtd Depósitos Segunda", "home-card-recebimentos-semana-text-segunda-qtd-depositos"),
            entry("Home - Agenda Recebimento - Dia Terça", "home-card-recebimentos-semana-text-dia-terca"),
            entry("Home - Agenda Recebimento - Mês Terça", "home-card-recebimentos-semana-text-mes-terca"),
            entry("Home - Agenda Recebimento - Dia da semana Terça", "home-card-recebimentos-semana-text-terca"),
            entry("Home - Agenda Recebimento - Valor Terça", "home-card-recebimentos-semana-text-terca-valor"),
            entry("Home - Agenda Recebimento - Qtd Depósitos Terça", "home-card-recebimentos-semana-text-terca-qtd-depositos"),
            entry("Home - Agenda Recebimento - Dia Quarta", "home-card-recebimentos-semana-text-dia-quarta"),
            entry("Home - Agenda Recebimento - Mês Quarta", "home-card-recebimentos-semana-text-mes-quarta"),
            entry("Home - Agenda Recebimento - Dia da semana Quarta", "home-card-recebimentos-semana-text-quarta"),
            entry("Home - Agenda Recebimento - Valor Quarta", "home-card-recebimentos-semana-text-quarta-valor"),
            entry("Home - Agenda Recebimento - Qtd Depósitos Quarta", "home-card-recebimentos-semana-text-quarta-qtd-depositos"),
            entry("Home - Agenda Recebimento - Dia Quinta", "home-card-recebimentos-semana-text-dia-quinta"),
            entry("Home - Agenda Recebimento - Mês Quinta", "home-card-recebimentos-semana-text-mes-quinta"),
            entry("Home - Agenda Recebimento - Dia da semana Quinta", "home-card-recebimentos-semana-text-quinta"),
            entry("Home - Agenda Recebimento - Valor Quinta", "home-card-recebimentos-semana-text-quinta-valor"),
            entry("Home - Agenda Recebimento - Qtd Depósitos Quinta", "home-card-recebimentos-semana-text-quinta-qtd-depositos"),
            entry("Home - Agenda Recebimento - Dia Sexta", "home-card-recebimentos-semana-text-dia-sexta"),
            entry("Home - Agenda Recebimento - Mês Sexta", "home-card-recebimentos-semana-text-mes-sexta"),
            entry("Home - Agenda Recebimento - Dia da semana Sexta", "home-card-recebimentos-semana-text-sexta"),
            entry("Home - Agenda Recebimento - Valor Sexta", "home-card-recebimentos-semana-text-sexta-valor"),
            entry("Home - Agenda Recebimento - Qtd Depósitos Sexta", "home-card-recebimentos-semana-text-sexta-qtd-depositos"),

            entry("Menu Lateral - Vendas", "menu-vendas"),
            entry("Menu Lateral - Home", "menu-home"),
            entry("Menu Lateral - Recebimentos", "menu-recebimentos"),
            entry("Menu Lateral - Recebimentos Resumo", "menu-recebimentos-resumo"),
            entry("Menu Lateral - Recebimentos Agenda", "menu-recebimentos-agenda"),
            entry("Menu Lateral - Antecipação", "menu-antecipacao"),
            entry("Menu Lateral - Solicitação", "menu-solicitacao"),
            entry("Menu Lateral - Relatórios", "menu-relatorios"),
            entry("Menu Lateral - Negócio", "menu-negocio"),
            entry("Menu Lateral - Ajuda", "menu-ajuda"),
            entry("Menu Lateral - Gestor Acessos", "menu-gestor-acessos"),
            entry("Menu Lateral - Sair", "menu-sair"),

            entry("Relatórios - Busca Palavra Chave", "relatorios-input-chave"),
            entry("Relatórios - Botão - Filtros", "relatorios-link-filtrar"),
            entry("Relatórios - Botão - Gerar Relatórios", "relatorios-btn-gerar-relatorio"),
            entry("Relatórios - Tabela Header - Nome Arquivo", "relatorios-table-header-nome-arquivo"),
            entry("Relatórios - Tabela Header - Documento", "relatorios-table-header-documento"),
            entry("Relatórios - Tabela Header - tipo Arquivo", "relatorios-table-header-tipo-arquivo"),
            entry("Relatórios - Tabela Header - Solicitado Em", "relatorios-table-header-solicitado-em"),
            entry("Relatórios - Tabela Header - Período", "relatorios-table-header-periodo"),
            entry("Relatórios - Tabela Header - Baixar", "relatorios-table-header-baixar"),
            entry("Relatórios - Item - Nome Arquivo", "relatorios-table-row-nome-arquivo"),
            entry("Relatórios - Item - Documento", "relatorios-table-row-documento"),
            entry("Relatórios - Item - Tipo Arquivo", "relatorios-table-row-tipo-arquivo"),
            entry("Relatórios - Item - Solicitado Em", "relatorios-table-row-solicitado-em"),
            entry("Relatórios - Item - Período", "relatorios-table-row-periodo"),
            entry("Relatórios - Botão Download Ok", "relatorios-table-row-download-ok"),
            entry("Relatórios - Botão Download Falha", "relatorios-table-row-download-fail"),
            entry("Relatórios - Botão Download Aguardando", "relatorios-table-row-download-wait"),

            entry("Header - Ocultar Valores", "head-ocultar-valores"),
            entry("Header - Trocar Estabelecimento", "head-trocar-estabelecimentos"),
            entry("Header - Trocar Estabelecimento - Modal - Padrao", "alterar-matriz-selecionar-padrao"),
            entry("Header - Trocar Estabelecimento - Modal - Acessar", "alterar-matriz-button-acessar"),

            entry("Login - mensagem de erro", "login-usuario-incorreto"),

            entry("Date ranger - Ontem", "generic-calendar-pill-ontem"),
            entry("Date ranger - Últimos 7 dias", "generic-calendar-pill-últimos-7-dias"),
            entry("Date ranger - Últimos 14 dias", "generic-calendar-pill-últimos-14-dias"),
            entry("Date ranger - Mês Atual", "generic-calendar-pill-mês-atual"),
            entry("Date ranger - Aplicar", "generic-calendar-button-aplicar")
    );


    private static final Map<String, String> otherSelectors = Map.ofEntries(
            entry("Date ranger - Image", "//*[@data-testid='generic-calendar-icon-calendar']//img"),
            entry("Date ranger - Ano", "//input[@aria-label='Year']"),
            entry("Date ranger - Mês", "//input[@aria-label='Month']"),
            entry("Date ranger - Início Data Selecionada", "//span[contains(@class,'startRange')]"),
            entry("Date ranger - Fim Data Selecionada", "//span[contains(@class,'endRange')]"),
            entry("Date ranger - Dia inicial Digitado", "//*[@data-testid='generic-calendar-input-init-date']//input"),
            entry("Date ranger - Dia final Digitado", "//*[@data-testid='generic-calendar-input-end-date']//input"),

            // TODO: maps below should be changed for data-testid
            entry("Vendas - Histórico Vendas - Período - Descrição", "//span[contains(text(),'Período')]/../span[2]"),
            entry("Vendas - Histórico Vendas - Valor Bruto Total", "//span[contains(text(),'Valor bruto') and @class='cor-cinza-escuro']/../following-sibling::div/span"),
            entry("Vendas - Histórico Vendas - Valor Líquido Total", "//span[contains(text(),'Valor líquido') and @class='cor-cinza-escuro']/../following-sibling::div/span"),
            entry("Vendas - Histórico Vendas - Total de vendas", "//span[contains(text(),'Total de vendas') and @class='cor-cinza-escuro']/../following-sibling::div/span"),
            entry("Relatórios - Texto Descritivo", "//span[contains(text(),'Caso já tenha gerado')]"),
            entry("Login - Esqueceu senha - Título", "h4"),
            entry("Home - Maquininha", ".title-maquinha"),
            entry("Home - Maquininha - Botão Confira", "//button[span[contains(text(),'Confira')]]"),
            entry("Home - Resumo", "//span[contains(text(),'Visualize suas vendas realizadas no dia')]"),
            entry("Home - Agenda de recebimentos da semana - mensagem", "#CtnAgendaRecebimentosSemana2 > div > div > div:nth-child(2)"),
            entry("Header - Trocar Estabelecimento - Modal - Todos", "//input[@value='Todos']")
    );

    public static String getTestId(String identifier) {
        return testIdMaps.getOrDefault(identifier, "Didn't find test id for " + identifier);
    }

    public static String getTestIdOrNull(String identifier) {
        return testIdMaps.get(identifier);
    }

    public static String getQuerySelector(String identifier) {
        if (testIdMaps.containsKey(identifier)) {
            return "internal:attr=[data-testid=/^" + getTestId(identifier) + "$/]";
        } else if (otherSelectors.containsKey(identifier)) {
            return otherSelectors.get(identifier);
        }
        throw new IllegalArgumentException("No selector found for " + identifier);
    }

    public static List<Pair<String, String>> getAllQuerySelector(String prefix) {
        Stream<Pair<String, String>> stream1 = testIdMaps.entrySet().stream()
                .filter(keyValue -> keyValue.getKey().startsWith(prefix))
                .map(entry -> Pair.of(entry.getKey(),"[data-testid=" + entry.getValue() + "]"));

        Stream<Pair<String, String>> stream2 = otherSelectors.entrySet().stream()
                .filter(keyValue -> keyValue.getKey().startsWith(prefix))
                .map(entry -> Pair.of(entry.getKey(), entry.getValue()));

        return Stream.concat(stream1, stream2)
                .collect(Collectors.toList());
    }
}
