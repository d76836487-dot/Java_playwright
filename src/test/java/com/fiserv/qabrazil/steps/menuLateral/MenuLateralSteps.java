package com.fiserv.qabrazil.steps.menuLateral;

import com.fiserv.qabrazil.pages.menuLateral.*;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

public class MenuLateralSteps {
    @Autowired
    MenuLateralPage menuLateralPage;

    @When("acessar menu {string} e submenu {string}")
    public void acessar_menu_e_submenu(String menu, String submenu) {
        menuLateralPage.acessarMenuSubmenu(menu, submenu);
    }
} 