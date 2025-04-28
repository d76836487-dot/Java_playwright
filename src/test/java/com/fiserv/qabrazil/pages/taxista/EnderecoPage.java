package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.*;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class EnderecoPage {
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

    public void verificarEndereco() {
        assertThat(title).isVisible();
    }

    public void preencherCep(String cep) { this.txtCep.fill(cep); }

    public void preencherLogradouro(String logradouro) { this.txtLogradouro.fill(logradouro); }

    public void preencherNumero(String semNumero, String numero) {
        if (semNumero.equals("S")) {
            this.cbSemNumero.click();
        } else {
            this.txtNumero.fill(numero);
        }
    }

    public void preencherComplemento(String complemento) { this.txtComplemento.fill(complemento); }

    public void preencherBairro(String bairro) { this.txtBairro.fill(bairro); }

    public void preencherCidade(String cidade) { this.txtCidade.fill(cidade); }

    public void selecionarEstado(String estado) {
        this.slcEstado.click();
        Locator optEstado = page.locator("//*[@id='b10-$b16-dropdownContent']/*/span[contains(text(), '"+ estado +"')]");
        optEstado.click();
        this.title.click();
    }

    public void preencherPontoReferencia(String pontoReferencia) { this.txtPontoReferencia.fill(pontoReferencia); }

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

    public void clickProximo() { this.btnProximo.click(); }

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
        this.preencherCep(cep);
        this.preencherNumero(semNumero, numero);
        this.preencherComplemento(complemento);
        this.preencherPontoReferencia(pontoReferencia);

        GeneralUtils.waitForSeconds(Config.WAIT_LEVEL_1);
        if (cep.isEmpty()) {
            this.preencherLogradouro(logradouro);
            this.preencherBairro(bairro);
            this.preencherCidade(cidade);
            this.selecionarEstado(estado);
        }

        this.alterarNegocio(alterarNegocio);
        this.alterarDadosPessoais(alterarDadosPessoais);
        this.clickProximo();
    }
}