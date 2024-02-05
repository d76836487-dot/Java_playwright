package com.fiserv.qabrazil.hooks;

import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Page;
import io.cucumber.java.After;
import io.cucumber.java.Scenario;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.nio.file.Files;

public class RecordingHook {

    @Autowired
    private Page page;

    @Autowired
    private BrowserContext context;

    @After
    public void tearDown(Scenario scenario) {
        if (scenario.isFailed()) {
            scenario.attach(page.screenshot(new Page.ScreenshotOptions().setFullPage(true)),
                    "image/png", "Screen Shot");
            scenario.attach(page.content(), "text/html", "Content");
        }
    }

    @After("@playwright and not @ignore")
    @SneakyThrows(IOException.class)
    public void after(Scenario scenario) {
        context.close();
        if (!page.isClosed()) {
            byte[] video = Files.readAllBytes(page.video().path());
            scenario.attach(video, "video/mp4", scenario.getName());
            page.video().delete();

            scenario.attach(page.screenshot(new Page.ScreenshotOptions().setFullPage(true)),
                    "image/png", "Screen Shot");
            scenario.attach(page.content(), "text/html", "Content");
        }
    }
}
