package com.fiserv.qabrazil.steps.login;

import com.fiserv.qabrazil.pages.login.ForgotMyPasswordPage;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class ForgotMyPasswordSteps {

    @Autowired
    ForgotMyPasswordPage forgotMyPasswordPage;

    @When("Usuário tenta recuperar senha com {string}")
    public void userTriesToRecoverPasswordWith(String user) {
        forgotMyPasswordPage.fillInputAndClick(user);
    }
}
