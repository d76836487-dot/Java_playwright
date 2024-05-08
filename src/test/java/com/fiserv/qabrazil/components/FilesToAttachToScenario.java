package com.fiserv.qabrazil.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

@ScenarioComponent
public class FilesToAttachToScenario {
    private byte[] content;
    private String contentType;
    private String name;

    public byte[] getContent() {
        return content;
    }

    public String getContentType() {
        return contentType;
    }

    public String getName() {
        return name;
    }

    public boolean hasAttachment() {
        return content != null;
    }

    public BufferedInputStream setAttachment(InputStream inputStream, String contentType, String name) throws IOException {
        this.contentType = contentType;
        this.name = name;
        return getAsBufferedInputStream(inputStream);
    }

    private BufferedInputStream getAsBufferedInputStream(InputStream inputStream) throws IOException {
        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream, 50000);
        bufferedInputStream.mark(0);
        content = bufferedInputStream.readAllBytes();
        bufferedInputStream.reset();
        return bufferedInputStream;
    }
}
