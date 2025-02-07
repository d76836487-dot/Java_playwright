package com.fiserv.qabrazil;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(
    plugin = {
         "pretty"
        ,"json:target/cucumber/report.json"
        //,"me.jvt.cucumber.report.PrettyReports:target/cucumber"
    }
    ,features = "classpath:com/fiserv/qabrazil/features/Regressivo"
    ,glue = {"com.fiserv"}
    ,publish = false
    ,dryRun = false
    ,tags = ("")
)
public class CucumberTest extends AbstractTestNGCucumberTests {}