package com.fiserv.qabrazil.hooks;

import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Page;
import io.cucumber.java.After;
import io.cucumber.java.Scenario;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.nio.file.Files;

public class RecordingHook {

    @Autowired
    private Page page;

    @Autowired
    private BrowserContext context;

    @After("@playwright and not @ignore")
    public void tearDown(Scenario scenario) throws IOException {
        saveScreenshot(scenario);
        saveVideo(scenario);
    }

    private void saveScreenshot(Scenario scenario) {
        if (scenario.isFailed()) {
            scenario.attach(page.screenshot(new Page.ScreenshotOptions().setFullPage(true)),
                    "image/png", "Screen Shot");
            scenario.attach(page.content(), "text/html", "Content");
        }
    }

    public void saveVideo(Scenario scenario) throws IOException {
        context.close();
        if (!page.isClosed()) {
            byte[] video = Files.readAllBytes(page.video().path());
            scenario.attach(video, "video/mp4", scenario.getName());
            page.video().delete();
        }
    }
}
