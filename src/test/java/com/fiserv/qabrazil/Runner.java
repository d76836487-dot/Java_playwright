package com.fiserv.qabrazil;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;


@CucumberOptions(
        features = "classpath:com/fiserv/qabrazil/features/Regressivo",

        //tags= "@sicredi_T164"
        //Agenda de recebimentos
        //tags= "@Vendas_Agenda_recebimentos_semana"
        //tags="@_agenda"
        //tags="@TestCaseKey=SMP-T306-Sicredi" //Feito
        //tags="@TestCaseKey=SMP-T363_Sicredi"

        tags="@WhatsApp"

)
public class Runner extends AbstractTestNGCucumberTests{

}
