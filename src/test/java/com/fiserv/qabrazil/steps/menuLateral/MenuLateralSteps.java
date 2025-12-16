package com.fiserv.qabrazil.steps.menuLateral;

import com.fiserv.qabrazil.pages.menuLateral.*;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import org.springframework.beans.factory.annotation.Autowired;

public class MenuLateralSteps {
    @Autowired
    MenuLateralPage menuLateralPage;

    @When("realizo o acesso via menu {string} > submenu {string}")
    @When("acessar menu {string} e submenu {string}")
    public void acessar_menu_e_submenu(String menu, String submenu) {
        menuLateralPage.acessarMenuSubmenu(menu, submenu);
    }

    @When("realizo o acesso ao menu {string}")
    public void acesso_o_menu(String menu) {
        menuLateralPage.acessarMenu(menu);
    }

    @Then("o submenu {string} estará ocultado")
    public void o_submenu_estara_ocultado(String submenu) {
        menuLateralPage.validarOcultacaoSubmenu(submenu);
    }
}