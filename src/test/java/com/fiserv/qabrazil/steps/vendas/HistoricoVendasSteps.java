package com.fiserv.qabrazil.steps.vendas;

import com.fiserv.qabrazil.pages.vendas.relatorioVendas.HistoricoVendasPage;
import com.fiserv.qabrazil.pages.vendas.relatorioVendas.VendasPage;
import io.cucumber.java.en.And;
import org.springframework.beans.factory.annotation.Autowired;

public class HistoricoVendasSteps {
    @Autowired
    HistoricoVendasPage historicoVendasPage;

    @And("verifica os dados do link Mais detalhes")
    public void verifica_os_dados_do_link_Mais_detalhes() {
        historicoVendasPage.verificarDadosMaisDetalhes();
    }
}