#language: en
@Zephyr:ProjectKey=LPDC
@Zephyr:Folder=/Portal_do_Cliente/Regressivo/Taxista/Credenciamento_de_Taxistas
@Zephyr:Status=Deprecated
@Zephyr:Priority=High
@Zephyr:CustomFields=Ambiente=SIT,UAT;Plataforma=Web;Tipo_de_teste=Regressivo;Automation=Automated
@Automacao
@CredenciamentoTaxistas 
Feature: Credenciamento de Taxistas

  @TestCaseKey=LPDC-T866
  Scenario Outline: Realizar Cadastro do Credenciamento de Taxista
    Given que o usuário inicialize o cadastro de credenciamento de taxista
    When acessar a tela Para começar seu cadastro e preencher os dados <NomeCompleto>, <DataNascimento>, <Celular>, <Email>, <CPF>, <NomeFantasia>, <FaturamentoAnual> e <TicketMedio>
    And acessar a tela Produtos azulzinha e selecionar as opções <ProdutosAzulzinha>
    And acesar a tela Endereço e preencher os dados <Cep>, <Logradouro>, <SemNumero>, <Numero>, <Complemento>, <Bairro>, <Cidade>, <Estado>, <PontoReferencia>, <AlterarNegocio1> e <AlterarDadosPessoais1>
    And acesar a tela Conta de recebimento e preencher os dados <TipoConta>, <Agencia>, <Operacao>, <Conta>, <AlterarNegocio2>, <AlterarDadosPessoais2> e <ExpandirEndereco>
    And acessar a tela Revise seu pedido e conferir os dados <AlterarSobreVoce>, <AlterarSobreSeuNegocio>, <AlterarEndereco> e <AlterarContaRecebimento>
    Then é validado que o pedido foi realizado com sucesso
    Examples:
      | NomeCompleto        | DataNascimento | Celular       | Email                            | CPF           | NomeFantasia            | FaturamentoAnual | TicketMedio | ProdutosAzulzinha | Cep        | Logradouro      | SemNumero | Numero | Complemento   | Bairro   | Cidade           | Estado           | PontoReferencia       | AlterarNegocio1 | AlterarDadosPessoais1 | TipoConta | Agencia | Operacao | Conta           | AlterarNegocio2 | AlterarDadosPessoais2 | ExpandirEndereco | AlterarSobreVoce | AlterarSobreSeuNegocio | AlterarEndereco | AlterarContaRecebimento |
      | "Max Bezerra Silva" | "03031995"     | "11911112222" | "joao_taxista_teste01@gmail.com" | "43731117827" | "João Taxista Teste 01" | "12000000"       | "1000000"   | "pro,aproxima"    | "20230010" | "Rua Riachuelo" | "N"       | "333"  | "Complemento" | "Centro" | "Rio de Janeiro" | "Rio de Janeiro" | "Ponto de referência" | "N"             | "N"                   | "C"       | "00040" | "3701"   | "0005904437214" | "N"             | "N"                   | "S"              | "N"              | "N"                    | "N"             | "N"                     |

    Examples:
      | NomeCompleto        | DataNascimento | Celular       | Email                            | CPF           | NomeFantasia            | FaturamentoAnual | TicketMedio | ProdutosAzulzinha | Cep        | Logradouro      | SemNumero | Numero | Complemento   | Bairro   | Cidade           | Estado           | PontoReferencia       | AlterarNegocio1 | AlterarDadosPessoais1 | TipoConta | Agencia | Operacao | Conta       | AlterarNegocio2 | AlterarDadosPessoais2 | ExpandirEndereco | AlterarSobreVoce | AlterarSobreSeuNegocio | AlterarEndereco | AlterarContaRecebimento |
      | "Max Bezerra Silva" | "03031995"     | "11911112222" | "joao_taxista_teste02@gmail.com" | "43731117827" | "João Taxista Teste 02" | "9000000"        | "750000"    | "aproxima"        | "20230010" | "Rua Riachuelo" | "N"       | "333"  | "Complemento" | "Centro" | "Rio de Janeiro" | "Rio de Janeiro" | "Ponto de referência" | "N"             | "N"                   | "C"       | "22660" | "01"     | "000202771" | "N"             | "N"                   | "S"              | "N"              | "N"                    | "N"             | "N"                     |

    Examples:
      | NomeCompleto        | DataNascimento | Celular       | Email                            | CPF           | NomeFantasia            | FaturamentoAnual | TicketMedio | ProdutosAzulzinha | Cep        | Logradouro      | SemNumero | Numero | Complemento   | Bairro   | Cidade           | Estado           | PontoReferencia       | AlterarNegocio1 | AlterarDadosPessoais1 | TipoConta | Agencia | Operacao | Conta           | AlterarNegocio2 | AlterarDadosPessoais2 | ExpandirEndereco | AlterarSobreVoce | AlterarSobreSeuNegocio | AlterarEndereco | AlterarContaRecebimento |
      | "Max Bezerra Silva" | "03031995"     | "11911112222" | "joao_taxista_teste03@gmail.com" | "43731117827" | "João Taxista Teste 03" | "7500000"        | "625000"    | "pro"             | "20230010" | "Rua Riachuelo" | "N"       | "333"  | "Complemento" | "Centro" | "Rio de Janeiro" | "Rio de Janeiro" | "Ponto de referência" | "N"             | "N"                   | "P"       | "00040" | "1288"   | "0202199000041" | "N"             | "N"                   | "S"              | "N"              | "N"                    | "N"             | "N"                     |

    Examples:
      | NomeCompleto        | DataNascimento | Celular       | Email                            | CPF           | NomeFantasia            | FaturamentoAnual | TicketMedio | ProdutosAzulzinha | Cep        | Logradouro      | SemNumero | Numero | Complemento   | Bairro   | Cidade           | Estado           | PontoReferencia       | AlterarNegocio1 | AlterarDadosPessoais1 | TipoConta | Agencia | Operacao       | Conta           | AlterarNegocio2 | AlterarDadosPessoais2 | ExpandirEndereco | AlterarSobreVoce | AlterarSobreSeuNegocio | AlterarEndereco | AlterarContaRecebimento |
      | "Max Bezerra Silva" | "03031995"     | "11911112222" | "joao_taxista_teste04@gmail.com" | "43731117827" | "João Taxista Teste 04" | "12000000"       | "1000000"   | "pro,aproxima"    | "20230010" | "Rua Riachuelo" | "N"       | "333"  | "Complemento" | "Centro" | "Rio de Janeiro" | "Rio de Janeiro" | "Ponto de referência" | "N"             | "N"                   | "C"       | "22660" | "Sem Operação" | "0000000202711" | "N"             | "N"                   | "S"              | "N"              | "N"                    | "N"             | "N"                     |

