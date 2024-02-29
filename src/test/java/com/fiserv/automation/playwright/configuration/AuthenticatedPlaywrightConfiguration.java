package com.fiserv.automation.playwright.configuration;


import com.fiserv.automation.framework.annotations.ScenarioScope;
import com.microsoft.playwright.Browser;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.ScopedProxyMode;

import java.nio.file.Paths;

@Lazy
@TestConfiguration
public class AuthenticatedPlaywrightConfiguration {
    @Autowired
    private StorageState storageState;

    public AuthenticatedPlaywrightConfiguration() {
    }

    @Bean
    @Primary
    @ScenarioScope(
            proxyMode = ScopedProxyMode.NO
    )
    public BrowserContext authenticatedBrowserContext(Browser browser) {
        Browser.NewContextOptions newContextOptions = new Browser.NewContextOptions();
        if (storageState.stateIsReady()) {
            newContextOptions = newContextOptions.setStorageState(storageState.getStorageState());
        }
        return browser.newContext(newContextOptions.setRecordVideoDir(Paths.get("target/temp/")));
    }

    @Bean
    @Primary
    @ScenarioScope(
            proxyMode = ScopedProxyMode.NO
    )
    public Page authenticatedPage(BrowserContext browserContext) {
        return browserContext.newPage();
    }
}
