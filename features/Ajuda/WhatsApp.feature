#language: en
@playwright
@Zephyr:ProjectKey=SMP
@Zephyr:Folder=/Portal_do_Cliente/Ajuda/Validação_componente_Whatsapp_nas_instituições_BIN_003_ou_007
@Zephyr:Status=Draft
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Automation=Automated;Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo
Feature: Validação componente Whatsapp nas instituições BIN 003 ou 007

  Background:
    When Usuário tenta logar na aplicação
    Then Usuário estará com acesso e sessão foi salva
    And Todas as requisições HTTP foram respondidas

  @TestCaseKey=SMP-T176
  Scenario: Visualização do componente Whatsapp
    Given que estou na tela “início” do Portal
    When usuário clica "Header - Ajuda"
    Then usuário visualiza o componente WhatsApp na cor azul no canto inferior à direita da tela

  @TestCaseKey=SMP-T175
  Scenario: Validação da flutuação do componente Whatsapp
    Given usuário está na página Ajuda
    When usuário move a tela através do scroll
    Then usuário visualizará o componente Whatsapp acompanhando a rolagem da tela

  Scenario: Visualização do campo Atendimento pelo Whatsapp
    Given usuário está na página Ajuda
    When usuário move a tela através do scroll até o final da página
    Then usuário visualizará o campo Atendimento pelo Whatsapp contendo a frase e o número do telefone sublinhado:
      | Atendimento pelo Whatsapp,Tire suas dúvidas com nosso atendimento pelo Whatsapp a qualquer momento,Telefone,+55 (11) 94270 1270 |

