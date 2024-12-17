#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Inclusao_do_Botao_Exportar_para_aba_Consultar_links
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: Inclusao do Botao Exportar para aba Consultar links

  Scenario: Login EC Link de Pagamento / Com Links já criado
    Given usuário fizer Login com Doc e Senha
    When pelo menu lateral esquerdo acessar as abas: Serviços, Link de pagamento
    And Selecionar a aba Consultar Links
    Then visualizara o Botão Exportar abaixo do card Período na Cor da Instituição

  Scenario: Login EC Link de Pagamento / Sem Link criado
    Given usuário fizer Login com Doc e Senha
    When Selecionar a aba Consultar Links
    Then visualizara a seguinte mensagem: Nenhum resultado encontrado Tente filtrar por outros períodos ou parâmetros.