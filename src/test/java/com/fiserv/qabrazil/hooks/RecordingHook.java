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

    @After("@playwright and not @ignore")
    @SneakyThrows(IOException.class)
    public void after(Scenario scenario) throws IOException {
        context.close();
        byte[] video = Files.readAllBytes(page.video().path());
        scenario.attach(video, "video/mp4", scenario.getName());
        page.video().delete();
    }
}
