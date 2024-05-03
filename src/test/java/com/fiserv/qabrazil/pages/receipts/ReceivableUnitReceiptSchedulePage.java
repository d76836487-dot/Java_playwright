package com.fiserv.qabrazil.pages.receipts;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.CheckedBasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.Currency;
import com.microsoft.playwright.Locator;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
@Component("Agenda de Recebimentos por UR")
public class ReceivableUnitReceiptSchedulePage extends CheckedBasePage {

    public ReceivableUnitReceiptSchedulePage() {
        super(Pattern.compile("^.*/AgendaRecebimentosUR$"));
    }

    public void navigateTo() {
        pageField.from("Menu Lateral - Recebimentos").hoverOver();
        pageField.from("Menu Lateral - Agenda de Recebimentos UR").click();
        page.waitForURL(Pattern.compile("^.*/AgendaRecebimentosUR$"));
        waitUntilTrue(360, this::hasNoLoadingBars);
    }

    public double sumFutureValueAllBrands() {
        pageField.from("Agenda de Recebimentos por UR - Botão Detalhe totais por bandeira").click();

        PageField valuesAllBrands = pageField.from("Agenda de Recebimentos por UR - Modal Detalhe totais por bandeira - Valores");
        waitUntilTrue(() -> valuesAllBrands.getCount() > 0);

        List<Currency> valuesAsCurrency = valuesAllBrands.getAllAsCurrency();

        if (valuesAsCurrency.size() % 3 != 0) {
            throw new RuntimeException("O teste esperava que bandeiras fossem múltiplas de três. Um para soma, outro débito e outro crédito. É necessário corrigir este teste");
        }

        return Stream.iterate(0, n -> n < valuesAsCurrency.size(), i -> i + 3)
                .map(valuesAsCurrency::get)
                .mapToDouble(Currency::doubleValue)
                .sum();
    }

    public void validateModal(Map<String, String> balls, Map<String, String> logos, String backgroundColor) {
        Locator popup = page.locator(".popup-dialog");
        assertThat(popup.getByText("Totais líquidos por bandeira e produto"))
                .isVisible();

        Map<String, Locator> brands = Map.of(
                "Mastercard", popup.locator("//*[contains(@class,dis)][div/div/div/span[text()='Mastercard']]"),
                "ELO", popup.locator("//*[contains(@class,dis)][div/div/div/span[text()='ELO']]"),
                "Visa", popup.locator("//*[contains(@class,dis)][div/div/div/span[text()='Visa']]"),
                "Hipercard", popup.locator("//*[contains(@class,dis)][div/div/div/span[text()='Hipercard']]"),
                "Amex", popup.locator("//*[contains(@class,dis)][div/div/div/span[text()='Amex']]"),
                "Cabal", popup.locator("//*[contains(@class,dis)][div/div/div/span[text()='Cabal']]"));

        brands.forEach((brand, row) -> {
            row.scrollIntoViewIfNeeded();

            Locator ballLocator = row.locator(".fa-circle");
            Locator imageLocator = row.locator("img");
            Locator textLocator = row.locator("div div div span");
            Locator creditLocator = row.getByText(Pattern.compile("Crédito"));
            Locator debitLocator = row.getByText(Pattern.compile("Débito"));

            String expectedColor = balls.get(brand);
            String expectedLogo = logos.get(brand);

            ballLocator.highlight();
            assertThat(ballLocator)
                    .hasCSS("color", expectedColor);

            imageLocator.highlight();
            assertThat(imageLocator)
                    .hasAttribute("src", Pattern.compile(expectedLogo));

            textLocator.highlight();
            assertThat(textLocator)
                    .hasText(brand);

            creditLocator.highlight();
            assertThat(creditLocator).hasText(brand + " Crédito");

            debitLocator.highlight();
            assertThat(debitLocator).hasText(brand + " Débito");
        });

        Locator xButton = popup.locator(".fa-times");
        xButton.scrollIntoViewIfNeeded();
        xButton.highlight();
        assertThat(xButton).isVisible();

        Locator closeButton = popup.locator("button");
        closeButton.scrollIntoViewIfNeeded();
        closeButton.highlight();
        assertThat(closeButton).isVisible();
        assertThat(closeButton).hasCSS("background-color", backgroundColor);
    }
}
