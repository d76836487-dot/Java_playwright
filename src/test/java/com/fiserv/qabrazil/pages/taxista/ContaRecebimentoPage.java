package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class ContaRecebimentoPage {
    @Autowired
    private Page page;

    private Locator title;
    private Locator txtBanco;
    private Locator slcTipoConta;
    private Locator txtAgencia;
    private Locator slcOperacao;
    private Locator txtConta;
    private Locator drillDownNegocio;
    private Locator btnAlterarNegocio;
    private Locator drillDownDadosPessoais;
    private Locator btnAlterarDadosPessoais;
    private Locator drillDownEndereco;
    private Locator cbConcordo;
    private Locator cbDeclaro;
    private Locator btnProximo;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[@id='b13-Titulo']");
        this.txtBanco = page.locator("//*[@id='b13-Input_Banco']");
        this.slcTipoConta = page.locator("//*[@id='b13-$b6']/*/*/*/i");
        this.txtAgencia = page.locator("//*[@id='b13-Input_Agencia']");
        this.slcOperacao = page.locator("//*[@id='b13-$b9']/*/*/*/i");
        this.txtConta = page.locator("//*[@id='b13-Input_Conta']");
        this.drillDownNegocio = page.locator("//*[@id='b14-b7-TitleWrapper']");
        this.btnAlterarNegocio = page.locator("//*[@id='b14-b8-Content']/span[contains(text(), 'Alterar')]");
        this.drillDownDadosPessoais = page.locator("//*[@id='b14-b9-TitleWrapper']");
        this.btnAlterarDadosPessoais = page.locator("//*[@id='b14-b10-Content']/span[contains(text(), 'Alterar')]");
        this.drillDownEndereco = page.locator("//*[@id='b14-b11-TitleWrapper']");
        this.cbConcordo = page.locator("//*[@id='b13-Checkbox']");
        this.cbDeclaro = page.locator("//*[@id='b13-Checkbox2']");
        this.btnProximo = page.locator("//*[contains(text(), 'Próximo')]");
    }

    public void verificarContaRecebimento() {
        assertThat(title).isVisible();
    }

    public void preencherBanco(String banco) { this.txtBanco.fill(banco); }

    public void selecionarTipoConta(String tipoConta) {
            String textoConta = "";
        if (tipoConta.equals("C"))
            textoConta = "Conta Corrente";
        else if (tipoConta.equals("P"))
            textoConta = "Conta Poupança";

        this.slcTipoConta.click();
        Locator optTipoConta = page.locator("//*[@id='b13-b6-dropdownContent']/*/span[contains(text(), '"+ textoConta +"')]");
        optTipoConta.click();
        this.title.click();
    }

    public void preencherAgencia(String agencia) { this.txtAgencia.fill(agencia); }

    public void selecionarOperacao(String operacao) {
        this.slcOperacao.click();
        Locator optOperacao = page.locator("//*[@id='b13-b9-dropdownContent']/*/span[text() = '"+ operacao +"']");
        optOperacao.click();
        this.title.click();
    }

    public void preencherConta(String conta) { this.txtConta.fill(conta); }

    public void alterarNegocio(String alterarNegocio) {
        if (alterarNegocio.equals("S")){
            this.drillDownNegocio.click();
            this.btnAlterarNegocio.click();
        }
    }

    public void alterarDadosPessoais(String alterarDadosPessoais) {
        if (alterarDadosPessoais.equals("S")) {
            this.drillDownDadosPessoais.click();
            this.btnAlterarDadosPessoais.click();
        }
    }

    public void expandirEndereco(String expandirEndereco) {
        if (expandirEndereco.equals("S"))
            this.drillDownEndereco.click();
    }

    public void clickConcordo() {
        this.cbConcordo.click();
    }

    public void clickDeclaro() {
        this.cbDeclaro.click();
    }

    public void clickProximo() {
        this.btnProximo.click();
    }

    public void preencherCamposContaRecebimento(
     String tipoConta
    ,String agencia
    ,String operacao
    ,String conta
    ,String alterarNegocio
    ,String alterarDadosPessoais
    ,String expandirEndereco) {
        this.verificarContaRecebimento();
        this.selecionarTipoConta(tipoConta);
        this.preencherAgencia(agencia);
        this.selecionarOperacao(operacao);
        this.preencherConta(conta);
        this.clickConcordo();
        this.clickDeclaro();
        this.alterarNegocio(alterarNegocio);
        this.alterarDadosPessoais(alterarDadosPessoais);
        this.expandirEndereco(expandirEndereco);
        this.clickProximo();
    }
}