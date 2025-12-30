package com.fiserv.qabrazil.pages.vendas.relatorioVendas;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.testng.Assert;

@ScenarioComponent
public class HistoricoVendasPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator primeiroRegistro;

    // Campos - Total/Valor 
    private Locator totalVendas;
    private Locator valorBruto;
    private Locator valorLiquido;
    private Locator valorCancelado;

    // Mais detalhes
    private Locator linkMaisDetalhes;
    private Locator detalhesVendaTotalVendas;
    private Locator detalhesVendaValorBruto;
    private Locator detalhesVendaValorLiquido;
    private Locator btnFecharDetalhesVenda;

    // Detalhes da venda
    private Locator valorOriginalVenda;

    @PostConstruct
    private void loadLocators() {
        this.primeiroRegistro = page.locator("(//*[@data-testid='historico-vendas-detalhes'])[1]");

        // Campos - Total/Valor
        this.totalVendas = page.locator("//*[@data-testid='historico-vendas-total']");
        this.valorBruto = page.locator("(//*[@data-testid='historico-vendas-valor-bruto'])[1]");
        this.valorLiquido = page.locator("(//*[@data-testid='historico-vendas-valor-liquido'])[1]");
        this.valorCancelado = page.locator("//*[@data-testid='historico-vendas-valor-cancelado']");

        // Mais detalhes
        this.linkMaisDetalhes = page.locator("//*[contains(text(), 'Mais detalhes')]");
        this.detalhesVendaTotalVendas = page.locator("//*[@data-testid='historico-mais-detalhes-total']");
        this.detalhesVendaValorBruto = page.locator("//*[@data-testid='historico-mais-detalhes-bruto']");
        this.detalhesVendaValorLiquido = page.locator("//*[@data-testid='historico-mais-detalhes-liquido']");
        this.btnFecharDetalhesVenda = page.locator("//*[@data-testid='historico-detalhes-item-fechar']");

        // Detalhes da venda
        this.valorOriginalVenda = page.locator("//*[@data-testid='detalhes-venda-valor-original']");
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Total de vendas"))
                checkIfValueIsNotEmpty(this.totalVendas);
            else if (campo.equalsIgnoreCase("Valor bruto"))
                checkIfValueIsNotEmpty(this.valorBruto);
            else if (campo.equalsIgnoreCase("Valor líquido"))
                checkIfValueIsNotEmpty(this.valorLiquido);
            else if (campo.equalsIgnoreCase("Valor cancelado"))
                checkIfValueIsNotEmpty(this.valorCancelado);
        }
    }

    public void verificarValorOriginalVenda(String visivel) {
        waitForSeconds(Config.WAIT_5_SECONDS);
        click(this.primeiroRegistro);

        if (visivel.equalsIgnoreCase("está visível"))
            waitIsVisibleForSeconds(this.valorOriginalVenda, Config.WAIT_5_SECONDS);
        else if (visivel.equalsIgnoreCase("não está visível"))
            waitIsNotVisibleForSeconds(this.valorOriginalVenda, Config.WAIT_5_SECONDS);
    }

    public int getTotalVendas() { return getIntLocator(this.totalVendas); }

    public double getValorBruto() { return getDoubleLocator(this.valorBruto); }

    public double getValorLiquido() { return getDoubleLocator(this.valorLiquido); }

    public double getValorCancelado() { return getDoubleLocator(this.valorCancelado); }

    // Mais detalhes
    public void verificarDadosMaisDetalhes() {
        click(this.linkMaisDetalhes);
        waitForSeconds(Config.WAIT_10_SECONDS);

        // atribuicao Total de vendas
        int totalVendas = Integer.parseInt(this.detalhesVendaTotalVendas.textContent().trim());
        int valorSomaItemVendas = 0;
        Locator detalhesItemVendas = page.locator("//*[@data-testid='historico-detalhes-item-vendas']");
        for (int i = 0; i < detalhesItemVendas.count(); i++)
            valorSomaItemVendas += Integer.parseInt(detalhesItemVendas.nth(i).textContent().trim());

        // atribuicao Valor bruto
        double valorBruto = replaceMonetaryValue(this.detalhesVendaValorBruto.textContent());
        double valorSomaItemValorBruto = 0;
        Locator detalhesItemValorBruto = page.locator("//*[@data-testid='historico-detalhes-item-bruto']");
        for (int i = 0; i < detalhesItemValorBruto.count(); i++)
            valorSomaItemValorBruto += replaceMonetaryValue(detalhesItemValorBruto.nth(i).textContent());

        // atribuicao Valor liquido
        double valorLiquido = replaceMonetaryValue(this.detalhesVendaValorLiquido.textContent());
        double valorSomaItemValorLiquido = 0;
        Locator detalhesItemValorLiquido = page.locator("//*[@data-testid='historico-detalhes-item-liquido']");
        for(int i = 0; i < detalhesItemValorLiquido.count(); i++)
            valorSomaItemValorLiquido += replaceMonetaryValue(detalhesItemValorLiquido.nth(i).textContent());

        // verificacao Total de vendas, Valor bruto e Valor liquido
        boolean validacao = (
            (totalVendas == valorSomaItemVendas)
            && (valorBruto == valorSomaItemValorBruto)
            && (valorLiquido == valorSomaItemValorLiquido)
        );
        Assert.assertTrue(validacao);

        waitForSeconds(Config.WAIT_10_SECONDS);
        click(this.btnFecharDetalhesVenda);
    }
}