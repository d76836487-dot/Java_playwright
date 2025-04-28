package com.fiserv.qabrazil.pages.vendas.relatorioVendas;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.*;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.testng.Assert;

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

    // Mais detalhes
    private Locator linkMaisDetalhes;
    private Locator detalhesVendaTotalVendas;
    private Locator detalhesVendaValorBruto;
    private Locator detalhesVendaValorLiquido;
    private Locator btnFecharDetalhesVenda;

    @PostConstruct
    private void loadLocators() {
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
    }

    // Campos - Total/Valor
    public void verificarCampos(String campos) {
        String[] listaCampos = campos.split(";");

        for (String campo : listaCampos) {
            if (campo.equalsIgnoreCase("Total de vendas")) {
                GeneralUtils.waitIsVisibleForSeconds(totalVendas, Config.WAIT_LEVEL_1);
                assertThat(totalVendas).not().isEmpty();
            } else if (campo.equalsIgnoreCase("Valor bruto")) {
                GeneralUtils.waitIsVisibleForSeconds(valorBruto, Config.WAIT_LEVEL_1);
                assertThat(valorBruto).not().isEmpty();
            } else if (campo.equalsIgnoreCase("Valor líquido")) {
                GeneralUtils.waitIsVisibleForSeconds(valorLiquido, Config.WAIT_LEVEL_1);
                assertThat(valorLiquido).not().isEmpty();
            } else if (campo.equalsIgnoreCase("Valor cancelado")) {
                GeneralUtils.waitIsVisibleForSeconds(valorCancelado, Config.WAIT_LEVEL_1);
                assertThat(valorCancelado).not().isEmpty();
            }
        }
    }

    // Mais detalhes
    public void verificarDadosMaisDetalhes() {
        this.linkMaisDetalhes.scrollIntoViewIfNeeded();
        this.linkMaisDetalhes.click();
        GeneralUtils.waitForSeconds(Config.WAIT_LEVEL_2);

        // atribuicao Total de vendas
        int totalVendas = Integer.parseInt(this.detalhesVendaTotalVendas.textContent().trim());
        int valorSomaItemVendas = 0;
        Locator detalhesItemVendas = page.locator("//*[@data-testid='historico-detalhes-item-vendas']");
        for (int i = 0; i < detalhesItemVendas.count(); i++)
            valorSomaItemVendas += Integer.parseInt(detalhesItemVendas.nth(i).textContent().trim());

        // atribuicao Valor bruto
        double valorBruto = Double.parseDouble(this.detalhesVendaValorBruto.textContent()
                .trim()
                .replace(".", "")
                .replace(",", ".")
                .replace("R$ ", "")
        );
        double valorSomaItemValorBruto = 0;
        Locator detalhesItemValorBruto = page.locator("//*[@data-testid='historico-detalhes-item-bruto']");
        for (int i = 0; i < detalhesItemValorBruto.count(); i++)
            valorSomaItemValorBruto += Double.parseDouble(detalhesItemValorBruto.nth(i).textContent()
                    .trim()
                    .replace(".", "")
                    .replace(",", ".")
                    .replace("R$ ", "")
            );

        // atribuicao Valor liquido
        double valorLiquido = Double.parseDouble(this.detalhesVendaValorLiquido.textContent()
                .trim()
                .replace(".", "")
                .replace(",", ".")
                .replace("R$ ", "")
        );
        double valorSomaItemValorLiquido = 0;
        Locator detalhesItemValorLiquido = page.locator("//*[@data-testid='historico-detalhes-item-liquido']");
        for(int i = 0; i < detalhesItemValorLiquido.count(); i++)
            valorSomaItemValorLiquido += Double.parseDouble(detalhesItemValorLiquido.nth(i).textContent()
                    .trim()
                    .replace(".", "")
                    .replace(",", ".")
                    .replace("R$ ", "")
            );

        // verificacao Total de vendas, Valor bruto e Valor liquido
        boolean validacao = (
            (totalVendas == valorSomaItemVendas)
            && (valorBruto == valorSomaItemValorBruto)
            && (valorLiquido == valorSomaItemValorLiquido)
        );
        Assert.assertTrue(validacao);

        this.btnFecharDetalhesVenda.scrollIntoViewIfNeeded();
        GeneralUtils.waitForSeconds(Config.WAIT_LEVEL_2);
        this.btnFecharDetalhesVenda.click();
    }
}