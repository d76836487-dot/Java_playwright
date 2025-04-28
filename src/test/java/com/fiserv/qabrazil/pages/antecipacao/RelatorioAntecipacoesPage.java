package com.fiserv.qabrazil.pages.antecipacao;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.*;
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
            if (campo.equalsIgnoreCase("Valor bruto das vendas")) {
                GeneralUtils.waitIsVisibleForSeconds(valorBrutoVendas, Config.WAIT_LEVEL_1);
                assertThat(valorBrutoVendas).not().isEmpty();
            } else if (campo.equalsIgnoreCase("Valor líquido das vendas")) {
                GeneralUtils.waitIsVisibleForSeconds(valorLiquidoVendas, Config.WAIT_LEVEL_1);
                assertThat(valorLiquidoVendas).not().isEmpty();
            } else if (campo.equalsIgnoreCase("Total de desconto valor líquido")) {
                GeneralUtils.waitIsVisibleForSeconds(totalDescontoValorLiquido, Config.WAIT_LEVEL_1);
                assertThat(totalDescontoValorLiquido).not().isEmpty();
            } else if (campo.equalsIgnoreCase("Valor antecipado pago")) {
                GeneralUtils.waitIsVisibleForSeconds(valorAntecipadoPago, Config.WAIT_LEVEL_1);
                assertThat(valorAntecipadoPago).not().isEmpty();
            } else if (campo.equalsIgnoreCase("Total de desconto valor antecipado pago")) {
                GeneralUtils.waitIsVisibleForSeconds(totalDescontoValorAntecipadoPago, Config.WAIT_LEVEL_1);
                assertThat(totalDescontoValorAntecipadoPago).not().isEmpty();
            }
        }
    }
}