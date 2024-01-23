package com.fiserv.qabrazil;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import org.testng.annotations.DataProvider;

public class CucumberTest extends AbstractTestNGCucumberTests {
    @DataProvider()
    @Override
    public Object[][] scenarios() {
        return super.scenarios();
    }
}
