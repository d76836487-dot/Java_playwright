package com.fiserv.qabrazil.pages.vendas.relatorioVendas;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;
import static org.testng.AssertJUnit.assertFalse;
import static org.testng.AssertJUnit.assertTrue;

@ScenarioComponent
public class HistoricoVendasPage {
    @Autowired
    private Page page;

    // Campos - Total/Valor
    private Locator totalVendas;
    private Locator valorBruto;
    private Locator valorLiquido;
    private Locator valorCancelado;

    // Tipo de relatorio
    private Locator relatorioSimplificado;
    private Locator relatorioDetalhado;

    // Mais detalhes
    private Locator linkMaisDetalhes;
    private Locator titleMaisDetalhes;
    private Locator iconeSairMaisDetalhes;
    private Locator detalhesVendaTotalVendas;
    private Locator detalhesVendaValorBruto;
    private Locator detalhesVendaValorLiquido;
    private Locator detalhesItemVendas;
    private Locator detalhesItemValorBruto;
    private Locator detalhesItemValorLiquido;
    private Locator btnFecharDetalhesVenda;

    @PostConstruct
    private void loadLocators() {
        // Campos - Total/Valor
        this.totalVendas = page.locator("//*[@data-testid='historico-vendas-v2-total']");
        this.valorBruto = page.locator("(//*[@data-testid='historico-vendas-valor-bruto'])[1]");
        this.valorLiquido = page.locator("(//*[@data-testid='historico-vendas-valor-liquido'])[1]");
        this.valorCancelado = page.locator("//*[@data-testid='historico-vendas-valor-cancelado']");

        // Tipo de relatorio
        this.relatorioSimplificado = page.locator("//*[contains(@id, '-RadioButton_Simplificado-input')]");
        this.relatorioDetalhado = page.locator("//*[contains(@id, '-RadioButton_Detalhado-input')]");

        // Mais detalhes
        this.linkMaisDetalhes = page.locator("//*[contains(text(), 'Mais detalhes')]");
        this.titleMaisDetalhes = page.locator("//*[text()='Detalhes de vendas']");
        this.iconeSairMaisDetalhes = page.locator("//*[contains(@id, '-b14-Sair')]");
        this.detalhesVendaTotalVendas = page.locator("//*[@data-testid='historico-mais-detalhes-total']");
        this.detalhesVendaValorBruto = page.locator("//*[@data-testid='historico-mais-detalhes-bruto']");
        this.detalhesVendaValorLiquido = page.locator("//*[@data-testid='historico-mais-detalhes-liquido']");
        this.detalhesItemVendas = page.locator("//*[@data-testid='historico-detalhes-item-vendas']");
        this.detalhesItemValorBruto = page.locator("//*[@data-testid='historico-detalhes-item-bruto']");
        this.detalhesItemValorLiquido = page.locator("//*[@data-testid='historico-detalhes-item-liquido']");
        this.btnFecharDetalhesVenda = page.locator("//*[@data-testid='historico-detalhes-item-fechar']");
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

    // Tipo de relatorio
    public void selecionarTipoRelatorio(String tipoRelatorio) {
        if (tipoRelatorio.equalsIgnoreCase("simplificado"))
            this.relatorioSimplificado.check();
        else if (tipoRelatorio.equalsIgnoreCase("detalhado"))
            this.relatorioDetalhado.check();
    }

    // Mais detalhes
    public void verificarDadosMaisDetalhes() {
        this.linkMaisDetalhes.scrollIntoViewIfNeeded();
        this.linkMaisDetalhes.click();

        GeneralUtils.waitForMillis(Config.TIME_TO_WAIT_PAGE);
        GeneralUtils.waitForMillis(Config.WAIT_FOR_PAGE_UPDATE);
        assertThat(titleMaisDetalhes).isVisible();

        // atribuicao Total de vendas
        int totalVendas = Integer.parseInt(this.detalhesVendaTotalVendas.textContent().trim());
        int valorSomaItemVendas = 0;
        for (Locator row : this.detalhesItemVendas.getByRole(AriaRole.LISTITEM).all())
            valorSomaItemVendas += Integer.parseInt(row.textContent().trim());

        // atribuicao Valor bruto
        double valorBruto = Double.parseDouble(this.detalhesVendaValorBruto.textContent()
                .trim()
                .replace(".", "")
                .replace(",", ".")
                .replace("R$ ", "")
        );
        double valorSomaItemValorBruto = 0;
        for (Locator row : this.detalhesItemValorBruto.getByRole(AriaRole.LISTITEM).all())
            valorSomaItemValorBruto += Double.parseDouble(row.textContent()
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
        for (Locator row : this.detalhesItemValorLiquido.getByRole(AriaRole.LISTITEM).all())
            valorSomaItemValorLiquido += Double.parseDouble(row.textContent()
                    .trim()
                    .replace(".", "")
                    .replace(",", ".")
                    .replace("R$ ", "")
            );

        // verificacao Total de vendas, Valor bruto e Valor liquido
        if (
            (totalVendas == valorSomaItemVendas)
            && (valorBruto == valorSomaItemValorBruto)
            && (valorLiquido == valorSomaItemValorLiquido)
        )
            assertTrue(true);
        else
            assertFalse(false);

        this.btnFecharDetalhesVenda.scrollIntoViewIfNeeded();
        GeneralUtils.waitForMillis(Config.DELAY_IN_ACTION);
        this.btnFecharDetalhesVenda.click();
    }
}