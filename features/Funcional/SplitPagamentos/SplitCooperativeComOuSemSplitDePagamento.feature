#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/SplitPagamentos/SplitCooperativeComOuSemSplitDePagamento
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: SplitCooperativeComOuSemSplitDePagamento

  @TestCaseKey=LPDC-T2018
  Scenario: Validação de transações com split de pagamento
    Given usuário identificado com o split de pagamento cooperative e perfilamento de vendedor
    When acessar a aba Histórico de vendas
    Then validar se cada transação tem ou não split de pagamento usando o campo flagSplit

  @TestCaseKey=LPDC-T2015
  Scenario: Transação com split de pagamento
    Given transação com flagSplit como "true"
    When acessar a transação na aba Histórico de vendas
    Then apresentar a transação como uma transação de split de pagamento cooperative

  @TestCaseKey=LPDC-T2020
  Scenario: Transação sem split de pagamento
    Given transação com flagSplit como "false"
    When acessar a transação na aba Histórico de vendas
    Then apresentar a transação como uma transação comum sem split de pagamento

  @TestCaseKey=LPDC-T2021
  Scenario: Apresentação correta no relatório simplificado
    Given transações no relatório simplificado
      | Transacao | flagSplit |
      | 1         | true      |
      | 2         | false     |
    When visualizar o relatorio simplificado na aba Historico de vendas
    Then apresentar a transacao 1 como uma transacao de split de pagamento cooperative
    And apresentar a transação 2 como uma transacao comum sem split de pagamento

  @TestCaseKey=LPDC-T2017
  Scenario: Apresentacao correta no relatorio detalhado
    Given transacoes no relatorio detalhado
      | Transacao | flagSplit |
      | 3         | true      |
      | 4         | false     |
    When visualizar o relatorio detalhado na aba Historico de vendas
    Then apresentar a transacao 3 como uma transacao de split de pagamento cooperative
    And apresentar a transacao 4 como uma transacao comum sem split de pagamento

  @TestCaseKey=LPDC-T2019
  Scenario: Validação de transações em diferentes perfis
    Given usuário identificado com o split de pagamento cooperative e perfis Master, Secundário e Operador
    When acessar a aba Histórico de vendas
    Then validar se cada transação tem o split de pagamento usando o campo flagSplit
    And transações com flagSplit "true" são apresentadas como transações de split de pagamento cooperative
    And transações com flagSplit "false" são apresentadas como transações comuns sem split de pagamento

  @TestCaseKey=LPDC-T2016
  Scenario: Validação de flagSplit em transações individuais
    Given usuário com perfil de vendedor e transação específica
      | Transacao | flagSplit |
      | 5         | true      |
    When acessar a aba Histórico de vendas
    Then a transação deve ser apresentada como uma transação de split de pagamento cooperative

