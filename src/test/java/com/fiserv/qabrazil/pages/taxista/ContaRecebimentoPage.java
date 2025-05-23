package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class ContaRecebimentoPage extends GeneralUtils {
    @Autowired
    private Page page;

    private Locator title;
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

    private void verificarContaRecebimento() {
        waitIsVisibleForSeconds(this.title, Config.WAIT_LEVEL_1);
    }

    private void selecionarTipoConta(String tipoConta) {
            String textoConta = "";
        if (tipoConta.equals("C"))
            textoConta = "Conta Corrente";
        else if (tipoConta.equals("P"))
            textoConta = "Conta Poupança";

        click(this.slcTipoConta);
        click(page.locator("//*[@id='b13-b6-dropdownContent']/*/span[contains(text(), '"+ textoConta +"')]"));
        click(this.title);
    }

    private void selecionarOperacao(String operacao) {
        click(this.slcOperacao);
        click(page.locator("//*[@id='b13-b9-dropdownContent']/*/span[text() = '"+ operacao +"']"));
        click(this.title);
    }

    private void alterarNegocio(String alterarNegocio) {
        if (alterarNegocio.equals("S")){
            click(this.drillDownNegocio);
            click(this.btnAlterarNegocio);
        }
    }

    private void alterarDadosPessoais(String alterarDadosPessoais) {
        if (alterarDadosPessoais.equals("S")) {
            click(this.drillDownDadosPessoais);
            click(this.btnAlterarDadosPessoais);
        }
    }

    private void expandirEndereco(String expandirEndereco) {
        if (expandirEndereco.equals("S"))
            click(this.drillDownEndereco);
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
        fillValue(this.txtAgencia, agencia);
        this.selecionarOperacao(operacao);
        fillValue(this.txtConta, conta);
        click(this.cbConcordo);
        click(this.cbDeclaro);
        this.alterarNegocio(alterarNegocio);
        this.alterarDadosPessoais(alterarDadosPessoais);
        this.expandirEndereco(expandirEndereco);
        click(this.btnProximo);
    }
}