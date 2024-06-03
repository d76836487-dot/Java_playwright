package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;

@ScenarioComponent
public class exclusaoContaPage extends BasePage {
    public void clicar_no_meu_perfil_no_cabecalho() {
        page.getByText("Meu perfil").click();
    }
}
