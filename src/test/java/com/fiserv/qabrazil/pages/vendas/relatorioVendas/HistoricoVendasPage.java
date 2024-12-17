package com.fiserv.qabrazil.pages.vendas.relatorioVendas;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class HistoricoVendasPage {
    @Autowired
    private Page page;

    // Campos - Total/Valor
    private Locator totalVendas;
    private Locator valorBruto;
    private Locator valorLiquido;
    private Locator valorCancelado;

    @PostConstruct
    private void loadLocators() {
        // Campos - Total/Valor
        this.totalVendas = page.locator("//*[@data-testid='historico-vendas-v2-total']");
        this.valorBruto = page.locator("(//*[@data-testid='historico-vendas-valor-bruto'])[1]");
        this.valorLiquido = page.locator("(//*[@data-testid='historico-vendas-valor-liquido'])[1]");
        this.valorCancelado = page.locator("//*[@data-testid='historico-vendas-valor-cancelado']");
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Total de vendas"))
                assertThat(totalVendas).isVisible();
            else if (campo.equalsIgnoreCase("Valor bruto"))
                assertThat(valorBruto).isVisible();
            else if (campo.equalsIgnoreCase("Valor líquido"))
                assertThat(valorLiquido).isVisible();
            else if (campo.equalsIgnoreCase("Valor cancelado"))
                assertThat(valorCancelado).isVisible();
        }
    }
}