package com.fiserv.qabrazil.pages.antecipacao;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class HistoricoPage extends GeneralUtils {
    @Autowired
    private Page page;
 
    // Campos - Total/Valor
    private Locator totalAntecipacoesPagas;
    private Locator valorLiquidoPago;

    @PostConstruct
    private void loadLocators() {
        // Campos - Total/Valor
        this.totalAntecipacoesPagas = page.locator("//*[@data-testid='historico-quantidade-paga']");
        this.valorLiquidoPago = page.locator("//div[h6[span[text()='Valor líquido pago']]]/following-sibling::div/span/span");
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Total de antecipações pagas"))
                checkIfValueIsNotEmpty(this.totalAntecipacoesPagas);
            else if (campo.equalsIgnoreCase("Valor líquido pago"))
                checkIfValueIsNotEmpty(this.valorLiquidoPago);
        }
    }

    public int getTotalAntecipacoesPagas() { return getIntLocator(this.totalAntecipacoesPagas); }

    public double getValorLiquidoPago() { return getDoubleLocator(this.valorLiquidoPago); }
}