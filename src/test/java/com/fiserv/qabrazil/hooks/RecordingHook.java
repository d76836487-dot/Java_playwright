package com.fiserv.qabrazil.hooks;

import com.microsoft.playwright.BrowserContext;
import com.microsoft.playwright.Page;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

public class RecordingHook {

    @Autowired
    private Page page;

    @Autowired
    private BrowserContext context;

    private final List<Page> allPages = new ArrayList<>();

    @Before
    public void setup() {
        context.onPage(allPages::add);
    }

    @After("@playwright and not @ignore")
    public void tearDown(Scenario scenario) {
        saveScreenshotAndUrl(scenario);
//        saveVideo(scenario);
    }

    private void saveScreenshotAndUrl(Scenario scenario) {
        if (scenario.isFailed()) {
            for (Page page : allPages) {
                scenario.attach(page.url(), "text/plain", "Url");
                scenario.attach(page.screenshot(new Page.ScreenshotOptions().setFullPage(true)),
                        "image/png", "Screen Shot");
                scenario.attach(page.content(), "text/html", "Content");
            }
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
