package com.fiserv.qabrazil.pages.vendas.relatorioVendas;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class PreAutorizacoesPage extends GeneralUtils {
    @Autowired
    private Page page;

    // Campos - Total/Valor
    private Locator totalVendas;
    private Locator valorBrutoAutorizado;
    private Locator valorBrutoConfirmar;

    @PostConstruct
    private void loadLocators() {
        // Campos - Total/Valor
        this.totalVendas = page.locator("//*[@data-testid='total-vendas-card-pre-autorizacao']");
        this.valorBrutoAutorizado = page.locator("//*[@data-testid='vendas-preautorizacao-valorbruto']");
        this.valorBrutoConfirmar = page.locator("//*[@data-testid='vendas-preautorizacao-brutoconfirmar']");
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Total de vendas"))
                checkIfValueIsNotEmpty(this.totalVendas);
            else if (campo.equalsIgnoreCase("Valor bruto autorizado"))
                checkIfValueIsNotEmpty(this.valorBrutoAutorizado);
            else if (campo.equalsIgnoreCase("Valor bruto a confirmar"))
                checkIfValueIsNotEmpty(this.valorBrutoConfirmar);
        }
    }
}