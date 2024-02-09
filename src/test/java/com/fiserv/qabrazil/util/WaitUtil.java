package com.fiserv.qabrazil.util;

import org.awaitility.Awaitility;

import java.time.Duration;
import java.util.function.Supplier;

public class WaitUtil {
    public static void sleep(Duration duration) {
        Awaitility.await()
                .pollInSameThread()
                .pollDelay(duration)
                .forever()
                .until(() -> true);
    }

    public static void retryUntilTrue(Runnable runToTry, Supplier<Boolean> untilTrue)  {
        for(int numTries = 0; numTries < 3; numTries++) {
            runToTry.run();
            if (untilTrue.get()) {
                return;
            }
            sleep(Duration.ofSeconds(5));
        }
        throw new RuntimeException("Nao atingiu condição de sucesso...");
    }

    public static boolean waitUntilTrue(Supplier<Boolean> untilTrue) {
        return waitUntilTrue(30, untilTrue);
    }

    public static boolean waitUntilTrue(int totalRetries, Supplier<Boolean> untilTrue)  {
        for(int numTries = 0; numTries < totalRetries; numTries++) {
            try {
                if (untilTrue.get()) {
                    return true;
                }
            } catch (RuntimeException ignored) {}
            sleep(Duration.ofMillis(500));
        }
        return false;
    }

}
