package com.fiserv.automation.playwright.configuration;

import org.springframework.stereotype.Component;

@Component
public class StorageState {
    private String storageState = null;
    private String loggedUrl = null;

    public String getStorageState() {
        return storageState;
    }

    public String getLoggedUrl() {
        return loggedUrl;
    }

    public void init(String storageState, String loggedUrl) {
        if (stateIsReady()) return;

        this.storageState = storageState;
        this.loggedUrl = loggedUrl;
    }

    public boolean stateIsReady() {
        return storageState != null;
    }

    public void clearState() {
        storageState = null;
        loggedUrl = null;
    }
}
