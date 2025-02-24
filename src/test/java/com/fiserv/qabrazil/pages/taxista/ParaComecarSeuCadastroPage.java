package com.fiserv.qabrazil.pages.taxista;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;
import com.fiserv.qabrazil.util.GeneralUtils;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;

import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class ParaComecarSeuCadastroPage {
    @Autowired
    private Page page;

    private Locator title;
    private Locator txtNomeCompleto;
    private Locator txtDataNascimento;
    private Locator txtCelular;
    private Locator txtEmail;
    private Locator txtCpf;
    private Locator txtNomeFantasia;
    private Locator txtFaturamentoAnual;
    private Locator txtTicketMedio;
    private Locator btnProximo;

    @PostConstruct
    private void loadLocators() {
        this.title = page.locator("//*[@id='b4-Titulo']");
        this.txtNomeCompleto = page.locator("//*[@id='b4-Input_Nome']");
        this.txtDataNascimento = page.locator("//*[@id='b4-Input_DataNascimento']");
        this.txtCelular = page.locator("//*[@id='b4-b9-InputMask']");
        this.txtEmail = page.locator("//*[@id='b4-Input_Email']");
        this.txtCpf = page.locator("//*[@id='b4-b14-InputMask']");
        this.txtNomeFantasia = page.locator("//*[@id='b4-Input_NomeFantasia']");
        this.txtFaturamentoAnual = page.locator("//*[@id='b4-Input_FaturamentoAnual']");
        this.txtTicketMedio = page.locator("//*[@id='b4-Input_TicketMedio']");
        this.btnProximo = page.locator("//*[contains(text(), 'Próximo')]");
    }

    public void verificarParaComecarSeuCadastro() {
        assertThat(title).isVisible();
    }

    public void preencherNomeCompleto(String nomeCompleto) { this.txtNomeCompleto.fill(nomeCompleto); }

    public void preencherDataNascimento(String dataNascimento) {
        GeneralUtils.pressDigit(page, this.txtDataNascimento, dataNascimento);
    }

    public void preencherCelular(String celular) {
        GeneralUtils.pressDigit(page, this.txtCelular, celular);
    }

    public void preencherEmail(String email) { this.txtEmail.fill(email); }

    public void preencherCpf(String cpf) { GeneralUtils.pressDigit(page, this.txtCpf, cpf); }

    public void preencherNomeFantasia(String nomeFantasia) { this.txtNomeFantasia.fill(nomeFantasia); }

    public void preencherFaturamentoAnual(String faturamentoAnual) { this.txtFaturamentoAnual.fill(faturamentoAnual); }

    public void preencherTicketMedio(String ticketMedio) { this.txtTicketMedio.fill(ticketMedio); }

    public void clickProximo() { this.btnProximo.click(); }

    public void preencherCamposParaComecarSeuCadastro(
     String nomeCompleto
    ,String dataNascimento
    ,String celular
    ,String email
    ,String cpf
    ,String nomeFantasia
    ,String faturamentoAnual
    ,String ticketMedio) {
        this.verificarParaComecarSeuCadastro();
        this.preencherNomeCompleto(nomeCompleto);
        this.preencherDataNascimento(dataNascimento);
        this.preencherCelular(celular);
        this.preencherEmail(email);
        this.preencherCpf(cpf);
        this.preencherNomeFantasia(nomeFantasia);
        this.preencherFaturamentoAnual(faturamentoAnual);
        this.preencherTicketMedio(ticketMedio);
        this.clickProximo();
    }
}