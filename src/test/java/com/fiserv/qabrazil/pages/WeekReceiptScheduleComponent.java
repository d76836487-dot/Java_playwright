package com.fiserv.qabrazil.pages;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;
import jakarta.annotation.PostConstruct;
import org.apache.commons.lang3.StringUtils;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Locale;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class WeekReceiptScheduleComponent extends BasePage {

    private Locale locale;
    private final LocalDate today = LocalDate.now();
    private final LocalDate monday = today.with(DayOfWeek.MONDAY);
    private final LocalDate tuesday = today.with(DayOfWeek.TUESDAY);
    private final LocalDate wednesday = today.with(DayOfWeek.WEDNESDAY);
    private final LocalDate thursday = today.with(DayOfWeek.THURSDAY);
    private final LocalDate friday = today.with(DayOfWeek.FRIDAY);

    @PostConstruct
    public void init() {
        locale = Locale.forLanguageTag(contractConfig.getLocale());
    }

    public void isVisible() {
        // TODO: trocar para testId
        Locator locator = page.locator("#CtnAgendaRecebimentosSemana2");
        assertThat(locator).isVisible();
        locator.scrollIntoViewIfNeeded();
        locator.highlight();
    }

    public boolean receivablesAvailable() {
        // TODO: trocar para testId
        Locator locator = page.locator("#CtnAgendaRecebimentosSemana2");
        return waitUntilTrue(3, () -> !locator.textContent().equals("Agenda de recebimentos da semanaVocê não possui nenhum recebimento previsto para essa semana.Ver recebimentos detalhado"));
    }

    public void containsDatesAndMonths() {
        // TODO: trocar para testId
        assertThat(page.locator("#b12-Segunda .margin-left-xs span")).containsText(dateAndMonth(monday));
        assertThat(page.locator("#b12-Terca .margin-left-xs span")).containsText(dateAndMonth(tuesday));
        assertThat(page.locator("#b12-Quarta .margin-left-xs span")).containsText(dateAndMonth(wednesday));
        assertThat(page.locator("#b12-Quinta .margin-left-xs span")).containsText(dateAndMonth(thursday));
        assertThat(page.locator("#b12-Sexta .margin-left-xs span")).containsText(dateAndMonth(friday));
    }

    public void containsWeekDates() {
        String expectedMonday = weekday(DayOfWeek.MONDAY);
        String expectedTuesday = weekday(DayOfWeek.TUESDAY);
        String expectedWednesday = weekday(DayOfWeek.WEDNESDAY);
        String expectedThursday = weekday(DayOfWeek.THURSDAY);
        String expectedFriday = weekday(DayOfWeek.FRIDAY);

        // TODO: trocar para testId
        assertThat(page.locator("#b12-Segunda .padding-top-s")).containsText(expectedMonday);
        assertThat(page.locator("#b12-Terca .padding-top-s")).containsText(expectedTuesday);
        assertThat(page.locator("#b12-Quarta .padding-top-s")).containsText(expectedWednesday);
        assertThat(page.locator("#b12-Quinta .padding-top-s")).containsText(expectedThursday);
        assertThat(page.locator("#b12-Sexta .padding-top-s")).containsText(expectedFriday);
    }

    public void containsNetValueAndNumberOfDeposits() {
        // TODO: trocar para testId
        assertThat(page.locator("#b12-Segunda .text-align-right span")).containsText(netValueAndNumberOfDeposits(monday));
        assertThat(page.locator("#b12-Terca .text-align-right span")).containsText(netValueAndNumberOfDeposits(tuesday));
        assertThat(page.locator("#b12-Quarta .text-align-right span")).containsText(netValueAndNumberOfDeposits(wednesday));
        assertThat(page.locator("#b12-Quinta .text-align-right span")).containsText(netValueAndNumberOfDeposits(thursday));
        assertThat(page.locator("#b12-Sexta .text-align-right span")).containsText(netValueAndNumberOfDeposits(friday));
    }

    public void assertThatThereAreNoReceivablesAvailableMessage() {
        // TODO: trocar para testId
        Locator locator = page.locator("#CtnAgendaRecebimentosSemana2");
        assertThat(locator).containsText("Agenda de recebimentos da semanaVocê não possui nenhum recebimento previsto para essa semana.");
    }

    public void assertThatViewDetailedReceiptsButtonIsVisible() {
        // TODO: trocar para testId
        Locator locator = page.locator("#CtnAgendaRecebimentosSemana2").getByText("Ver recebimentos detalhado");
        assertThat(locator).isVisible();
        assertThat(locator).containsText("Ver recebimentos detalhado");
    }

    private String[] dateAndMonth(LocalDate date) {
        String day = date.format(DateTimeFormatter.ofPattern("dd", locale));

        String monthName = date.getMonth().getDisplayName(TextStyle.FULL, locale);
        monthName = StringUtils.capitalize(monthName).substring(0, 3);

        return new String[] {day, monthName};
    }

    private String weekday(DayOfWeek dayOfWeek) {
        return today.getDayOfWeek().equals(dayOfWeek) ? "Hoje" : StringUtils.capitalize(dayOfWeek.getDisplayName(TextStyle.FULL, locale));
    }

    private Pattern[] netValueAndNumberOfDeposits(LocalDate date) {
        Pattern netValue = Pattern.compile("R\\$[\\d.]+,\\d\\d");
        Pattern numberOfDeposits = Pattern.compile("\\d+ depositos");
        if (date.isAfter(today)) {
            return new Pattern[] {netValue};
        } else {
            return new Pattern[] {netValue, numberOfDeposits};
        }
    }
}
