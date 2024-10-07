package com.fiserv.qabrazil;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(
     features = "classpath:com/fiserv/qabrazil/features/Regressivo"
    //tags = "@alliances"
    //tags = "@sicredi"
    //tags = "@HealthCheck"
    //tags = "@WhatsApp"
    ,tags = "@Antecipacao1"
    //tags = "@HeaderAll"
    //Agenda de recebimentos
    //tags = "@Vendas_Agenda_recebimentos_semana"
    //tags = "@_agenda"
    //tags = "@TestCaseKey=SMP-T306-Sicredi" //Feito
    //tags = "@TestCaseKey=SMP-T363_Sicredi"
    //tags = "@HealthCheckHomeItens"
    //tags = "@banner" // quebrando na afiz, ligar o banner, falar com sandro
    //tags = "@vendasHoje"
    //tags = "@Recebimentos"
    //tags = "@UltimasVendas"
    //tags = "@AgeRecSemana"
    //tags = "@CalcCardRec"
    //tags = "@Ocultarvalores" //rever este
    //tags = "@HealthCheckAntecipação"
    //tags = "@LPDC-T248" << bug aberto https://enterprise-jira.onefiserv.net/browse/LPDC-243
    //tags = "@Antecipacao1" // OK
    //tags = "@RecebimentoPrevisto"
    //tags = "@HeaderAll"
    //tags = "@refreshtokenN"
)
public class Runner extends AbstractTestNGCucumberTests{

}