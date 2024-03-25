#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Relatorios/Filtros_Relatorio
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Filtros Relatório

  Background:
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    And Usuário acessa página de Relatórios

  Scenario: Opções de Filtros Disponíveis
    When usuário clica no "Botão Filtros" em "Relatórios"
    And usuário clica no "Accordion Tipos de Arquivo" em "Filtros de relatório"
    And usuário clica no "Accordion Período" em "Filtros de relatório"
    And usuário clica no "Accordion Documentos" em "Filtros de relatório"
    Then usuário verá no filtro "Filtros de relatório - Item Tipos de Arquivo" as opções Vendas, Pagamentos
    And usuário visualizará em "Filtros de relatório" o "Item Período"
    And usuário verá no filtro um ou mais documentos

  @api
  Scenario: Opções de Filtros Exibem Todos os documentos
    When usuário clica no "Botão Filtros" em "Relatórios"
    And usuário clica no "Accordion Documentos" em "Filtros de relatório"
    And usuário verá no filtro todos os seus documentos

  Scenario Outline: Filtro por tipo de relatório
    Given Existem relatórios já extraídos do tipo "<tipo>", no formato "<formatoDeArquivo>", disponíveis para download
    When usuário clica no "Botão Filtros" em "Relatórios"
    And Usuário filtra por "<tipo>" nos "Filtros de relatório" de "Tipos de Arquivo"
    Then serão filtrados apenas os relatórios do tipo "<tipo>"
    Examples:
    | tipo       | formatoDeArquivo |
    | Vendas     | .csv             |
    | Pagamentos | .csv             |
