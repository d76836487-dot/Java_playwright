package com.fiserv.qabrazil;

import io.cucumber.testng.FeatureWrapper;
import io.cucumber.testng.PickleWrapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testng.IRetryAnalyzer;
import org.testng.ITestResult;

public class RetryOnFailure implements IRetryAnalyzer {

    private static final Logger log = LoggerFactory.getLogger(RetryOnFailure.class);

    private int retryCount = 0;
    private static final int maxRetryCount = 1;

    @Override
    public boolean retry(ITestResult result) {
        if (retryCount < maxRetryCount) {
            Object[] params = result.getParameters();
            if (params.length != 2 ||
                    !(params[0] instanceof PickleWrapper scenario) ||
                    !(params[1] instanceof FeatureWrapper feature)) {
                throw new IllegalArgumentException("Expected 2 params of type PickleWrapper and FeatureWrapper");
            }
            String featureName = feature.toString();
            String scenarioName = scenario.toString();
            log.info("Will retry {} > {}",featureName, scenarioName);
            retryCount++;
            return true;
        }
        return false;
    }
}
