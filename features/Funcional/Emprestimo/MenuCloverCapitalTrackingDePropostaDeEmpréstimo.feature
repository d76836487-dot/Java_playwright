#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Emprestimo/MenuCloverCapitalTrackingDePropostaDeEmpréstimo
@Zephyr:Status=Approved
@Zephyr:Component=BDD Finalizado
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: MenuCloverCapitalTrackingDePropostaDeEmpréstimo

  Scenario: Verificar status "Solicitação de contato enviada"
    Given que o usuário acessa a aba "Clover Capital"
    When o status da proposta é "Solicitação de contato enviada"
    Then deve ser exibida a mensagem "Entraremos em contato em até 24 horas"

  Scenario: Verificar status "Proposta"
    Given que o usuário acessa a aba "Clover Capital"
    When o status da proposta é "Proposta"
    Then deve ser exibido o resumo da oferta de empréstimo com os seguintes dados:
      | Campo            | Valor                  |
      | CNPJ             | 12.345.678/0001-99     |
      | Valor a receber  | R$ 10.000,00           |
      | Valor a pagar    | R$ 12.000,00           |
      | Parcelas         | 12                     |
      | Taxa             | 1,5%                   |
      | Telefone         | (11) 99999-9999        |

  Scenario: Verificar status "Analisamos sua solicitação e desta vez não conseguimos aprová-la devido a políticas internas de crédito."
    Given que o usuário acessa a aba "Clover Capital"
    When o status da proposta é "Analisamos sua solicitação e desta vez não conseguimos aprová-la devido a políticas internas de crédito."
    Then deve ser exibida a mensagem "Não houve aprovação do empréstimo por parte Fiserv."

  Scenario: Verificar status "Ocorreu um erro. Entraremos em contato em até 24hs úteis."
    Given que o usuário acessa a aba "Clover Capital"
    When o status da proposta é "Ocorreu um erro. Entraremos em contato em até 24hs úteis."
    Then deve ser exibida a mensagem "Ocorreu um erro. Entraremos em contato em até 24hs úteis." com a opção de atualização de telefone

  Scenario: Verificar status "Cliente desistiu da oferta"
    Given que o usuário acessa a aba "Clover Capital"
    When o status da proposta é "Cliente desistiu da oferta"
    Then deve ser exibida uma jornada explicativa sobre o cliente ter desistido da proposta de empréstimo durante o atendimento

  Scenario: Verificar status "Assinatura"
    Given que o usuário acessa a aba "Clover Capital"
    When o status da proposta é "Assinatura"
    Then deve ser exibido os dados da proposta e o status de assinatura de cada sócio da empresa
    And se o usuário clicar em "Ver proposta" deve ser apresentado um PDF com o contrato do empréstimo

  Scenario: Verificar status "Empréstimo realizado com sucesso!"
    Given que o usuário acessa a aba "Clover Capital"
    When o status da proposta é "Empréstimo realizado com sucesso!"
    Then deve ser exibido os valores do empréstimo e a informação de domicílio bancário
      | Campo                | Valor                |
      | Valor do empréstimo  | R$ 10.000,00         |
      | Conta                | 12345-6              |
      | Agência              | 1234                 |
      | Data do pagamento    | 01/01/2025           |
    And deve ter um botão "Falar no WhatsApp" que redireciona para o link do WhatsApp
