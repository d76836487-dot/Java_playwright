package com.fiserv.qabrazil.pages.recebimentos.resumoRecebimentos;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class FuturosPage extends GeneralUtils {
    @Autowired
    private Page page;

    // Campos - Total/Valor
    private Locator totalVendas;
    private Locator totalLiquidoPrevisto;

    @PostConstruct
    private void loadLocators() {
        // Campos - Total/Valor
        this.totalVendas = page.locator("//*[@data-testid='recebimentos-futuros-total-vendas']");
        this.totalLiquidoPrevisto = page.locator("//*[@data-testid='recebimentos-futuros-total-liquido-previsto']");
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Total de vendas"))
                checkIfValueIsNotEmpty(this.totalVendas);
            else if (campo.equalsIgnoreCase("Total líquido previsto"))
                checkIfValueIsNotEmpty(this.totalLiquidoPrevisto);
        }
    }

    public int getTotalVendas() { return getIntLocator(this.totalVendas); }

    public double getTotalLiquidoPrevisto() { return getDoubleLocator(this.totalLiquidoPrevisto); }
}