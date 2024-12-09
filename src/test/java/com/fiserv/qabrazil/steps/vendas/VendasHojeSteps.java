package com.fiserv.qabrazil.steps.vendas;

import com.fiserv.qabrazil.pages.vendas.relatorioVendas.hoje.VendasHojePage;
import io.cucumber.java.en.And;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

public class VendasHojeSteps {
    @Autowired
    VendasHojePage vendasHojePage;

    @And("visualiza os campos {string}")
    public void visualiza_os_campos(String campos) {
        vendasHojePage.verificarCampos(campos);
    }

    @And("realiza a personalizacao das colunas {string}")
    public void realiza_a_personalizacao_das_colunas(String colunas) {
        vendasHojePage.personalizarColunas(colunas);
    }

    @And("valida que foi aplicado a personalizacao das colunas {string}")
    public void valida_que_foi_aplicado_a_personalizacao_das_colunas(String colunas) {
        vendasHojePage.validarPersonalizacaoColunas(colunas);
    }

    @And("aplicar o filtro {string} atribuindo o valor {string}")
    public void aplicar_o_filtro_atribuindo_o_valor(String filtro, String valor) {
        vendasHojePage.realizarFiltro(filtro, valor);
    }

    @And("valida que foi atribuido o valor {string} do filtro {string}")
    public void valida_que_foi_atribuido_o_valor_do_filtro(String valor, String filtro) {
        vendasHojePage.validarAtribuicaoFiltro(valor, filtro);
    }

    @And("valida o nome do arquivo {string} gerado")
    public void valida_o_nome_do_arquivo_gerado(String tipoArquivo) {
        vendasHojePage.validarNomeArquivo(tipoArquivo);
    }

    @And("valida as colunas {string} do arquivo {string} gerado")
    public void valida_as_colunas_do_arquivo_gerado(String colunas, String tipoArquivo) throws IOException {
        vendasHojePage.validarColunasArquivo(colunas, tipoArquivo);
    }
}