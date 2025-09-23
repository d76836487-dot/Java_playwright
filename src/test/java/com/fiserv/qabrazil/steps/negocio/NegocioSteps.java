package com.fiserv.qabrazil.steps.negocio;

import com.fiserv.qabrazil.pages.negocio.NegocioPage;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

public class NegocioSteps {
    @Autowired
    NegocioPage negocioPage;

    @Then("valido a troca do estabelecimento")
    public void valido_a_troca_do_estabelecimento() {
        negocioPage.validarTrocaEstabelecimento();
    }

    @Then("verifico os Dados Cadastrais")
    public void verifico_os_Dados_Cadastrais() {
        negocioPage.validarDadosCadastrais();
    }

    @Then("realiza o filtro no campo {string} atribuindo o valor {string}")
    public void realiza_o_filtro_no_campo_atribuindo_o_valor(String filtro, String valor) {
        negocioPage.validarFiltroMeusDomicilios(filtro, valor);
    }

    @Then("valido o acesso ao Inteligencia financeira")
    public void valido_o_acesso_ao_Inteligencia_financeira() {
        negocioPage.validarInteligenciaFinanceira();
    }

    @Then("valida a busca por terminal no link Ver todos os terminais")
    public void valida_a_busca_por_terminal_no_link_Ver_todos_os_terminais() {
        negocioPage.validarBuscaTerminal();
    }

    @Then("valida Meus Terminais")
    public void valida_Meus_Terminais() {
        negocioPage.validarMeusTerminais();
    }

    @Then("valida as Taxas e Tarifas por Bandeira {string}")
    public void valida_as_Taxas_e_Tarifas_por_Bandeira(String bandeira) {
        negocioPage.validarTaxasTarifasPorBandeira(bandeira);
    }
}