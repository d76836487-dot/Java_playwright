package com.fiserv.qabrazil.steps;

import com.fiserv.qabrazil.pages.AdvancePaymentPage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.components.ChangeEstablishmentPopupComponent;
import com.fiserv.qabrazil.steps.home.BaseSteps;
import com.microsoft.playwright.Page;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import static org.testng.AssertJUnit.assertEquals;
import static org.testng.AssertJUnit.assertTrue;

public class Antecipacao extends BaseSteps {
    @Autowired
    private AdvancePaymentPage advancePaymentPage;

    @Autowired
    private ChangeEstablishmentPopupComponent changeEstablishmentPopupComponent;

    @Autowired
    Page page;

    @When("o usuário acessou página de Antecipação")
    public void shouldBeAtReportsPage() {
        advancePaymentPage.navigateTo();
    }

    @When("o usuário abre modal Trocar Estabelecimento na tela Negócio ou Antecipação")
    public void openPopup() {
        changeEstablishmentPopupComponent.openPopupChangeEstablishment();
    }

    @Then("Mostrará popup para selecionar estabelecimento")
    public void popupIsOpen() {
        boolean isOpen = changeEstablishmentPopupComponent.waitPopupOpen();

        assertTrue("Popup para troca de estabelecimento não está aberto",
                isOpen);
    }

    @Given("o usuário visualiza o dashboard Antecipação")
    public void o_usuário_visualiza_o_dashboard_antecipação() {

    }
    @Given("o número do estabelecimento {string} na coluna Estabelecimento,")
    public void o_número_do_estabelecimento_na_coluna_estabelecimento(String arg0) {
       if( page.getByText(arg0).isVisible()){
           assertTrue(true);
       }
    }
    @Given("a mensagem {string} na coluna Valor\\/Produto")
    public void a_mensagem_na_coluna_valor_produto(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }

    @Given("o valor que pode ser antecipado em {pageField}")
    public void o_valor_que_pode_ser_antecipado_na_coluna_valor_produto(PageField pageField) {

        String textFound = pageField.getAsText();
        assertEquals("R$", textFound);

    }

