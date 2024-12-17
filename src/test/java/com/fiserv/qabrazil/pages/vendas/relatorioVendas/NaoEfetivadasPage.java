package com.fiserv.qabrazil.pages.vendas.relatorioVendas;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class NaoEfetivadasPage {
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
                assertThat(totalRecusadas).isVisible();
            else if (campo.equalsIgnoreCase("Total de estornadas"))
                assertThat(totalEstornadas).isVisible();
        }
    }
}