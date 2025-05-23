package com.fiserv.qabrazil.pages.vendas.relatorioVendas;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class VoucherPage extends GeneralUtils {
    @Autowired
    private Page page;

    // Campos - Total/Valor
    private Locator totalVendas;
    private Locator valorBruto;

    @PostConstruct
    private void loadLocators() {
        // Campos - Total/Valor
        this.totalVendas = page.locator("//*[@data-testid='total-de-vendas']");
        this.valorBruto = page.locator("//*[@data-testid='valor-bruto']");
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Total de vendas"))
                checkIfValueIsNotEmpty(this.totalVendas);
            else if (campo.equalsIgnoreCase("Valor bruto"))
                checkIfValueIsNotEmpty(this.valorBruto);
        }
    }
}