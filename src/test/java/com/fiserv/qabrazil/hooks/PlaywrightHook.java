package com.fiserv.qabrazil.hooks;

import com.fiserv.automation.framework.common.consts.HookOrder;
import com.fiserv.automation.framework.playwright.service.PlaywrightScenarioService;
import com.fiserv.qabrazil.util.Config;
import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Page;
import io.cucumber.java.After;
import io.cucumber.java.Scenario;
import org.springframework.beans.factory.annotation.Autowired;

public class PlaywrightHook {

    @Autowired
    PlaywrightScenarioService playwrightScenarioService;

    @Autowired
    Page page;

    @Autowired
    BrowserContext browserContext;

    @After(order = HookOrder.IMMEDIATELY_AFTER_SCENARIO, value = Config.TAG_CUCUMBER)
    public void handleScreenshotEmbedToScenario(Scenario scenario) {
        // the page should not be closed when taking screenshots
        playwrightScenarioService.handleScreenshotEmbedToScenario(scenario, page);
    }

    @After(order = HookOrder.IMMEDIATELY_AFTER_SCENARIO, value = Config.TAG_CUCUMBER)
    public void handleVideoEmbedToScenario(Scenario scenario) {
        // saves video when the page is closed
        browserContext.onClose(ignore -> playwrightScenarioService.handleVideoEmbedToScenario(scenario, page));
    }

    @After(order = HookOrder.IMMEDIATELY_AFTER_SCENARIO, value = Config.TAG_CUCUMBER)
    public void handleStorageStateSaving() {
        playwrightScenarioService.handleStorageStateSaving(browserContext);
    }

    @After(order = HookOrder.AFTER_SCENARIO, value = Config.TAG_CUCUMBER)
    public void closeBrowserContext() {
        browserContext.close();
    }
}
