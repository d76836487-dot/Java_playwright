#language: en
@playwright @UsuárioComHierarquia
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Header_Portal/Header_Portal
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Header Portal

  @TestCaseKey=SMP-T197
  Scenario: Validação do Header quando for selecionado ESTABELECIMENTO (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um EC e clicar Acessar
    Then Usuário visualizará no Header do Portal (todas as páginas) o Nome fantasia e número do EC
    And Usuário visualizará um botão abaixo escrito “Trocar estabelecimento” com destaque na coloração da aliança

  @TestCaseKey=SMP-T270
  Scenario: Validação do Header quando for selecionado DOCUMENTO (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Usuário visualizará no Header do Portal (todas as páginas) o Nome fantasia e número do Documento
    And Usuário visualizará um botão abaixo escrito “Trocar estabelecimento” com destaque na coloração da aliança

  @TestCaseKey=SMP-T269
  Scenario: Validação do Header quando for selecionado na aba DOCUMENTO a opção TODOS (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar Todos na aba Documento e clicar Acessar
    Then Usuário visualizará no Header do Portal (todas as páginas) o texto Todos documentos

  @TestCaseKey=SMP-T271
  Scenario: Validação do comportamento do Header do Portal não se mover com scroll (Usuário Master)
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    When usuário move a tela através do scroll
    Then Usuário verá "Header - Trocar Estabelecimento"

  @TestCaseKey=SMP-T272
  Scenario: Validação informações home logada com seleção de EC (Usuário Master)
    Given Usuário está na aba "Estabelecimento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um EC e clicar Acessar
    Then Valor 'Home - Vendas Hoje' é igual à exportação do relatório 'Vendas Hoje'
    And Soma da coluna Valor Bruto é igual ao cabeçalho do Excel - Valor Bruto e Não Efetivadas
    And A exportação do relatório 'Vendas Hoje' terá somente o EC selecionado

  @TestCaseKey=SMP-T273
  Scenario: Validação informações home logada com seleção de Documento (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Valor 'Home - Vendas Hoje' é igual à exportação do relatório 'Vendas Hoje'
    And Soma da coluna Valor Bruto é igual ao cabeçalho do Excel - Valor Bruto e Não Efetivadas

  @TestCaseKey=SMP-T274
  Scenario: Validação informações home logada com seleção todos Documentos (Usuário Master)
    Given Usuário logou na aplicação, selecionou todos os documentos e salvou sessão
    Then Valor 'Home - Vendas Hoje' é igual à exportação do relatório 'Vendas Hoje'
    And Soma da coluna Valor Bruto é igual ao cabeçalho do Excel - Valor Bruto e Não Efetivadas

