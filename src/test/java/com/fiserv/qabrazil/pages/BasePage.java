package com.fiserv.qabrazil.pages;

import com.microsoft.playwright.Page;
import org.awaitility.Awaitility;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.Duration;
import java.util.function.Supplier;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

public abstract class BasePage {

    @Autowired
    protected Page page;

    public void sleep(Duration duration) {
        Awaitility.await()
                .pollInSameThread()
                .pollDelay(duration)
                .forever()
                .until(() -> true);
    }

    protected void retryUntilTrue(Runnable runToTry, Supplier<Boolean> untilTrue)  {
        for(int numTries = 0; numTries < 3; numTries++) {
            System.out.printf("retry: %d%n\n", numTries);
            runToTry.run();
            if (untilTrue.get()) {
                return;
            }
            sleep(Duration.ofSeconds(5));
        }
        throw new RuntimeException("Nao atingiu condição de sucesso...");
    }

    public String getTextFromElement(String testId) {
        assertThat(page.getByTestId(testId)).hasCount(1);
        return page.getByTestId(testId).textContent();
    }

    public String getTitle() {
        return page.title();
    }
}

