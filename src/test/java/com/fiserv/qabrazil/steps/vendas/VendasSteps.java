package com.fiserv.qabrazil.steps.vendas;

import com.fiserv.qabrazil.pages.vendas.relatorioVendas.VendasPage;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

public class VendasSteps {
    @Autowired
    VendasPage vendasPage;

    @Then("valida que a aba {string} do relatorio foi acessada com sucesso")
    public void valida_que_a_aba_do_relatorio_foi_acessada_com_sucesso(String abaRelatorio) {
        vendasPage.validarCarregamentoAbaRelatorio(abaRelatorio);
    }
}