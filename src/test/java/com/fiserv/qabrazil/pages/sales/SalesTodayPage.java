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
                        !pageField.from("Vendas Hoje - Histórico - Coluna Valor Bruto").getAllAsCurrency().isEmpty()
        );
        if (!gotSomething) {
            throw new RuntimeException("O histórico de vendas hoje está demorando muito para responder.");
        }
        if (page.locator("//*[contains(text(), 'Nenhum resultado encontrado')]").count() == 1) {
            return allSales;
        }

        List<String> ec = pageField.from("Vendas Hoje - Histórico - Coluna Estabelecimento").getAllAsText();
        List<String> product = pageField.from("Vendas Hoje - Histórico - Coluna Produto").getAllAsText();
        List<String> installments = pageField.from("Vendas Hoje - Histórico - Coluna Parcela").getAllAsText();
        List<String> channel = pageField.from("Vendas Hoje - Histórico - Coluna Canal").getAllAsText();
        List<String> terminal = pageField.from("Vendas Hoje - Histórico - Coluna Terminal").getAllAsText();
        List<String> status = pageField.from("Vendas Hoje - Histórico - Coluna Status").getAllAsText();
        List<String> dateTime = pageField.from("Vendas Hoje - Histórico - Coluna Data Hora").getAllAsText();
        List<Double> grossValue = pageField.from("Vendas Hoje - Histórico - Coluna Valor Bruto")
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
        return pageField.from("Menu Lateral - Vendas").getLocator().last();
    }

    public boolean thereAreSalesWithStatus(String salesStatus) {
        return thereAreSalesWith(salesStatus, "Vendas Hoje - Histórico - Coluna Status");
    }

    public boolean thereAreSalesWithBrandName(String brandName) {
        return thereAreSalesWith(brandName, "Vendas Hoje - Histórico - Coluna Bandeira");
    }

    public boolean thereAreSalesWithProduct(String brandName) {
        return thereAreSalesWith(brandName, "Vendas Hoje - Histórico - Coluna Produto");
    }

    public boolean thereAreSalesWith(String textLookingFor, String pageFieldId) {
        return paginator.anyMatch(() -> findSalesWithinPage(textLookingFor, pageFieldId));
    }

    private boolean findSalesWithinPage(String textLookingFor, String pageFieldId) {
        PageField salesStatusLabel = pageField.from(pageFieldId);
        return waitUntilTrue(2, () ->
                salesStatusLabel.getAllAsText().stream().anyMatch(text -> text.equals(textLookingFor)));
    }
}