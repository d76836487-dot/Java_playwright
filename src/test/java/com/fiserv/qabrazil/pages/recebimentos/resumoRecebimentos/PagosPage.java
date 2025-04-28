package com.fiserv.qabrazil.pages.recebimentos.resumoRecebimentos;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.*;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class PagosPage {
    @Autowired
    private Page page;

    // Campos - Total/Valor
    private Locator totalRecebido;
    private Locator totalAgendado;
    private Locator totalCedido;

    @PostConstruct
    private void loadLocators() {
        // Campos - Total/Valor
        this.totalRecebido = page.locator("//*[@data-testid='recebimentos-pagos-total-recebido']");
        this.totalAgendado = page.locator("//*[@data-testid='recebimentos-pagos-total-agendado']");
        this.totalCedido = page.locator("//*[@data-testid='recebimentos-pagos-total-cedido']");
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Total recebido")) {
                GeneralUtils.waitIsVisibleForSeconds(totalRecebido, Config.WAIT_LEVEL_1);
                assertThat(totalRecebido).not().isEmpty();
            } else if (campo.equalsIgnoreCase("Total agendado")) {
                GeneralUtils.waitIsVisibleForSeconds(totalAgendado, Config.WAIT_LEVEL_1);
                assertThat(totalAgendado).not().isEmpty();
            } else if (campo.equalsIgnoreCase("Total cedido")) {
                GeneralUtils.waitIsVisibleForSeconds(totalCedido, Config.WAIT_LEVEL_1);
                assertThat(totalCedido).not().isEmpty();
            }
        }
    }
}