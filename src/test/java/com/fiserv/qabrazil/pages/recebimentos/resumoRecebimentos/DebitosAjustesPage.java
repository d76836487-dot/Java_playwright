package com.fiserv.qabrazil.pages.recebimentos.resumoRecebimentos;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.*;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class DebitosAjustesPage {
    @Autowired
    private Page page;

    // Campos - Total/Valor
    private Locator totalCobrancasAluguel;
    private Locator totalCobrancasPendentes;

    @PostConstruct
    private void loadLocators() {
        // Campos - Total/Valor
        this.totalCobrancasAluguel = page.locator("(//*[contains(@id, '-TotalRecebido')]/div/span)[2]");
        this.totalCobrancasPendentes = page.locator("(//*[contains(@id, '-TotalAgendado')]/div/span)[2]");
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Total de cobranças de aluguel")) {
                GeneralUtils.waitIsVisibleForSeconds(totalCobrancasAluguel, Config.WAIT_LEVEL_1);
                assertThat(totalCobrancasAluguel).not().isEmpty();
            } else if (campo.equalsIgnoreCase("Total de cobranças pendentes")) {
                GeneralUtils.waitIsVisibleForSeconds(totalCobrancasPendentes, Config.WAIT_LEVEL_1);
                assertThat(totalCobrancasPendentes).not().isEmpty();
            }
        }
    }
}