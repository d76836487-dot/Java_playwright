package com.fiserv.qabrazil.pages.antecipacao;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class RelatorioAntecipacoesPage extends GeneralUtils {
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
                checkIfValueIsNotEmpty(this.valorBrutoVendas);
            else if (campo.equalsIgnoreCase("Valor líquido das vendas"))
                checkIfValueIsNotEmpty(this.valorLiquidoVendas);
            else if (campo.equalsIgnoreCase("Total de desconto valor líquido"))
                checkIfValueIsNotEmpty(this.totalDescontoValorLiquido);
            else if (campo.equalsIgnoreCase("Valor antecipado pago"))
                checkIfValueIsNotEmpty(this.valorAntecipadoPago);
            else if (campo.equalsIgnoreCase("Total de desconto valor antecipado pago"))
                checkIfValueIsNotEmpty(this.totalDescontoValorAntecipadoPago);
        }
    }

    public double getValorBrutoVendas() { return getDoubleLocator(this.valorBrutoVendas); }

    public double getValorLiquidoVendas() { return getDoubleLocator(this.valorLiquidoVendas); }

    public double getTotalDescontoValorLiquido() { return getDoubleLocator(this.totalDescontoValorLiquido); }

    public double getValorAntecipadoPago() { return getDoubleLocator(this.valorAntecipadoPago); }

    public double getTotalDescontoValorAntecipadoPago() { return getDoubleLocator(this.totalDescontoValorAntecipadoPago); }
}