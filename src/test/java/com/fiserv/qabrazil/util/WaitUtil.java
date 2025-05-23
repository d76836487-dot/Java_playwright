package com.fiserv.qabrazil.util;

import org.awaitility.Awaitility;

import java.time.Duration;

public class WaitUtil {
    private static final ThreadLocal<Boolean> alreadyWaiting = ThreadLocal.withInitial(() -> false);

    public static void sleep(Duration duration) {
        Awaitility.await()
            .pollInSameThread()
            .pollDelay(duration)
            .forever()
            .until(() -> true
        );
    }
}