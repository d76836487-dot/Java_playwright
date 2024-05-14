package com.fiserv.qabrazil.pages.receipts;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.components.FilesToAttachToScenario;
import com.fiserv.qabrazil.pages.CheckedBasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.pages.receivables.ReceivableExport;
import com.fiserv.qabrazil.pages.receivables.ReceivableExportExcel;
import com.fiserv.qabrazil.util.CSVWrapper;
import com.fiserv.qabrazil.util.Currency;
import com.fiserv.qabrazil.util.ExcelWrapper;
import com.microsoft.playwright.Download;
import com.microsoft.playwright.Locator;
import com.microsoft.playwright.Page;
import com.microsoft.playwright.options.AriaRole;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
@Component("Agenda de Recebimentos por UR")
public class ReceivableUnitReceiptSchedulePage extends CheckedBasePage {
    @Autowired
    private FilesToAttachToScenario filesToAttachToScenario;

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

    public boolean foundReceivableByTheDate(LocalDate day) {
        String textLookingFor = getFormattedDate(day);

        // TODO: trocar por data-testid aqui...
        return page.getByRole(AriaRole.BUTTON, new Page.GetByRoleOptions().setName(textLookingFor)).count() > 0 ||
                page.getByRole(AriaRole.BUTTON, new Page.GetByRoleOptions().setName(textLookingFor + " Valor")).count() > 0;
    }

    private String getFormattedDate(LocalDate day) {
        DateTimeFormatter formatter =  DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String weekday = day.format(DateTimeFormatter.ofLocalizedDate(FormatStyle.FULL))
                .replaceAll(", .*", "");
        return "%s %s".formatted(day.format(formatter), StringUtils.capitalize(weekday));
    }

    public List<PageField> getBrandOptionsAtFilter(PageField allPageField) {
        waitUntilTrue(() -> allPageField.getCount() >= 10);
        return allPageField.getAllPageField();
    }

    public ReceivableExport downloadExcel() throws IOException {
        String formatType = "Agenda de Recebimentos por UR - Exportar - Dropdown Tipo Arquivo - Excel";
        ImmutablePair<InputStream, String> readStreamFileName = downloadReport(formatType);

        if (readStreamFileName == null) return ReceivableExportExcel.NULL;

        BufferedInputStream bufferedInputStream = filesToAttachToScenario.setAttachment(readStreamFileName.getLeft(),
                ExcelWrapper.CONTENT_TYPE, "Excel");

        return new ReceivableExportExcel(
                new ExcelWrapper(bufferedInputStream, "Data", readStreamFileName.getRight()));
    }

    private ImmutablePair<InputStream, String> downloadReport(String formatType) {
        PageField exportButton = pageField.from("Agenda de Recebimentos por UR - Botão Exportar");

        if (!exportButton.fieldIsOneVisibleAndEnabled()) return null;

        exportButton.click();
        pageField.from("Agenda de Recebimentos por UR - Exportar - Dropdown Tipo Arquivo").hoverOver();
        pageField.from("Agenda de Recebimentos por UR - Exportar - Dropdown Tipo Arquivo").click();
        pageField.from(formatType).hoverOver();
        pageField.from(formatType).click();
        pageField.from(formatType).hoverAway();

        Download download = page.waitForDownload(new Page.WaitForDownloadOptions().setTimeout(100000), () ->
                pageField.from("Agenda de Recebimentos por UR - Exportar - Botão Gerar Arquivo").click());

        return new ImmutablePair<>(download.createReadStream(), download.suggestedFilename());
    }
}
