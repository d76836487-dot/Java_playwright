package com.fiserv.qabrazil.pages.antecipacao;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class RelatorioAntecipacoesPage {
    @Autowired
    private Page page;

    // Campos - Total/Valor
    private Locator valorBrutoVendas;
    private Locator valorLiquidoVendas;
    private Locator totalDescontoValorLiquido;
    private Locator valorAntecipadoPago;
    private Locator totalDescontoValorAntecipadoPago;

    @PostConstruct
    private void loadLocators() {
        // Campos - Total/Valor
        this.valorBrutoVendas = page.locator("//*[@data-testid='relatorio-de-antecipacao-valor-bruto-venda']");
        this.valorLiquidoVendas = page.locator("//*[@data-testid='relatorio-de-antecipacao-valor-liquido-vendas']");
        this.totalDescontoValorLiquido = page.locator("//*[@data-testid='relatorio-de-antecipacao-total-de-desconto-valor-liquido']");
        this.valorAntecipadoPago = page.locator("//*[@data-testid='relatorio-de-antecipacao-valor-antecipado-pago']");
        this.totalDescontoValorAntecipadoPago = page.locator("//*[@data-testid='relatorio-de-antecipacao-total-de-desconto-valor-antecipado-pago']");
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Valor bruto das vendas"))
                assertThat(valorBrutoVendas).isVisible();
            if (campo.equalsIgnoreCase("Valor líquido das vendas"))
                assertThat(valorLiquidoVendas).isVisible();
            if (campo.equalsIgnoreCase("Total de desconto valor líquido"))
                assertThat(totalDescontoValorLiquido).isVisible();
            if (campo.equalsIgnoreCase("Valor antecipado pago"))
                assertThat(valorAntecipadoPago).isVisible();
            if (campo.equalsIgnoreCase("Total de desconto valor antecipado pago"))
                assertThat(totalDescontoValorAntecipadoPago).isVisible();
        }
    }
}