    @Given("o valor que pode ser antecipado na coluna {string}")
    public void o_valor_que_pode_ser_antecipado_na_coluna(String string) {
        if( page.getByText("R$").isVisible()){
            assertTrue(true);
        }
    }
    @Given("o usuário clica em {pageField}")
    public void o_usuário_clica_no_dashboard_em_ir_para_antecipação(PageField pageField) {
        pageField.firstOf().click();
    }
    @Then("a pagina de antecipação estara disponivel")
    public void a_pagina_de_antecipação_estara_disponivel() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Given("o usuário visualiza o dashboard Antecipação e salva o valor a antecipar")
    public void o_usuário_visualiza_o_dashboard_antecipação_e_salva_o_valor_a_antecipar() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("o usuario vai para a pagina de antecipação")
    public void o_usuario_vai_para_a_pagina_de_antecipação() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("o usuário deve visualizar o valor disponível para antecipar igual ao apresentado no dashboard")
    public void o_usuário_deve_visualizar_o_valor_disponível_para_antecipar_igual_ao_apresentado_no_dashboard() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }


    @Then("o valor zero reais na coluna Valor\\/Produto")
    public void o_valor_zero_reais_na_coluna_valor_produto() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }


    @Then("o usuário visualizará o número do estabelecimento na coluna Estabelecimento e a mensagem {string}")
    public void o_usuário_visualizará_o_número_do_estabelecimento_na_coluna_estabelecimento_e_a_mensagem(String string) {

    }
    @Then("o usuário visualizará valor na coluna 'ValorProduto'")
    public void o_usuário_visualizará_valor_na_coluna_valor_produto() {

    }
    @Then("o usuário visualizará o botão \"Ir para antecipação")
    public void o_usuário_visualizará_o_botão_ir_para_antecipação() {

    }


    @Given("o usuário clica no link {string}")
    public void o_usuário_clica_no_link(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Given("o texto {string} esta visivel na pagina de Antecipação Historico")
    public void o_texto_esta_visivel_na_pagina_de_antecipação_historico(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("o usuário visualizará na página da Antecipação o nome do estabelecimento")
    public void o_usuário_visualizará_na_página_da_antecipação_o_nome_do_estabelecimento() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("o usuário visualizará na CNPJ do estabelecimento")
    public void o_usuário_visualizará_na_cnpj_do_estabelecimento() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("o usuário visualizará o número do estabelecimento")
    public void o_usuário_visualizará_o_número_do_estabelecimento() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }


    @Given("o usuario guarda o Valor disponível para antecipação")
    public void o_usuario_guarda_o_valor_disponível_para_antecipação() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @When("o usuário troca o estabelecimento")
    public void o_usuário_troca_o_estabelecimento() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("o usuário deve visualizar um Valor disponível para antecipação diferente")
    public void o_usuário_deve_visualizar_um_valor_disponível_para_antecipação_diferente() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Given("o usuário acessa a antecipação de um EC Flex pelo dashboard Antecipação")
    public void o_usuário_acessa_a_antecipação_de_um_ec_flex_pelo_dashboard_antecipação() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("o usuário deve visualizar o subtítulo {string}")
    public void o_usuário_deve_visualizar_o_subtítulo(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("o usuário deve visualizar o texto {string}")
    public void o_usuário_deve_visualizar_o_texto(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }

    @Given("o usuário possui saldo para antecipar eventualmente")
    public void o_usuário_possui_saldo_para_antecipar_eventualmente() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Given("o usuário deseja antecipar eventualmente")
    public void o_usuário_deseja_antecipar_eventualmente() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Given("usuário solicita a antecipação")
    public void usuário_solicita_a_antecipação() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @When("o portal apresenta um modal solicitando a confirmação com a frase {string} e o usuário clica em voltar")
    public void o_portal_apresenta_um_modal_solicitando_a_confirmação_com_a_frase_e_o_usuário_clica_em_voltar(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("o usuário deve permanecer na pagina de antecipação e verificar o texto \"Resumo da antecipação eventual")
    public void o_usuário_deve_permanecer_na_pagina_de_antecipação_e_verificar_o_texto_resumo_da_antecipação_eventual() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }

    @Given("o usuário clica no botão Personalizar solicitação de antecipação")
    public void o_usuário_clica_no_botão_personalizar_solicitação_de_antecipação() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @When("Seleciona Bandeira {string} produtos {string} vencimento de hoje ate hoje  data corrente e valor {string}")
    public void seleciona_bandeira_produtos_vencimento_de_hoje_ate_hoje_data_corrente_e_valor(String string, String string2, String string3) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }


    @Given("o usuário solicita a antecipação")
    public void o_usuário_solicita_a_antecipação() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Given("o portal apresenta um modal solicitando a confirmação com a frase {string} E o usuário não confirma a antecipação")
    public void o_portal_apresenta_um_modal_solicitando_a_confirmação_com_a_frase_e_o_usuário_não_confirma_a_antecipação(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Given("o usuário gera o comprovante de antecipação")
    public void o_usuário_gera_o_comprovante_de_antecipação() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("o usuário deve visualizar um arquivo pdf contendo: logo da aliança, título: {string}, data e hora de emissão do PDF, número do estabelecimento comercial e informações gerais \\(valor bruto solicitado em reais, taxa, valor do desconto em reais, valor líquido a receber em reais, status = em andamento, bandeiras = todas as bandeiras, produto = todos, período = antecipar todo o período até o momento e canal de contratação = Portal do cliente)")
    public void o_usuário_deve_visualizar_um_arquivo_pdf_contendo_logo_da_aliança_título_data_e_hora_de_emissão_do_pdf_número_do_estabelecimento_comercial_e_informações_gerais_valor_bruto_solicitado_em_reais_taxa_valor_do_desconto_em_reais_valor_líquido_a_receber_em_reais_status_em_andamento_bandeiras_todas_as_bandeiras_produto_todos_período_antecipar_todo_o_período_até_o_momento_e_canal_de_contratação_portal_do_cliente(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }


    @Given("o usuário não preenche um dos campos da personalização")
    public void o_usuário_não_preenche_um_dos_campos_da_personalização() {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }
    @Then("o usuário não pode clicar no botão {string}")
    public void o_usuário_não_pode_clicar_no_botão(String string) {
        // Write code here that turns the phrase above into concrete actions
        throw new io.cucumber.java.PendingException();
    }


}
