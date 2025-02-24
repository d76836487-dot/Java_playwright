package com.fiserv.qabrazil.steps.componentes.relatorios;

import com.fiserv.qabrazil.pages.componentes.relatorios.ComponentesRelatoriosPage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

public class ComponentesRelatoriosSteps {
    @Autowired
    ComponentesRelatoriosPage componentesRelatoriosPage;

    @Then("valida que a aba {string} do relatorio foi acessada com sucesso")
    public void valida_que_a_aba_do_relatorio_foi_acessada_com_sucesso(String abaRelatorio) {
        componentesRelatoriosPage.validarCarregamentoAbaRelatorio(abaRelatorio);
    }

    @And("visualiza os campos {string} - {string}")
    public void visualiza_os_campos(String campos, @NotNull String abaRelatorio) {
        componentesRelatoriosPage.verificarCampos(campos, abaRelatorio);
    }

    @And("aplica o periodo {string}")
    public void aplica_o_periodo(String periodo) {
        componentesRelatoriosPage.aplicarPeriodo(periodo);
    }

    @And("valida o periodo {string} aplicado - {string}")
    public void valida_o_periodo_aplicado(String periodo, String abaRelatorio) {
        componentesRelatoriosPage.validarPeriodoAplicado(periodo, abaRelatorio);
    }

    @And("realiza a personalizacao das colunas {string} - {string}")
    public void realiza_a_personalizacao_das_colunas(String colunas, String abaRelatorio) {
        componentesRelatoriosPage.personalizarColunas(colunas, abaRelatorio);
    }

    @And("valida que foi aplicado a personalizacao das colunas {string} - {string}")
    public void valida_que_foi_aplicado_a_personalizacao_das_colunas(String colunas, String abaRelatorio) {
        componentesRelatoriosPage.validarPersonalizacaoColunas(colunas, abaRelatorio);
    }

    @And("aplicar o filtro {string} atribuindo o valor {string} - {string}")
    public void aplicar_o_filtro_atribuindo_o_valor(String filtro, String valor, String abaRelatorio) {
        componentesRelatoriosPage.realizarFiltro(filtro, valor, abaRelatorio);
    }

    @And("valida que foi atribuido o valor {string} do filtro {string} - {string}")
    public void valida_que_foi_atribuido_o_valor_do_filtro(String valor, String filtro, String abaRelatorio) {
        componentesRelatoriosPage.validarAtribuicaoFiltro(valor, filtro, abaRelatorio);
    }

    @And("valida o nome do arquivo para o Tipo de arquivo {string} e Tipo de relatorio {string} gerado - {string}")
    public void valida_o_nome_do_arquivo_para_o_Tipo_de_arquivo_e_Tipo_de_relatorio_gerado(String tipoArquivo, String tipoRelatorio, String abaRelatorio) {
        componentesRelatoriosPage.validarNomeArquivo(tipoArquivo, tipoRelatorio, abaRelatorio);
    }

    @And("valida as colunas {string} do arquivo para o Tipo de arquivo {string} e Tipo de relatorio {string} gerado - {string}")
    public void valida_as_colunas_do_arquivo_para_o_Tipo_de_arquivo_e_Tipo_de_relatorio__gerado(String colunas, String tipoArquivo, String tipoRelatorio, String abaRelatorio) throws IOException {
        componentesRelatoriosPage.validarColunasArquivo(colunas, tipoArquivo, tipoRelatorio, abaRelatorio);
    }
}