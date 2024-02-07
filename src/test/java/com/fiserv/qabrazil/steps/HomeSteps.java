package com.fiserv.qabrazil.steps;

import com.fiserv.automation.api.dto.AuthorizationsDto;
import com.fiserv.automation.api.service.ApiAuthorizationsService;
import com.fiserv.qabrazil.config.TestIdsConfig;
import com.fiserv.qabrazil.pages.CommonsPage;
import com.fiserv.qabrazil.pages.HomeCustomizeModal;
import com.fiserv.qabrazil.pages.HomePage;
import com.fiserv.qabrazil.util.Identifier;
import io.cucumber.java.ParameterType;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

import static com.fiserv.automation.api.util.DateUtil.convertDateFromPageToDateApi;
import static com.fiserv.automation.api.util.DateUtil.convertTimeFromPageToDateApi;
import static org.testng.AssertJUnit.*;

public class HomeSteps {

    @Autowired
    CommonsPage commonsPage;

    @Autowired
    HomePage homePage;

    @Autowired
    HomeCustomizeModal homeCustomizeModal;

    @Autowired
    ApiAuthorizationsService apiAuthorizationsService;

    @When("Usuário acessou o Home")
    @Given("que estou na tela “início” do Portal")
    public void ensureWeAreAtHome() {
        homePage.ensureWeAreAtHome();
    }

    @Then("Usuário {booleanValue} card Antecipação")
    public void userSeesAnticipationCard(boolean cardShouldBeVisible) {
        boolean cardAnticipation = homePage.anticipationCardIsVisible();
        assertEquals("Visibilidade do card inesperada", cardAnticipation, cardShouldBeVisible);
    }

    @ParameterType(value = "verá|não verá")
    public Boolean booleanValue(String value) {
        return value.equals("verá");
    }

    @When("na seção Vendas Hoje clicar no botão \"Ver tudo\"")
    public void clickOnButtonSeeAllInSalesTodaySection() {
        homePage.clickOnButtonSeeAllInSalesTodaySection();
    }

    @Then("será direcionado ao menu \"Vendas Hoje\"")
    public void shouldNavigateToSalesTodayPage() {
        homePage.hasRedirectedTo("/Hoje");
    }

    @When("clicar no botão {string}")
    public void clickOnButton(String buttonText) {
        commonsPage.clickButtonWithText(buttonText);
    }

    @Then("Total de Recebimentos será igual ao recebimento de hoje + futuro previsto")
    public void totalReceivableMatches() {
        String totalReceivableId = TestIdsConfig.getTestId("Home - Card Recebimento - Total Recebimento");
        String todayReceivableId = TestIdsConfig.getTestId("Home - Card Recebimento - Recebimento Hoje");
        String foreseenReceivableId = TestIdsConfig.getTestId("Home - Card Recebimento - Recebimento Previsto");

        Number totalReceivable = commonsPage.getNumberFromCurrencyElement(totalReceivableId);
        Number todayReceivable = commonsPage.getNumberFromCurrencyElement(todayReceivableId);
        Number foreseenReceivable = commonsPage.getNumberFromCurrencyElement(foreseenReceivableId);

        assertEquals("Total of receivable not matching sum for today and foreseen",
                totalReceivable.doubleValue(), todayReceivable.doubleValue() + foreseenReceivable.doubleValue());
    }

    @Then("Total de {identifier} será igual à API")
    public void compareTotalSalesPageAndApi(Identifier identifier) throws Exception {
        String testId = identifier.testId();

        Number salesTodayPage = commonsPage.getNumberFromCurrencyElement(testId);
        Number salesTodayApi = apiAuthorizationsService.getSalesTodayAllEcs();

        assertEquals("Total de vendas da página é diferente da api", salesTodayApi, salesTodayPage);
    }

    @Then("'Home - Card Últimas Vendas - Valor' correspondem aos valores últimas vendas da API")
    public void lastSalesMatchApi() throws Exception {
        List<AuthorizationsDto> lastSalesPage = getLastSalesAsDto();
        List<AuthorizationsDto> lastSalesApi = apiAuthorizationsService.getValueLastSales();

        boolean allSalesInPageMatchApi = lastSalesPage.stream()
                .allMatch(dto -> lastSalesApi.stream()
                        .anyMatch(dto::equals));

        String message = String.format("Valor das últimas vendas da página é diferente da api.\n Esperado: %s\n retornado %s",
                lastSalesApi, lastSalesPage);
        assertTrue(message, allSalesInPageMatchApi);
    }

    private List<AuthorizationsDto> getLastSalesAsDto() {
        String saleTypesId = TestIdsConfig.getTestId("Home - Card Últimas Vendas - Tipo");
        String saleValuesId = TestIdsConfig.getTestId("Home - Card Últimas Vendas - Valor");
        String saleDateId = TestIdsConfig.getTestId("Home - Card Últimas Vendas - Data");
        String saleTimeId = TestIdsConfig.getTestId("Home - Card Últimas Vendas - Hora");

        List<String> salesTypes = commonsPage.getAllTextsFromElement(saleTypesId);
        List<Number> salesValues = commonsPage.getAllNumbersFromCurrencyElement(saleValuesId);
        List<String> saleDate = commonsPage.getAllTextsFromElement(saleDateId);
        List<String> saleTime = commonsPage.getAllTextsFromElement(saleTimeId);

        List<AuthorizationsDto> lastSalesPage = new ArrayList<>();
        for(int i = 0; i < salesTypes.size(); i++) {
            AuthorizationsDto dto = new AuthorizationsDto()
                    .setTipoAutorizacao(salesTypes.get(i))
                    .setValorTransacao(String.valueOf(salesValues.get(i)))
                    .setData(convertDateFromPageToDateApi(saleDate.get(i)))
                    .setHora(convertTimeFromPageToDateApi(saleTime.get(i)));
            lastSalesPage.add(dto);
        }

        return lastSalesPage;
    }

    @Given("{string} está disponível na \"Home - acesso rápido\"")
    public void quickAccessContainsItem(String identifier) {
        String elementSelector = Identifier.from("Home - acesso rápido - " + identifier).selector();
        if (!commonsPage.elementIsVisible(elementSelector)) {
            commonsPage.clickButtonWithText("Personalizar");
            homeCustomizeModal.select(identifier);
        }
    }
}
