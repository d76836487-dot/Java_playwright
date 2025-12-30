package com.fiserv.qabrazil.pages.vendas.relatorioVendas;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class NaoEfetivadasPage extends GeneralUtils {
    @Autowired
    private Page page;

    // Campos - Total/Valor
    private Locator totalRecusadas;
    private Locator totalEstornadas;
 
    @PostConstruct
    private void loadLocators() {
        // Campos - Total/Valor
        this.totalRecusadas = page.locator("//*[@data-testid='nao-efetivadas-total-de-recusadas']");
        this.totalEstornadas = page.locator("//*[@data-testid='nao-efetivadas-total-estornadas']");
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Total de recusadas"))
                checkIfValueIsNotEmpty(this.totalRecusadas);
            else if (campo.equalsIgnoreCase("Total de estornadas"))
                checkIfValueIsNotEmpty(this.totalEstornadas);
        }
    }

    public int getTotalRecusadas() { return getIntLocator(this.totalRecusadas); }

    public int getTotalEstornadas() { return getIntLocator(this.totalEstornadas); }
}