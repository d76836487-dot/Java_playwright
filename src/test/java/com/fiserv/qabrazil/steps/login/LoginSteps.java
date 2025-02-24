package com.fiserv.qabrazil.steps.login;

import com.fiserv.qabrazil.pages.home.HomePage;
import com.fiserv.qabrazil.pages.login.LoginPage;
import io.cucumber.java.en.Given;
import org.springframework.beans.factory.annotation.Autowired;

public class LoginSteps {
    @Autowired
    LoginPage loginPage;

    @Autowired
    HomePage homePage;

    @Given("realizar login no portal {string}")
    public void realizar_login_no_portal(String alianca) {
        loginPage.acessarLoginPortal(alianca);
        homePage.verificarHome();
    }
}
