package com.fiserv.qabrazil.steps.antecipacao;

import com.fiserv.qabrazil.pages.antecipacao.AntecipacaoAutomaticaPage;
import com.fiserv.qabrazil.pages.antecipacao.AntecipacaoEventualPage;
import io.cucumber.java.en.And;
import org.springframework.beans.factory.annotation.Autowired;

public class SolicitarAntecipacaoSteps {
    @Autowired
    AntecipacaoAutomaticaPage antecipacaoAutomaticaPage;
    @Autowired
    AntecipacaoEventualPage antecipacaoEventualPage;

    @And("solicitar anticipacao automatica contendo os seguintes valores Bandeiras {string}, Produtos {string}, Frequencia {string} e Dia de recebimento {string}")
    public void solicitar_anticipacao_automatica_contendo_os_seguintes_valores_Bandeiras_Produtos_Frequencia__e_Dia_de_recebimento(
     String bandeiras
    ,String produtos
    ,String frequencia 
    ,String diaRecebimento) {
        antecipacaoAutomaticaPage.solicitarAntecipacaoAutomatica(
         bandeiras
        ,produtos
        ,frequencia
        ,diaRecebimento);
    }

    @And("solicitar anticipacao eventual contendo os seguintes valores Bandeiras {string}, Produtos {string}, Todo o periodo {string}, Vencimento de {string}, Ate {string}, Valor {string} e Minimo ou Maximo {string}")
    public void solicitar_anticipacao_eventual_contendo_os_seguintes_valores_Bandeiras_Produtos_Todo_o_periodo_Vencimento_de_Ate_Valor_e_Minimo_ou_Maximo(
     String bandeiras
    ,String produtos
    ,String todoPeriodo
    ,String diaVencimentoDe
    ,String diaAte
    ,String valor
    ,String minimoMaximo
    ) {
        antecipacaoEventualPage.solicitarAntecipacaoEventual(
             bandeiras
            ,produtos
            ,todoPeriodo
            ,diaVencimentoDe
            ,diaAte
            ,valor
            ,minimoMaximo
        );
    }
}