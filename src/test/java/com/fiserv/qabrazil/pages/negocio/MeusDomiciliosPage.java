package com.fiserv.qabrazil.pages.negocio;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import jakarta.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
 
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class MeusDomiciliosPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
    private Locator txtBancoAgenciaConta;
    private Locator iconSearch;
    private Locator btnFiltros;
    private Locator filtroProdutos;
    private Locator filtroBandeiras;
    private Locator btnMostrarResultados;
    private Locator resultadoColunaBanco;
    private Locator resultadoColunaAgencia;
    private Locator resultadoColunaConta;
    private Locator resultadoColunaBandeira;
    private Locator resultadoColunaProduto;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[text()='Meus domicílios bancários']");
        this.txtBancoAgenciaConta = page.locator("//*[contains(@id, '-Input_Codigo')]");
        this.iconSearch = page.locator("//*[(contains(@class, 'fa-search'))]");
        this.btnFiltros = page.locator("//button/span[text()='Filtros']");
        this.filtroProdutos = page.locator("//*[@data-testid='generic-filter-accordion-title-produtos']");
        this.filtroBandeiras = page.locator("//*[@data-testid='generic-filter-accordion-title-bandeira']");
        this.btnMostrarResultados = page.locator("//*[@data-testid='generic-filter-btn-resultados']");
        this.resultadoColunaBanco = page.locator("//div[span[text()='Banco']]/following-sibling::div/span");
        this.resultadoColunaAgencia = page.locator("//div[span[text()='Agência']]/following-sibling::div/span");
        this.resultadoColunaConta = page.locator("//div[span[text()='Conta']]/following-sibling::div/span");
        this.resultadoColunaBandeira = page.locator("//div[span[text()='Bandeira']]/following-sibling::div/span");
        this.resultadoColunaProduto = page.locator("//div[span[text()='Produto']]/following-sibling::div/span");
    }

    private void verificarMeusDomicilios() { waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS); }

    private void preencherBancoAgencaConta(String bancoAgencaConta) {
        pressValue(this.txtBancoAgenciaConta, bancoAgencaConta);
        click(this.iconSearch);
    }

    private void clickFiltros() { click(this.btnFiltros); }

    public void validarFiltroMeusDomicilios(@NotNull String filtro, String valor) {
        this.verificarMeusDomicilios();

        boolean seBancoAgenciaConta = (
            filtro.equalsIgnoreCase("Banco")
            || filtro.equalsIgnoreCase("Agência")
            || filtro.equalsIgnoreCase("Conta")
        );

        Locator resultadoColuna = page.locator("");
        String primeiroRegistro = "";
        if (seBancoAgenciaConta) {
            if (filtro.equalsIgnoreCase("Banco")) {
                resultadoColuna = this.resultadoColunaBanco;
                primeiroRegistro = getStringLocator(this.resultadoColunaBanco.first());
            } else if (filtro.equalsIgnoreCase("Agência")) {
                resultadoColuna = this.resultadoColunaAgencia;
                primeiroRegistro = getStringLocator(this.resultadoColunaAgencia.first());
            }else if (filtro.equalsIgnoreCase("Conta")) {
                resultadoColuna = this.resultadoColunaConta;
                primeiroRegistro = getStringLocator(this.resultadoColunaConta.first());
            }

            this.preencherBancoAgencaConta(primeiroRegistro);
        } else {
            this.clickFiltros();

            Locator expandirFiltro = page.locator("");
            Locator selecaoValor = page.locator("");
            if (filtro.equalsIgnoreCase("Produtos")) {
                resultadoColuna = this.resultadoColunaProduto;
                expandirFiltro = this.filtroProdutos;
                if (valor.equalsIgnoreCase("todos"))
                    selecaoValor = page.locator("//*[@data-testid='generic-filter-check-all-produtos']");
                else
                    selecaoValor = page.locator("//*[@data-testid='generic-filter-check-produto-"+valor+"']");
            } else if (filtro.equalsIgnoreCase("Bandeiras")) {
                resultadoColuna = this.resultadoColunaBandeira;
                expandirFiltro = this.filtroBandeiras;
                if (valor.equalsIgnoreCase("todos"))
                    selecaoValor = page.locator("//*[@data-testid='generic-filter-check-all-bandeiras']");
                else
                    selecaoValor = page.locator("//*[@data-testid='generic-filter-div-bandeira-"+valor+"']");
            }

            click(expandirFiltro);
            click(selecaoValor);
            click(this.btnMostrarResultados);
        }

        switch (filtro) {
            case "Banco", "Agência", "Conta":
                for (int i = 0; i < resultadoColuna.count(); i++) {
                    resultadoColuna.nth(i).scrollIntoViewIfNeeded();
                    assertThat(resultadoColuna.nth(i)).containsText(primeiroRegistro);
                }
                break;

            case "Produtos", "Bandeiras":
                for (int i = 0; i < resultadoColuna.count(); i++) {
                    resultadoColuna.nth(i).scrollIntoViewIfNeeded();
                    if (valor.equalsIgnoreCase("todos"))
                        assertThat(resultadoColuna.nth(i)).isVisible();
                    else
                        assertThat(resultadoColuna.nth(i)).containsText(valor);
                }

                break;
        }
    }
}