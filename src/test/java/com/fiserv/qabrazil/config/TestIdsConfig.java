package com.fiserv.qabrazil.config;

import org.apache.commons.lang3.tuple.Pair;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.Map.entry;

public class TestIdsConfig {
    private static final Map<String, String> testIdMaps = Map.<String, String>ofEntries(
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

            entry("Filtros - Botão Limpar Filtros", "generic-filter-link-clean-all"),
            entry("Filtros - Botão Mostrar Resultados", "generic-filter-btn-resultados"),

            entry("Vendas Hoje - Resumo - Quantidade Vendas", "vendas-hoje-card-total-vendas"),
            entry("Vendas Hoje - Resumo - Valor Vendas", "vendas-hoje-card-vlr-bruto"),
            entry("Vendas Hoje - Histórico - Coluna Valor Bruto", "vendas-hoje-coluna-vlr-bruto\\d"),
            entry("Vendas Hoje - Histórico - Coluna Data Hora", "vendas-hoje-coluna-data-venda"),
            entry("Vendas Hoje - Histórico - Coluna Bandeira", "vendas-hoje-coluna-bandeira"),
            entry("Vendas Hoje - Histórico - Coluna Produto", "vendas-hoje-coluna-produto"),
            entry("Vendas Hoje - Histórico - Coluna Parcela", "vendas-hoje-coluna-parcela"),
            entry("Vendas Hoje - Histórico - Coluna Canal", "vendas-hoje-coluna-canal"),
            entry("Vendas Hoje - Histórico - Coluna Terminal", "vendas-hoje-coluna-terminal"),
            entry("Vendas Hoje - Histórico - Coluna Status", "vendas-hoje-coluna-status\\d"),
            entry("Vendas Hoje - Histórico - Coluna Estabelecimento", "vendas-hoje-coluna-estabelecimento\\d"),
            entry("Vendas Hoje - Exportar - Dropdown Tipo Arquivo", "simple-dropdown-select-"),
            entry("Vendas Hoje - Exportar - Dropdown Tipo Arquivo - Excel", "simple-dropdown-select--item-excel"),
            entry("Vendas Hoje - Exportar - Dropdown Tipo Arquivo - CSV", "simple-dropdown-select--item-csv"),
            entry("Vendas Hoje - Botão Filtrar", "vendas-hoje-link-filtrar"),
            entry("Vendas Hoje - Botão Cancelar Filtro", "generic-filter-link-sair"),

            entry("Vendas - Histórico de Vendas - Resumo - Quantidade de vendas", "historico-vendas-total"),
            entry("Vendas - Histórico de Vendas - Resumo - Valor bruto", "historico-vendas-valor-bruto"),
            entry("Vendas - Histórico de Vendas - Resumo - Valor líquido", "historico-vendas-valor-liquido"),
            entry("Vendas - Histórico de Vendas - Resumo - Valor cancelado", "historico-vendas-valor-cancelado"),
            entry("Vendas - Histórico de Vendas - Botão Exportar", "exportar-historicovendas"),
            entry("Vendas - Histórico de Vendas - Botão Cancelar Filtro", "generic-filter-link-sair"),

            entry("Vendas - Não Efetivadas - Botão Exportar", "exportar-naoefetivadas"),
            entry("Vendas - Não Efetivadas - Exportar - Botão Gerar Arquivo", "exportar-arquivos-gerar-arquivo"),
            entry("Vendas - Não Efetivadas - Botão Cancelar Filtro", "generic-filter-link-sair"),

            entry("Vendas - Pré Autorizações - Botão Exportar", "exportar-preautorizacoes"),
            entry("Vendas - Pré Autorizações - Exportar - Botão Gerar Arquivo", "exportar-arquivos-gerar-arquivo"),
            entry("Vendas - Pré Autorizações - Botão Cancelar Filtro", "generic-filter-link-sair"),

            entry("Vendas - Voucher - Botão Exportar", "exportar-voucher"),
            entry("Vendas - Voucher - Exportar - Botão Gerar Arquivo", "exportar-arquivos-gerar-arquivo"),
            entry("Vendas - Voucher - Botão Cancelar Filtro", "generic-filter-link-sair"),

            entry("Recebimentos - Pagos - Exportar - Botão Gerar Arquivo", "exportar-arquivos-gerar-arquivo"),
            entry("Recebimentos - Pagos - Botão Cancelar Filtro", "generic-filter-link-sair"),

            entry("Recebimentos - Futuros - Exportar - Botão Gerar Arquivo", "exportar-arquivos-gerar-arquivo"), // TODO: ajustar aqui
            entry("Recebimentos - Futuros - Botão Cancelar Filtro", "generic-filter-link-sair"),

            entry("Home - Card Vendas Hoje - Valor Vendas Hoje", "home-card-vendas-hoje-text-vlr"),
            entry("Home - Card Vendas Hoje - Percentual Vendas Hoje", "home-card-vendas-hoje-text-percentual-down"),
            entry("Home - Card Vendas Hoje - Ver Tudo", "home-card-vendas-hoje-link-ver-tudo"),

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

            entry("Home - personalizar - todos os itens", "home-personalizar-check-.*"),
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

            entry("Relatórios - Busca Palavra Chave", "relatorios-input-chave"),
            entry("Relatórios - Botão Filtros", "relatorios-link-filtrar"),
            entry("Relatórios - Botão Gerar Relatório", "relatorios-btn-gerar-relatorio"),
            entry("Relatórios - Tabela Header - Nome Arquivo", "relatorios-table-header-nome-arquivo"),
            entry("Relatórios - Tabela Header - Documento", "relatorios-table-header-documento"),
            entry("Relatórios - Tabela Header - Formato Arquivo", "relatorios-table-header-tipo-arquivo"),
            entry("Relatórios - Tabela Header - Solicitado Em", "relatorios-table-header-solicitado-em"),
            entry("Relatórios - Tabela Header - Período", "relatorios-table-header-periodo"),
            entry("Relatórios - Tabela Header - Baixar", "relatorios-table-header-baixar"),
            entry("Relatórios - Item - Nome Arquivo", "relatorios-table-row-nome-arquivo"),
            entry("Relatórios - Item - Documento", "relatorios-table-row-documento"),
            entry("Relatórios - Item - Tipo Relatório", "relatorios-table-row-tipo-arquivo"),
            entry("Relatórios - Item - Solicitado Em", "relatorios-table-row-solicitado-em"),
            entry("Relatórios - Item - Período", "relatorios-table-row-periodo"),
            entry("Relatórios - Botão Download Ok", "relatorios-table-row-download-ok"),
            entry("Relatórios - Botão Download Falha", "relatorios-table-row-download-fail"),
            entry("Relatórios - Botão Download Aguardando", "relatorios-table-row-download-wait"),
            entry("Relatórios - Notificação Sucesso", "alerta-sucesso-exportar-relatorio"),

            entry("Filtros de relatório - Accordion Tipos de Arquivo", "generic-filter-accordion-title-tipos-arquivos"),
            entry("Filtros de relatório - Accordion Documentos", "generic-filter-accordion-title-documento"),
            entry("Filtros de relatório - Accordion Período", "generic-filter-accordion-title-periodo"),
            entry("Filtros de relatório - Accordion Estabelecimentos", "generic-filter-accordion-title-estabelecimentos"),
            entry("Filtros de relatório - Item Tipos de Arquivo", "generic-filter-check-tipo-arquivo-.*"),
            entry("Filtros de relatório - Item Período", "DateInputPicker-generic-filter-periodo"),
            entry("Filtros de relatório - Item Documentos", "generic-filter-check-documento-.*"),
            entry("Filtros de relatório - Item Estabelecimentos", "generic-filter-check-estabelecimento-.*"),

            entry("Modal Gerar Relatórios", "relatorios-header-title-text"),
            entry("Modal Gerar Relatórios - Título", "relatorios-header-title-text"),
            entry("Modal Gerar Relatórios - Descrição", "relatorios-header-subtitle-text"),
            entry("Modal Gerar Relatórios - Estabelecimento Comercial", "relatorios-ec-card-text-name"),
            entry("Modal Gerar Relatórios - CPF ou CNPJ", "relatorios-ec-card-text-cnpj"),
            entry("Modal Gerar Relatórios - Campo Select EC", "simple-dropdown-select-ecs"),
            entry("Modal Gerar Relatórios - Select EC Selecionado", "simple-dropdown-select-ecs-text-selected"),
            entry("Modal Gerar Relatórios - Select EC Opções", "simple-dropdown-select-ecs-item.*"),
            entry("Modal Gerar Relatórios - Select Tipo", "simple-dropdown-select-tipo-relatorio"),
            entry("Modal Gerar Relatórios - Select Tipo Selecionado", "simple-dropdown-select-tipo-relatorio-text-selected"),
            entry("Modal Gerar Relatórios - Select Tipo Opções", "simple-dropdown-select-tipo-relatorio-item.*"),
            entry("Modal Gerar Relatórios - Select Formato Arquivo", "simple-dropdown-select-formato-arquivo"),
            entry("Modal Gerar Relatórios - Select Formato Arquivo Selecionado", "simple-dropdown-select-formato-arquivo-text-selected"),
            entry("Modal Gerar Relatórios - Select Formato Arquivo Opções", "simple-dropdown-select-formato-arquivo-item.*"),
            entry("Modal Gerar Relatórios - Select Período", "DateInputPicker-periodo"),
            entry("Modal Gerar Relatórios - Select Período Label", "DateInputPicker-periodotext-label"),
            entry("Modal Gerar Relatórios - Select Período Selecionado", "DateInputPicker-periodo-range-selected"),

            entry("Modal Gerar Relatórios - Valor Informativo", "relatorios-tipo-entrega-section-text"),
            entry("Modal Gerar Relatórios - Mensagem sobre prazo", "relatorios-panel-info-text"),

            entry("Modal Gerar Relatórios - Botão Cancelar", "relatorios-btn-cancel"),

            entry("Header - Logotipo", "header-brand-img"),
            entry("Header - Ocultar Valores", "head-ocultar-valores"),
            entry("Header - Ajuda", "head-ajuda"),
            entry("Header - Notificações", "head-notificacoes"),
            entry("Header - Trocar Estabelecimento", "head-trocar-estabelecimentos"),
            entry("Header - Sair", "head-sair"),
            entry("Trocar Estabelecimento - Marcar como Padrão", "alterar-matriz-selecionar-padrao"),
            entry("Trocar Estabelecimento - Botão Acessar", "alterar-matriz-button-acessar"),
            
            entry("Trocar Estabelecimento - Botão selecionar por Documento", "alterar-matriz-type-documento"),
            entry("Trocar Estabelecimento - Botão selecionar por Estabelecimento", "alterar-matriz-type-estabelecimento"),
            entry("Trocar Estabelecimento - Buscar documento", "alterar-matriz-input-buscar"),
            entry("Trocar Estabelecimento - Limpar buscar documento", "alterar-matriz-close-input-search"),
            entry("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento", "alterar-matriz-nome-estabelecimento-\\d.*"),
            entry("Trocar Estabelecimento - Estabelecimento - Documento Estabelecimento", "alterar-matriz-documento-estabelecimento-\\d.*"),
            entry("Trocar Estabelecimento - Estabelecimento - Nome Estabelecimento Detalhe", "alterar-matriz-nome-estabelecimento-detalhe-\\d.*"),
            entry("Trocar Estabelecimento - Estabelecimento - Num Estabelecimento Detalhe", "alterar-matriz-documento-estabelecimento-detalhe-\\d.*"),
            entry("Trocar Estabelecimento - Estabelecimento - Status Estabelecimento Detalhe", "alterar-matriz-documento-estabelecimento-status-\\d.*"),
            entry("Trocar Estabelecimento - Documento - Nome Estabelecimento", "alterar-matriz-text-documento-nome-fantasia-.*"),

            entry("Login - mensagem de erro", "login-usuario-incorreto"),
            entry("Login - Campo Token MFA", "login-codigos-token"),
            entry("Login - Botão Confirmar Token MFA", "login-confirmar-token"),

            entry("Date ranger - Ontem", "generic-calendar-pill-ontem"),
            entry("Date ranger - Últimos 7 dias", "generic-calendar-pill-últimos-7-dias"),
            entry("Date ranger - Últimos 14 dias", "generic-calendar-pill-últimos-14-dias"),
            entry("Date ranger - Mês Atual", "generic-calendar-pill-mês-atual"),
            entry("Date ranger - Aplicar", "generic-calendar-button-aplicar"),

            entry("Gestão de Acessos - Abas - Usuários", "gestao-tab-usuarios"),
            entry("Gestão de Acessos - Abas - Convites pendentes", "gestao-tab-pendente"),
            entry("Gestão de Acessos - Convidar novo usuário", "gestao-new-user")
    );


