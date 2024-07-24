package com.fiserv.qabrazil;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;


@CucumberOptions(
        features = "classpath:com/fiserv/qabrazil/features/Regressivo",

            tags= "@alliances"

        //tags= "@HealthCheck"

            //tags= "@sicredi_T164"
            //Agenda de recebimentos
            //tags= "@Vendas_Agenda_recebimentos_semana"
            //tags="@_agenda"
            //tags="@TestCaseKey=SMP-T306-Sicredi" //Feito
            //tags="@TestCaseKey=SMP-T363_Sicredi"
            //tags="@HealthCheckHomeItens"
            //tags="@banner" // quebrando na afiz, ligar o banner, falar com sandro
            //tags="@vendasHoje"
            //tags="@Antecipação"
            //tags="@Recebimentos"
            //tags="@UltimasVendas"
            //tags="@AgeRecSemana"
            //tags="@CalcCardRec"
            //tags="@Ocultarvalores" //rever este

        //tags= "@HealthCheckAntecipação"

            //tags= "@LPDC-T319"

       // tags= "@Antecipacao1"


)
public class Runner extends AbstractTestNGCucumberTests{

}
