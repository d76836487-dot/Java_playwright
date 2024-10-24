package com.fiserv.qabrazil;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(
     features = "classpath:com/fiserv/qabrazil/features/Regressivo"
    ,tags = ("")
    ,dryRun = false
)
public class Runner extends AbstractTestNGCucumberTests{

}