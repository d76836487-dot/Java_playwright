package com.fiserv.automation.playwright.configuration;


import com.fiserv.automation.framework.annotations.ScenarioScope;
import com.fiserv.qabrazil.pages.PageField;
import com.microsoft.playwright.Browser;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Page;

import java.nio.file.Paths;

import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.ScopedProxyMode;

@Lazy
@TestConfiguration
public class AuthenticatedPlaywrightConfiguration {
    public AuthenticatedPlaywrightConfiguration() {
    }

    @Bean
    @Primary
    @ScenarioScope(
            proxyMode = ScopedProxyMode.NO
    )
    public BrowserContext authenticatedBrowserContext(Browser browser) {
        Browser.NewContextOptions newContextOptions = new Browser.NewContextOptions();
        if (StorageState.storageState != null) {
            newContextOptions = newContextOptions.setStorageState(StorageState.storageState);
        }
        BrowserContext browserContext = browser.newContext(newContextOptions.setRecordVideoDir(Paths.get("target/temp/")));
        PageField.context = browserContext;
        return browserContext;
    }

    @Bean
    @Primary
    @ScenarioScope(
            proxyMode = ScopedProxyMode.NO
    )
    public Page authenticatedPage(BrowserContext browserContext) {
        Page page = browserContext.newPage();
        PageField.page = page;
        return page;
    }
}
