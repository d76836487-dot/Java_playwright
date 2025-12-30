package com.fiserv.qabrazil.util;

import org.awaitility.Awaitility;

import java.time.Duration;

public class WaitUtil {
    public static void sleep(Duration duration) {
        Awaitility.await()
            .pollInSameThread()
            .pollDelay(duration)
            .forever()
            .until(() -> true
        );
    }
} 