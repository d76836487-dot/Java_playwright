package com.fiserv.qabrazil.pages.sales;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.components.Paginator;
import com.fiserv.qabrazil.dto.SalesDtoPage;
import com.fiserv.qabrazil.pages.CheckedBasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.Currency;
import com.microsoft.playwright.Locator;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import static com.fiserv.automation.api.util.DateUtil.convertToDateTimeFromPage;
import static com.fiserv.qabrazil.util.RequestMonitoring.startMonitoringRequests;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;

@ScenarioComponent
@Component("Vendas Hoje")
public class SalesTodayPage extends CheckedBasePage {

    @Autowired
    private Paginator paginator;

    public SalesTodayPage() {
        super(Pattern.compile("^.*/Hoje$"));
    }

    public void navigateTo() {
        getLateralMenuLocator().click();
        startMonitoringRequests(page, contractConfig);
        page.waitForURL(Pattern.compile("^.*/Hoje$"));
    }

    public void hoverMenuOnSalesMenu() {
        getLateralMenuLocator().hover();
    }

    @NotNull
    public List<SalesDtoPage> getSalesAsDto() {
        // TODO: adicionar data-testid
        List<SalesDtoPage> allSales = new ArrayList<>();
        boolean gotSomething = waitUntilTrue(90, () ->
                page.locator("//*[contains(text(), 'Nenhum resultado encontrado')]").count() == 1 ||
                        !PageField.from("Vendas Hoje - Histórico - Coluna Valor Bruto").getAllAsCurrency().isEmpty()
        );
        if (!gotSomething) {
            throw new RuntimeException("O histórico de vendas hoje está demorando muito para responder.");
        }
        if (page.locator("//*[contains(text(), 'Nenhum resultado encontrado')]").count() == 1) {
            return allSales;
        }

        List<String> ec = PageField.from("Vendas Hoje - Histórico - Coluna Estabelecimento").getAllAsText();
        List<String> product = PageField.from("Vendas Hoje - Histórico - Coluna Produto").getAllAsText();
        List<String> installments = PageField.from("Vendas Hoje - Histórico - Coluna Parcela").getAllAsText();
        List<String> channel = PageField.from("Vendas Hoje - Histórico - Coluna Canal").getAllAsText();
        List<String> terminal = PageField.from("Vendas Hoje - Histórico - Coluna Terminal").getAllAsText();
        List<String> status = PageField.from("Vendas Hoje - Histórico - Coluna Status").getAllAsText();
        List<String> dateTime = PageField.from("Vendas Hoje - Histórico - Coluna Data Hora").getAllAsText();
        List<Double> grossValue = PageField.from("Vendas Hoje - Histórico - Coluna Valor Bruto")
                .getAllAsCurrency().stream()
                .map(Currency::doubleValue)
                .toList();

        for (int i = 0; i < grossValue.size(); i++) {
            SalesDtoPage dto = new SalesDtoPage(
                    i,
                    convertToDateTimeFromPage(dateTime.get(i)),
                    product.size() > i? product.get(i): "",
                    installments.size() > i? installments.get(i): "",
                    channel.size() > i? channel.get(i): "",
                    terminal.size() > i? terminal.get(i): "",
                    status.size() > i? status.get(i): "",
                    ec.size() > i? ec.get(i): "",
                    grossValue.get(i));
            allSales.add(dto);
        }

        return allSales;
    }

    private Locator getLateralMenuLocator() {
        return page.getByTestId("menu-vendas").last();
    }

    public boolean thereAreSalesWithStatus(String salesStatus) {
        return thereAreSalesWith(salesStatus, "vendas-hoje-coluna-status\\d");
    }

    public boolean thereAreSalesWithBrandName(String brandName) {
        return thereAreSalesWith(brandName, "vendas-hoje-coluna-bandeira");
    }

    public boolean thereAreSalesWithProduct(String brandName) {
        return thereAreSalesWith(brandName, "vendas-hoje-coluna-produto");
    }

    public boolean thereAreSalesWith(String textLookingFor, String testId) {
        return paginator.anyMatch(() -> findSalesWithinPage(textLookingFor, testId));
    }

    private boolean findSalesWithinPage(String textLookingFor, String testId) {
        Locator salesStatusLabel = page.getByTestId(Pattern.compile(testId));
        return waitUntilTrue(2, () ->
                salesStatusLabel.allTextContents().stream().anyMatch(text -> text.equals(textLookingFor)));
    }
}