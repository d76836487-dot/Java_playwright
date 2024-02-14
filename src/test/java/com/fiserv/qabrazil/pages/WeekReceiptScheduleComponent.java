package com.fiserv.qabrazil.pages;

import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.microsoft.playwright.Locator;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;

@ScenarioComponent
public class WeekReceiptScheduleComponent extends BasePage {

    private final LocalDate today = LocalDate.now();
    private final LocalDate monday = today.with(DayOfWeek.MONDAY);
    private final LocalDate tuesday = today.with(DayOfWeek.TUESDAY);
    private final LocalDate wednesday = today.with(DayOfWeek.WEDNESDAY);
    private final LocalDate thursday = today.with(DayOfWeek.THURSDAY);
    private final LocalDate friday = today.with(DayOfWeek.FRIDAY);

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
        assertThat(page.locator("#b12-Segunda .margin-left-xs span")).containsText(DateUtil.dateAndMonth(monday));
        assertThat(page.locator("#b12-Terca .margin-left-xs span")).containsText(DateUtil.dateAndMonth(tuesday));
        assertThat(page.locator("#b12-Quarta .margin-left-xs span")).containsText(DateUtil.dateAndMonth(wednesday));
        assertThat(page.locator("#b12-Quinta .margin-left-xs span")).containsText(DateUtil.dateAndMonth(thursday));
        assertThat(page.locator("#b12-Sexta .margin-left-xs span")).containsText(DateUtil.dateAndMonth(friday));
    }

    public void containsWeekDates() {
        String expectedMonday = DateUtil.weekday(DayOfWeek.MONDAY);
        String expectedTuesday = DateUtil.weekday(DayOfWeek.TUESDAY);
        String expectedWednesday = DateUtil.weekday(DayOfWeek.WEDNESDAY);
        String expectedThursday = DateUtil.weekday(DayOfWeek.THURSDAY);
        String expectedFriday = DateUtil.weekday(DayOfWeek.FRIDAY);

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
