#language: en
@playwright @UsuárioMaster
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

  Scenario: Validação do Header quando for selecionado DOCUMENTO (Usuário Master)
    Given Usuário está na aba "Documento" da modal 'Trocar Estabelecimento'
    When Usuário selecionar um documento e clicar Acessar
    Then Usuário visualizará no Header do Portal (todas as páginas) o Nome fantasia e número do Documento
    And Usuário visualizará um botão abaixo escrito “Trocar estabelecimento” com destaque na coloração da aliança