    private static final Map<String, String> otherSelectors = Map.<String, String>ofEntries(
            entry("Loading Indicator", ".ph-picture-small"),
            entry("Menu Lateral - Vendas", ".om-root-menu [data-testid=menu-vendas]"),
            entry("Menu Lateral - Home", ".om-root-menu [data-testid=menu-home]"),
            entry("Menu Lateral - Recebimentos", ".om-root-menu [data-testid=menu-recebimentos]"),
            entry("Menu Lateral - Recebimentos Resumo", ".om-root-menu [data-testid=menu-recebimentos-resumo]"),
            entry("Menu Lateral - Agenda de Recebimentos UR", ".om-root-menu [data-testid=menu-recebimentos-agenda]"),
            entry("Menu Lateral - Antecipação", ".om-root-menu [data-testid=menu-antecipacao]"),
            entry("Menu Lateral - Solicitação", ".om-root-menu [data-testid=menu-solicitacao]"),
            entry("Menu Lateral - Relatórios", ".om-root-menu [data-testid=menu-relatorios]"),
            entry("Menu Lateral - Negócio", ".om-root-menu [data-testid=menu-negocio]"),
            entry("Menu Lateral - Ajuda", ".om-root-menu [data-testid=menu-ajuda]"),
            entry("Menu Lateral - Gestão de Acessos", ".om-root-menu [data-testid=menu-gestor-acessos]"),
            entry("Menu Lateral - Sair", ".om-root-menu [data-testid=menu-sair]"),

            entry("Date ranger - Image", "//*[@data-testid='generic-calendar-icon-calendar']//img"),
            entry("Date ranger - Ano", "//input[@aria-label='Year']"),
            entry("Date ranger - Mês", "//input[@aria-label='Month']"),
            entry("Date ranger - Início Data Selecionada", "//span[contains(@class,'startRange')]"),
            entry("Date ranger - Fim Data Selecionada", "//span[contains(@class,'endRange')]"),
            entry("Date ranger - Dia inicial Digitado", "//*[@data-testid='generic-calendar-input-init-date']//input"),
            entry("Date ranger - Dia final Digitado", "//*[@data-testid='generic-calendar-input-end-date']//input"),
            entry("Modal Gerar Relatórios - Dia Calendário", "//*[@class='flatpickr-days']//span[contains(@class, 'flatpickr-day')]"),
            entry("Modal Gerar Relatórios - Ano Calendário", "//*[contains(@class, 'DateInputPicker-periodo-calendar')]//input[contains(@class, 'numInput')][contains(@class, 'cur-year')]"),
            entry("Modal Gerar Relatórios - Mês Calendário", "//*[contains(@class, 'DateInputPicker-periodo-calendar')]//select[@aria-label='Month']"),
            entry("Filtros de Relatório - Dia Calendário", "//*[@class='flatpickr-days']//span[contains(@class, 'flatpickr-day')]"),
            entry("Filtros de Relatório - Ano Calendário", "//*[contains(@class, 'DateInputPicker-generic-filter-periodo-calendar')]//input[contains(@class, 'numInput')][contains(@class, 'cur-year')]"),
            entry("Filtros de Relatório - Mês Calendário", "//*[contains(@class, 'DateInputPicker-generic-filter-periodo-calendar')]//select[@aria-label='Month']"),

            // TODO: maps below should be changed for data-testid
            entry("Vendas - Histórico Vendas - Período - Descrição", "//span[contains(text(),'Período')]/../span[2]"),
            entry("Vendas - Histórico Vendas - Valor Bruto Total", "//span[contains(text(),'Valor bruto') and @class='cor-cinza-escuro']/../following-sibling::div/span"),
            entry("Vendas - Histórico Vendas - Valor Líquido Total", "//span[contains(text(),'Valor líquido') and @class='cor-cinza-escuro']/../following-sibling::div/span"),
            entry("Vendas - Histórico Vendas - Valor Cancelado Total", "//span[contains(text(),'Valor cancelado') and @class='cor-cinza-escuro']/../following-sibling::div/span"),
            entry("Vendas - Histórico Vendas - Total de vendas", "//span[contains(text(),'Total de vendas') and @class='cor-cinza-escuro']/../following-sibling::div/span"),
            entry("Vendas - Histórico de Vendas - Botão Filtrar", "//div[contains(text(),'Filtros')]"),
            entry("Vendas - Histórico de Vendas - Exportar - Botão Gerar Arquivo", "//button[contains(text(),'Gerar arquivo')]"),

            entry("Vendas - Não Efetivadas - Total Recusadas", "//div[@id='ctnTotalRecusadas2']/div[2]"),
            entry("Vendas - Não Efetivadas - Total Estornadas", "//div[@id='ctnTotalEstornadas2']/div[2]"),
            entry("Vendas - Não Efetivadas - Botão Filtrar", "//div[contains(@class,'btn')]/span[contains(text(),'Filtros')]"),

            entry("Vendas - Pré Autorizações - Total Vendas", "//span[text()='Total de vendas']/../../div[2]/div/span"),
            entry("Vendas - Pré Autorizações - Valor Bruto Autorizado", "//span[text()='Valor bruto autorizado']/../../div[2]/div/span"),
            entry("Vendas - Pré Autorizações - Valor Bruto A Confirmar", "//span[text()='Valor bruto a confirmar']/../../div[2]/div/span"),
            entry("Vendas - Pré Autorizações - Botão Filtrar", "//div[contains(text(),'Filtros')]"),

            entry("Vendas - Voucher - Total Vendas", "//span[text()='Total de vendas']/../../div[2]/span"),
            entry("Vendas - Voucher - Valor Bruto", "(//span[text()='Valor bruto']/../../div[2]/span)[1]"),
            entry("Vendas - Voucher - Botão Filtrar", "//div[contains(text(),'Filtros')]"),

            entry("Recebimentos - Pagos - Botão Exportar", "(//span[text()='Exportar'])[1]"),
            entry("Recebimentos - Pagos - Total recebido", "(//span[text()='Total recebido']/../../div[2]/span)[1]"),
            entry("Recebimentos - Pagos - Total agendado", "(//span[text()='Total agendado']/../../div[2]/span)[1]"),
            entry("Recebimentos - Pagos - Total cedido", "(//span[text()='Total cedido']/../../div[2]/span)[1]"),
            entry("Recebimentos - Pagos - Depósitos recebido", "(//span[text()='Total recebido']/../../div[2]/div)[1]"),
            entry("Recebimentos - Pagos - Depósitos agendado", "(//span[text()='Total agendado']/../../div[2]/div)[1]"),
            entry("Recebimentos - Pagos - Depósitos cedido", "(//span[text()='Total cedido']/../../div[2]/div)[1]"),
            entry("Recebimentos - Pagos - Botão Filtrar", "(//a/span[contains(text(),'Filtros')])[1]"),

            entry("Recebimentos - Futuros - Botão Exportar", "(//span[text()='Exportar'])[1]"),
            entry("Recebimentos - Futuros - Total líquido", "(//span[text()='Total líquido previsto']/../../div[2]/span)[1]"),
            entry("Recebimentos - Futuros - Quantidade vendas", "(//span[text()='Total de vendas ']/../../div[2]/span)"),
            entry("Recebimentos - Futuros - Botão Filtrar", "(//a/span[contains(text(),'Filtros')])[1]"),

            entry("Relatórios - Texto Descritivo", "//span[contains(text(),'Caso já tenha gerado')]"),
            entry("Relatórios - Tabela - Item", "//tr[.//*[@data-testid='relatorios-table-row-nome-arquivo']]"),
            entry("Relatórios - Notificação de Falha", "//span[starts-with(text(), 'O intervalo da seleção deve ser')]"),
            entry("Modal Gerar Relatórios - Select EC Label", "//div[@role='dialog']//div[@data-block='AppAntecipacao.SimpleDropdownSelect'][.//span[starts-with(text(), 'Estabelecimento')]]//label/span"),
            entry("Modal Gerar Relatórios - Select Tipo Label", "//div[@role='dialog']//div[@data-block='AppAntecipacao.SimpleDropdownSelect'][.//span[starts-with(text(), 'Tipo de relat')]]//label/span"),
            entry("Modal Gerar Relatórios - Select Formato Arquivo Label", "//div[@role='dialog']//div[@data-block='AppAntecipacao.SimpleDropdownSelect'][.//span[starts-with(text(), 'Formato do arquivo')]]//label/span"),
            entry("Modal Gerar Relatórios - Período Calendário", "DateInputPicker-periodo-range-selected"),
            entry("Modal Gerar Relatórios - Ícone Fechar (X)", "//div[@data-block='AppRelatorios.ModalGerarRelatorio']//a"),
            entry("Modal Gerar Relatórios - Botão Gerar", "[data-testid='relatorios-btn-cancel']~[data-testid='relatorios-btn-gerar-relatorio']"),
            entry("Modal Gerar Relatórios - Título Informativo", "//*[@data-testid='relatorios-tipo-entrega-section']/span[1]"),

            entry("Login - Esqueceu senha - Título", "h4"),
            entry("Home - Maquininha", ".title-maquinha"),
            entry("Home - Maquininha - Botão Confira", "//button[span[contains(text(),'Confira')]]"),
            entry("Home - Resumo", "//span[contains(text(),'Visualize suas vendas realizadas no dia')]"),
            entry("Home - Agenda de recebimentos da semana - mensagem", "#CtnAgendaRecebimentosSemana > div > div > div:nth-child(2)"),
            entry("Header - Trocar Estabelecimento - Span Texto", "//*[@data-testid='head-trocar-estabelecimentos']//span[contains(text(), 'Trocar estabelecimento')]"),
            entry("Trocar Estabelecimento - Botão Todos Documentos", "//input[@value='Todos']"),
            entry("Trocar Estabelecimento - Botão Todos Documentos - Explicação", "//span[contains(text(),'Essa visão')]"),
            entry("Trocar Estabelecimento - Texto Explicativo", "//*[contains(text(),'Ao selecionar esse ')]"),
            entry("Trocar Estabelecimento - Nenhum resultado", "//*[@role='dialog']//*[contains(text(),'Nenhum resultado')]"),
            entry("Trocar Estabelecimento - Documento - Documento Estabelecimento", "//*[@role='radiogroup']//input"),
            entry("Vendas Hoje - Botão Exportar", "//button//span[text()='Exportar']"),
            entry("Vendas Hoje - Exportar - Dropdown Tipo Arquivo - Gerar arquivo", "//button[text()='Gerar arquivo']"),

            entry("Ajuda - Whatsapp", "//span[contains(text(),'WhatsApp')]/.."),
            entry("Ajuda - WhatsApp Card", "//*[contains(@class,'margin-left-m')][1]/*"),
            entry("Ajuda - Atendimento pelo Whatsapp - número do telefone sublinhado", "//*[contains(@class,'margin-left-m')][1]/a"),
            entry("Ajuda - Chatbot", "//span[contains(text(),'Chatbot')]/.."),

            entry("Gestão de Acessos - Campo pesquisar", ".input-with-icon-input"),

            entry("Agenda de recebimentos por UR - Botão Alterar Documento", "button.ec-info-btn"),
            entry("Agenda de recebimentos por UR - RadioButton Selecionar Documento", ".popup-content input[type=radio]"),
            entry("Agenda de recebimentos por UR - Confirmar Seleção", ".popup-dialog .cor-branca"),
            entry("Agenda de recebimentos por UR - CNPJ Selecionado", ".ec-info-subtitle")
    );

    public static String getTestId(String identifier) {
        return testIdMaps.getOrDefault(identifier, "Didn't find test id for " + identifier);
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
