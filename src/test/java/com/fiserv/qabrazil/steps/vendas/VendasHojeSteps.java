package com.fiserv.qabrazil.steps.vendas;

import com.fiserv.qabrazil.pages.vendas.relatorioVendas.hoje.VendasHojePage;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

public class VendasHojeSteps {
    @Autowired
    VendasHojePage vendasHojePage;

    @Then("valida que o Vendas Hoje foi acessado com sucesso")
    public void valida_que_o_Vendas_Hoje_foi_acessado_com_sucesso() {
        vendasHojePage.verificarVendasHoje();
    }

    @And("visualiza os campos {string} e {string}")
    public void visualiza_os_campos(String campo1, String campo2) {
        if (campo1.equalsIgnoreCase("Total de vendas"))
            vendasHojePage.verificarTotalVendas();
        if (campo2.equalsIgnoreCase("Valor bruto"))
            vendasHojePage.verificarValorBruto();
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

    @And("valida o nome do arquivo {string} ao clicar em Exportar")
    public void valida_o_nome_do_arquivo_ao_clicar_em_Exportar(String tipoArquivo) {
        vendasHojePage.validarNomeArquivo(tipoArquivo);
    }
}
