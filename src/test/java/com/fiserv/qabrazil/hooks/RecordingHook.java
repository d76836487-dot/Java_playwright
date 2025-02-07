package com.fiserv.qabrazil.hooks;

import com.fiserv.qabrazil.components.FilesToAttachToScenario;
import com.fiserv.qabrazil.pages.home.HomeCustomizeModal;
import com.fiserv.qabrazil.util.Config;
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

    @Autowired
    private FilesToAttachToScenario filesToAttachToScenario;

@Autowired
HomeCustomizeModal homeCustomizeModal;

    @After()
    public void tearDown(Scenario scenario) throws IOException {
        if(Config.SessionLogado.equals("YES")){
            homeCustomizeModal.logout();
        }
        //saveScreenshotAndUrl(scenario);
        //saveVideo(scenario);
    }

    private void saveScreenshotAndUrl(Scenario scenario) {
        for (Page page : context.pages()) {
            scenario.attach(page.url(), "text/plain", "Url");
            scenario.attach(page.screenshot(
                 new Page.ScreenshotOptions().setFullPage(true))
                ,"image/png"
                , "Screen Shot"
            );
            scenario.attach(page.content(), "text/html", "Content");
        }

        if (filesToAttachToScenario.hasAttachment()) {
            scenario.attach(filesToAttachToScenario.getContent(), filesToAttachToScenario.getContentType(), filesToAttachToScenario.getName());
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