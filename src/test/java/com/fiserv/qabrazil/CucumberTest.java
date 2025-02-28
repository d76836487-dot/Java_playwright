package com.fiserv.qabrazil;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import org.testng.annotations.DataProvider;

public class CucumberTest extends AbstractTestNGCucumberTests {
    @DataProvider(parallel = false)
    @Override
    public Object[][] scenarios() {
        return super.scenarios();
    }
}