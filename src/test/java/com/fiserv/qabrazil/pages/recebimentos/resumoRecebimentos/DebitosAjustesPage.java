package com.fiserv.qabrazil.pages.recebimentos.resumoRecebimentos;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class DebitosAjustesPage extends GeneralUtils {
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
            if (campo.equalsIgnoreCase("Total de cobranças de aluguel"))
                checkIfValueIsNotEmpty(this.totalCobrancasAluguel);
            else if (campo.equalsIgnoreCase("Total de cobranças pendentes"))
                checkIfValueIsNotEmpty(this.totalCobrancasPendentes);
        }
    }

    public double getTotalCobrancasAluguel() { return getDoubleLocator(this.totalCobrancasAluguel); }

    public double getTotalCobrancasPendentes() { return getDoubleLocator(this.totalCobrancasPendentes); }
}