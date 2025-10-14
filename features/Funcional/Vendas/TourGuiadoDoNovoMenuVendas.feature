#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Funcional/Vendas/TourGuiadoDoNovoMenuVendas
@Zephyr:Status=Component
@Zephyr:Status=Approved
@Zephyr:Priority=Normal
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Pending
Feature: VendasHoje


Scenario: Apresentar tour guiado no primeiro acesso ao novo menu Vendas
    Given que o usuário acessa o novo menu Vendas pela primeira vez
    When o sistema detecta o primeiro acesso
    Then o sistema deve apresentar o "Tour guiado" de apresentação do novo menu Vendas

Scenario: Apresentar benefícios do novo menu Vendas ao clicar em "Saber mais"
    Given que o usuário está no "Tour guiado" do novo menu Vendas
    When o usuário clica em "Saber mais"
    Then o sistema deve apresentar os benefícios do novo menu Vendas em 5 telas com botões "Voltar", "Próximo" e "Concluir"

Scenario: Repetir tour guiado ao clicar no ícone de ajuda
    Given que o usuário já completou o "Tour guiado" do novo menu Vendas
    When o usuário clica no ícone de ajuda ao lado do título do menu "Vendas"
    Then o sistema deve reiniciar o "Tour guiado" de apresentação do novo menu Vendas

Scenario Outline: Apresentar tour guiado para diferentes perfis de usuário
    Given que o usuário <perfil> acessa o novo menu Vendas pela primeira vez
    When o sistema detecta o primeiro acesso
    Then o sistema deve apresentar o "Tour guiado" de apresentação do novo menu Vendas
    Examples:
      | perfil                     |
      | Master                     |
      | Assistente de operação     |
      | Assistente de consulta     |
      | Operador                   |

Scenario: Apresentar telas específicas por aliança no tour guiado
    Given que o usuário acessa o novo menu Vendas pela primeira vez
    When o sistema detecta o primeiro acesso
    Then o sistema deve apresentar o "Tour guiado" de apresentação do novo menu Vendas
    And o sistema deve apresentar as telas específicas da aliança do usuário conforme o Figma
