# language: en
@ignore
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Consulta_de_Produtos/Consulta_vendas
@Zephyr:Status=Approved
@Zephyr:Priority=Low
#noinspection CucumberUndefinedStep
Feature: NPS
  Scenario: Acessar pesquisa de NPS
    Given usuario perfil admin
    When acessa a area cliente
    And clica na caixa NPS
    Then  exibe quadro coluna nome