package com.fiserv.automation.playwright.configuration;


import com.fiserv.automation.framework.annotations.ScenarioScope;
import com.fiserv.automation.playwright.properties.LaunchOptionsProperties;
import com.microsoft.playwright.Browser;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.BrowserType;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.Playwright;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Lazy;
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
    public Playwright playwright() {
        return Playwright.create();
    }

    @Bean
    public BrowserType.LaunchOptions launchOptions(LaunchOptionsProperties launchOptionsProperties) {
        return new BrowserType.LaunchOptions()
                .setArgs(launchOptionsProperties.getArgs())
                .setChannel(launchOptionsProperties.getChannel())
                .setChromiumSandbox(launchOptionsProperties.getChromiumSandbox())
                .setDevtools(launchOptionsProperties.getDevtools())
                .setDownloadsPath(launchOptionsProperties.getDownloadsPath())
                .setEnv(launchOptionsProperties.getEnv())
                .setExecutablePath(launchOptionsProperties.getExecutablePath())
                .setFirefoxUserPrefs(launchOptionsProperties.getFirefoxUserPrefs())
                .setHandleSIGHUP(launchOptionsProperties.getHandleSIGHUP())
                .setHandleSIGINT(launchOptionsProperties.getHandleSIGINT())
                .setHandleSIGTERM(launchOptionsProperties.getHandleSIGTERM())
                .setHeadless(launchOptionsProperties.getHeadless())
                .setIgnoreAllDefaultArgs(launchOptionsProperties.getIgnoreAllDefaultArgs())
                .setIgnoreDefaultArgs(launchOptionsProperties.getIgnoreDefaultArgs())
                .setProxy(launchOptionsProperties.getProxy())
                .setSlowMo(launchOptionsProperties.getSlowMo())
                .setTimeout(launchOptionsProperties.getTimeout())
                .setTracesDir(launchOptionsProperties.getTracesDir());
    }

    @Bean
    public Browser browser(Playwright playwright, BrowserType.LaunchOptions launchOptions) {
        return playwright.chromium().launch(launchOptions);
    }

    @Bean
    @ScenarioScope(proxyMode = ScopedProxyMode.NO)
    public BrowserContext authenticatedBrowserContext(Browser browser) {
        Browser.NewContextOptions newContextOptions = new Browser.NewContextOptions();
        if (storageState.stateIsReady()) {
            newContextOptions = newContextOptions.setStorageState(storageState.getStorageState());
        }
        return browser.newContext(newContextOptions.setRecordVideoDir(Paths.get("target/temp/")));
    }

    @Bean
    @ScenarioScope(proxyMode = ScopedProxyMode.NO)
    public Page authenticatedPage(BrowserContext browserContext) {
        return browserContext.newPage();
    }
}
