package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class ForgotMyPasswordPage {

    @Autowired
    private Page page;

    public void fillInputAndClick(String user) {
        page.getByPlaceholder("CNPJ, CPF ou Usuário").pressSequentially(user);
        page.getByRole(AriaRole.BUTTON, new Page.GetByRoleOptions().setName("Continuar")).click();
    }

}
