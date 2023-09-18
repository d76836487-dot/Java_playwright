package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.GitlabPage;
import io.cucumber.java.an.E;
import org.springframework.beans.factory.annotation.Autowired;

public class GitlabSteps {

    @Autowired
    GitlabPage gitlabPage;

    @E("quando acesso o gitlab")
    public void acessarGitLab() {
        gitlabPage.openGitlab();
    }

    @E("entao estou na tela de login")
    public void estouNaTelaDeLogin() {
        gitlabPage.thenIsLoginPageDisplayed();
    }
}
