package com.fiserv.qabrazil.steps.vendas;

import com.fiserv.qabrazil.pages.vendas.relatorioVendas.*;
import io.cucumber.java.en.And;
import org.springframework.beans.factory.annotation.Autowired;

public class HistoricoVendasSteps {
    @Autowired
    HistoricoVendasPage historicoVendasPage;

    @And("verifica os dados do link Mais detalhes")
    public void verifica_os_dados_do_link_Mais_detalhes() {
        historicoVendasPage.verificarDadosMaisDetalhes();
    }
 
    @And("verifica se o Valor original da venda {string}")
    public void verifica_se_o_Valor_original_da_venda(String visivel) {
        historicoVendasPage.verificarValorOriginalVenda(visivel);
    }
}