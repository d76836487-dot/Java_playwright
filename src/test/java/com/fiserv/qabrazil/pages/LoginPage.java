package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.config.ContractConfig;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.Duration;
import java.util.regex.Pattern;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class LoginPage extends BasePage {
    @Autowired
    ContractConfig contractConfig;

    public boolean pageHasImageWith(String contract) {
        Pattern pattern = Pattern.compile(String.format(".*%s", contract));
        System.out.println(page.getByTestId("header-brand-img"));
        page.getByTestId("header-brand-img").evaluate("elm => elm.parentNode.innerHTML");
        assertThat(page.getByTestId("header-brand-img"))
                .hasAttribute("src", pattern);

        return page.getByTestId("header-brand-img").isVisible();
    }

    public void login() {
        retryUntilTrue(() -> login(contractConfig.site, contractConfig.user, contractConfig.password),
                this::userIsLogged);
    }

    public void login(String url, String user, String pwd) {
        navigateTo(url);
        page.getByTestId("login").pressSequentially(user);
        page.getByTestId("password").fill(pwd);
        page.getByTestId("entrar").click();
    }

    public void navigateTo() {
        navigateTo(contractConfig.site);
    }

    public void navigateTo(String url) {
        page.navigate("https://" + url);
        assertThat(page).hasTitle(Pattern.compile(".+"));
    }

    public boolean userIsLogged() {
        sleep(Duration.ofSeconds(3));
        return page.locator("//span[contains(text(),'Sair')]").first().isVisible();
    }
}
