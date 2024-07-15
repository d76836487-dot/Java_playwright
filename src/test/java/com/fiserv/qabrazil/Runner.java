package com.fiserv.qabrazil;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;


@CucumberOptions(

        //tags= "@sicredi_T164"
        //Agenda de recebimentos
        //tags= "@Vendas_Agenda_recebimentos_semana"
        //tags="@_agenda"
        tags="@TestCaseKey=SMP-T306-Sicredi" // este teste esta chamado token de API, ver com Wandart..
        //tags="@TestCaseKey=SMP-T363_Sicredi"

)
public class Runner extends AbstractTestNGCucumberTests{

}
