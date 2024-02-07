package com.fiserv.automation.playwright.configuration;

public class StorageState {
    public static String storageState = null;
    public static String loggedUrl = null;

    public static boolean stateIsReady() {
        return StorageState.storageState != null;
    }
}
