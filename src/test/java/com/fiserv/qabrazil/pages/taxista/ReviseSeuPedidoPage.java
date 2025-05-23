package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class ReviseSeuPedidoPage extends GeneralUtils {
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

    private void clickAlterarSobreVoce(String alterarSobreVoce) {
        if (alterarSobreVoce.equals("S"))
           click( this.linkAlterarSobreVoce);
    }

    private void clickAlterarSobreSeuNegocio(String alterarSobreSeuNegocio) {
        if (alterarSobreSeuNegocio.equals("S"))
            click(this.linkAlterarSobreSeuNegocio);
    }

    private void clickAlterarEndereco(String alterarEndereco) {
        if (alterarEndereco.equals("S"))
            click(this.linkAlterarEndereco);
    }

    private void clickAlterarContaRecebimento(String alterarContaRecebimento) {
        if (alterarContaRecebimento.equals("S"))
           click(this.linkAlterarContaRecebimento);
    }

    public void conferirReviseSeuPedido(
     String alterarSobreVoce
    ,String alterarSobreSeuNegocio
    ,String alterarEndereco
    ,String alterarContaRecebimento) {
        waitIsVisibleForSeconds(this.title, Config.WAIT_LEVEL_1);
        this.clickAlterarSobreVoce(alterarSobreVoce);
        this.clickAlterarSobreSeuNegocio(alterarSobreSeuNegocio);
        this.clickAlterarEndereco(alterarEndereco);
        this.clickAlterarContaRecebimento(alterarContaRecebimento);
        click(this.btnConcluirPedido);
    }
}