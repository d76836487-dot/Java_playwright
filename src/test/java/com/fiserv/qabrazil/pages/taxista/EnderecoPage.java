package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.Config;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

@ScenarioComponent
public class EnderecoPage extends GeneralUtils {
    @Autowired
    private Page page;
 
    private Locator title;
    private Locator txtCep;
    private Locator txtLogradouro;
    private Locator cbSemNumero;
    private Locator txtNumero;
    private Locator txtComplemento;
    private Locator txtBairro;
    private Locator txtCidade;
    private Locator slcEstado;
    private Locator txtPontoReferencia;
    private Locator drillDownNegocio;
    private Locator btnAlterarNegocio;
    private Locator drillDownDadosPessoais;
    private Locator btnAlterarDadosPessoais;
    private Locator btnProximo;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[@id='b10-Titulo']");
        this.txtCep = page.locator("//*[@id='b10-Input_Cep']");
        this.txtLogradouro = page.locator("//*[@id='b10-Input_Logradouro']");
        this.cbSemNumero = page.locator("//*[@id='b10-Checkbox']");
        this.txtNumero = page.locator("//*[@id='b10-Input_Numero']");
        this.txtComplemento = page.locator("//*[@id='b10-Input_Complemento']");
        this.txtBairro = page.locator("//*[@id='b10-Input_Bairro']");
        this.txtCidade = page.locator("//*[@id='b10-Input_Cidade']");
        this.slcEstado = page.locator("//*[@id='b10-$b16']/*/*/*/i");
        this.txtPontoReferencia = page.locator("//*[@id='b10-Input_PontoReferencia']");
        this.drillDownNegocio = page.locator("//*[@id='b11-b7-TitleWrapper']");
        this.btnAlterarNegocio = page.locator("//*[@id='b11-b8-Content']/span[contains(text(), 'Alterar')]");
        this.drillDownDadosPessoais = page.locator("//*[@id='b11-b9-TitleWrapper']");
        this.btnAlterarDadosPessoais = page.locator("//*[@id='b11-b10-Content']/span[contains(text(), 'Alterar')]");
        this.btnProximo = page.locator("//*[contains(text(), 'Próximo')]");
    }

    private void verificarEndereco() {
        waitIsVisibleForSeconds(this.title, Config.WAIT_5_SECONDS);
    }

    private void preencherNumero(String semNumero, String numero) {
        if (semNumero.equals("S")) {
            click(this.cbSemNumero);
        } else {
            pressValue(this.txtNumero, numero);
        }
    }

    private void selecionarEstado(String estado) {
        click(this.slcEstado);
        click(page.locator("//*[@id='b10-$b16-dropdownContent']/*/span[contains(text(), '"+ estado +"')]"));
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

    public void preencherCamposEndereco(
     String cep
    ,String logradouro
    ,String semNumero
    ,String numero
    ,String complemento
    ,String bairro
    ,String cidade
    ,String estado
    ,String pontoReferencia
    ,String alterarNegocio
    ,String alterarDadosPessoais) {
        this.verificarEndereco();
        pressValue(this.txtCep, cep);
        this.preencherNumero(semNumero, numero);
        pressValue(this.txtComplemento, complemento);
        pressValue(this.txtPontoReferencia, pontoReferencia);

        GeneralUtils.waitForSeconds(Config.WAIT_5_SECONDS);
        if (cep.isEmpty()) {
            pressValue(this.txtLogradouro, logradouro);
            pressValue(this.txtBairro, bairro);
            pressValue(this.txtCidade, cidade);
            this.selecionarEstado(estado);
        }

        this.alterarNegocio(alterarNegocio);
        this.alterarDadosPessoais(alterarDadosPessoais);
        click(this.btnProximo);
    }
}