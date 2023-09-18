package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.assertions.PlaywrightAssertions;
import com.microsoft.playwright.options.LoadState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

/*
public GitlabPage openGitlab() {
    page.navigate(gitlabUrl);
    page.waitForLoadState(LoadState.NETWORKIDLE);
    return this;
}

Retornamos a propria pagina para podermos usa-la de forma fluente, ou seja:

gitlabPage.openGitlab().thenIsLoginPageDisplayed();

O primeiro método retorna a instancia do object, diminuindo o código e o tornando mais legível.
 */

@ScenarioComponent
// Precismos usar essa anotação em todas as classes que nao sao steps,
// então usamos @Autowired em cima da declara para conseguirmos uma instância da classe.
public class GitlabPage {

    @Autowired
    Page page;

    @Value("${urls.gitlab}")
    String gitlabUrl;

    public GitlabPage openGitlab() {
        page.navigate(gitlabUrl);
        page.waitForLoadState(LoadState.NETWORKIDLE);
        return this;
    }

    public GitlabPage thenIsLoginPageDisplayed() {
        PlaywrightAssertions.assertThat(page).hasTitle("Sign in · GitLab");
        return this;
    }
}
