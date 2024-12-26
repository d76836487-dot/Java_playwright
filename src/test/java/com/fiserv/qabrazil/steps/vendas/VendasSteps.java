package com.fiserv.qabrazil.steps.vendas;

import com.fiserv.qabrazil.pages.vendas.relatorioVendas.VendasPage;
import com.fiserv.qabrazil.pages.vendas.relatorioVendas.HojePage;
import com.fiserv.qabrazil.pages.vendas.relatorioVendas.HistoricoVendasPage;
import com.fiserv.qabrazil.pages.vendas.relatorioVendas.NaoEfetivadasPage;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

public class VendasSteps {
    @Autowired
    VendasPage vendasPage;

    @Autowired
    HojePage hojePage;

    @Autowired
    HistoricoVendasPage historicoVendasPage;

    @Autowired
    NaoEfetivadasPage naoEfetivadasPage;

    @Then("valida que a aba {string} do relatorio foi acessada com sucesso")
    public void valida_que_a_aba_do_relatorio_foi_acessada_com_sucesso(String abaRelatorio) {
        vendasPage.validarCarregamentoAbaRelatorio(abaRelatorio);
    }

    @And("visualiza os campos {string} - {string}")
    public void visualiza_os_campos(String campos, @NotNull String abaRelatorio) {
        if (abaRelatorio.equalsIgnoreCase("Hoje"))
            hojePage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Histórico de vendas"))
            historicoVendasPage.verificarCampos(campos);
        else if (abaRelatorio.equalsIgnoreCase("Não efetivadas"))
            naoEfetivadasPage.verificarCampos(campos);
    }

    @And("realiza a personalizacao das colunas {string} - {string}")
    public void realiza_a_personalizacao_das_colunas(String colunas, String abaRelatorio) {
        vendasPage.personalizarColunas(colunas, abaRelatorio);
    }

    @And("valida que foi aplicado a personalizacao das colunas {string} - {string}")
    public void valida_que_foi_aplicado_a_personalizacao_das_colunas(String colunas, String abaRelatorio) {
        vendasPage.validarPersonalizacaoColunas(colunas, abaRelatorio);
    }

    @And("aplicar o filtro {string} atribuindo o valor {string} - {string}")
    public void aplicar_o_filtro_atribuindo_o_valor(String filtro, String valor, String abaRelatorio) {
        vendasPage.realizarFiltro(filtro, valor, abaRelatorio);
    }

    @And("valida que foi atribuido o valor {string} do filtro {string} - {string}")
    public void valida_que_foi_atribuido_o_valor_do_filtro(String valor, String filtro, String abaRelatorio) {
        vendasPage.validarAtribuicaoFiltro(valor, filtro, abaRelatorio);
    }

    @And("valida o nome do arquivo {string} gerado - {string}")
    public void valida_o_nome_do_arquivo_gerado(String tipoArquivo, String abaRelatorio) {
        vendasPage.validarNomeArquivo(tipoArquivo, abaRelatorio);
    }

    @And("valida as colunas {string} do arquivo {string} gerado - {string}")
    public void valida_as_colunas_do_arquivo_gerado(String colunas, String tipoArquivo, String abaRelatorio) throws IOException {
        vendasPage.validarColunasArquivo(colunas, tipoArquivo, abaRelatorio);
    }
}