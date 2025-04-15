package com.fiserv.qabrazil.util;

public class Config {
    // tempo de aguardo
    public static int wait_for_seconds(int seconds) {
        return seconds * 1000;
    }

    // tag do cucumber
    public static final String TAG_CUCUMBER = "@Login and not @claropay";
}