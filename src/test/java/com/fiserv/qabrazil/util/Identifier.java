package com.fiserv.qabrazil.util;

import com.fiserv.qabrazil.config.TestIdsConfig;
import io.cucumber.java.ParameterType;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class Identifier {

    private static final Map<String, Identifier> cache = new ConcurrentHashMap<>();

    private final String displayName;
    private final String testId;
    private final String selector;

    public static Identifier from(String displayName) {
        return cache.computeIfAbsent(displayName, Identifier::new);
    }

    private Identifier(String displayName) {
        this.displayName = displayName;
        testId = TestIdsConfig.getTestId(displayName);
        selector = TestIdsConfig.getQuerySelector(displayName);
    }

    public String testId() {
        return testId;
    }

    public String selector() {
        return selector;
    }

    @ParameterType("\"([^\"]+)\"")
    public static Identifier identifier(String displayName) {
        return from(displayName);
    }

    @ParameterType("\"([^\"]+)\" (?:no|na) \"([^\"]+)\"")
    public static Identifier identifierAndSection(String displayName, String section) {
        return from(section + " - " + displayName);
    }

    @Override
    public String toString() {
        return "Identifier{" +
                "displayName='" + displayName + '\'' +
                '}';
    }
}
