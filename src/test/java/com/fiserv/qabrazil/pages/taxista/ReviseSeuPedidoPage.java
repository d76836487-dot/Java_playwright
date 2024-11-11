package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertFalse;
import static org.testng.AssertJUnit.assertTrue;

@ScenarioComponent
public class ReviseSeuPedidoPage {
    @Autowired
    private Page page;

    private Locator title;
    private Locator linkAlterarSobreVoce;
    private Locator linkAlterarSobreSeuNegocio;
    private Locator linkAlterarEndereco;
    private Locator linkAlterarContaRecebimento;
    private Locator btnConcluirPedido;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[@id='b16-Titulo']");
        this.linkAlterarSobreVoce = page.locator("//*[@id='b16-b3-Content']/span[contains(text(), 'Alterar')]");
        this.linkAlterarSobreSeuNegocio = page.locator("//*[@id='b16-b7-Content']/span[contains(text(), 'Alterar')]");
        this.linkAlterarEndereco = page.locator("//*[@id='b16-b11-Content']/span[contains(text(), 'Alterar')]");
        this.linkAlterarContaRecebimento = page.locator("//*[@id='b16-b15-Content']/span[contains(text(), 'Alterar')]");
        this.btnConcluirPedido = page.locator("//*[contains(text(), 'Concluir pedido')]");
    }

    public void verificarReviseSeuPedido() {
        if (this.title.isVisible())
            assertTrue(true);
        else
            assertFalse(false);
    }

    public void clickAlterarSobreVoce(String alterarSobreVoce) {
        if (alterarSobreVoce.equals("S"))
            this.linkAlterarSobreVoce.click();
    }

    public void clickAlterarSobreSeuNegocio(String alterarSobreSeuNegocio) {
        if (alterarSobreSeuNegocio.equals("S"))
            this.linkAlterarSobreSeuNegocio.click();
    }

    public void clickAlterarEndereco(String alterarEndereco) {
        if (alterarEndereco.equals("S"))
            this.linkAlterarEndereco.click();
    }

    public void clickAlterarContaRecebimento(String alterarContaRecebimento) {
        if (alterarContaRecebimento.equals("S"))
            this.linkAlterarContaRecebimento.click();
    }

    public void clickConcluirPedido() { this.btnConcluirPedido.click(); }

    public void conferirReviseSeuPedido(
     String alterarSobreVoce
    ,String alterarSobreSeuNegocio
    ,String alterarEndereco
    ,String alterarContaRecebimento) {
        this.verificarReviseSeuPedido();
        this.clickAlterarSobreVoce(alterarSobreVoce);
        this.clickAlterarSobreSeuNegocio(alterarSobreSeuNegocio);
        this.clickAlterarEndereco(alterarEndereco);
        this.clickAlterarContaRecebimento(alterarContaRecebimento);
        this.clickConcluirPedido();
    }
}