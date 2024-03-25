package com.fiserv.qabrazil.pages.home;

import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.fiserv.qabrazil.util.RegexUtil;
import com.microsoft.playwright.Locator;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.regex.Pattern;

import static com.fiserv.qabrazil.pages.PageField.assertThat;
import static com.fiserv.qabrazil.util.WaitUtil.waitUntilTrue;
import static com.microsoft.playwright.assertions.PlaywrightAssertions.assertThat;
import static org.assertj.core.api.Assumptions.assumeThat;

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
        Locator locator = page.locator("#CtnAgendaRecebimentosSemana");
        assertThat(locator).isVisible();
        locator.scrollIntoViewIfNeeded();
        locator.highlight();
    }

    public boolean receivablesAvailable() {
        // TODO: trocar para testId
        Locator locator = page.locator("#CtnAgendaRecebimentosSemana");
        return waitUntilTrue(3, () -> !locator.textContent().contains("Você não possui nenhum recebimento previsto para essa semana."));
    }

    public void containsDates() {
        PageField mondayDay = pageField.from("Home - Agenda Recebimento - Dia Segunda");
        PageField tuesdayDay = pageField.from("Home - Agenda Recebimento - Dia Terça");
        PageField wednesdayDay = pageField.from("Home - Agenda Recebimento - Dia Quarta");
        PageField thursdayDay = pageField.from("Home - Agenda Recebimento - Dia Quinta");
        PageField fridayDay = pageField.from("Home - Agenda Recebimento - Dia Sexta");

        assertThat(mondayDay).containsText(DateUtil.day(monday));
        assertThat(tuesdayDay).containsText(DateUtil.day(tuesday));
        assertThat(wednesdayDay).containsText(DateUtil.day(wednesday));
        assertThat(thursdayDay).containsText(DateUtil.day(thursday));
        assertThat(fridayDay).containsText(DateUtil.day(friday));
    }

    public void containsMonths() {
        PageField mondayMonth = pageField.from("Home - Agenda Recebimento - Mês Segunda");
        PageField tuesdayMonth = pageField.from("Home - Agenda Recebimento - Mês Terça");
        PageField wednesdayMonth = pageField.from("Home - Agenda Recebimento - Mês Quarta");
        PageField thursdayMonth = pageField.from("Home - Agenda Recebimento - Mês Quinta");
        PageField fridayMonth = pageField.from("Home - Agenda Recebimento - Mês Sexta");

        assertThat(mondayMonth).containsText(DateUtil.month(monday));
        assertThat(tuesdayMonth).containsText(DateUtil.month(tuesday));
        assertThat(wednesdayMonth).containsText(DateUtil.month(wednesday));
        assertThat(thursdayMonth).containsText(DateUtil.month(thursday));
        assertThat(fridayMonth).containsText(DateUtil.month(friday));
    }

    public void containsWeekDates() {
        PageField mondayWeekday = pageField.from("Home - Agenda Recebimento - Dia da semana Segunda");
        PageField tuesdayWeekday = pageField.from("Home - Agenda Recebimento - Dia da semana Terça");
        PageField wednesdayWeekday = pageField.from("Home - Agenda Recebimento - Dia da semana Quarta");
        PageField thursdayWeekday = pageField.from("Home - Agenda Recebimento - Dia da semana Quinta");
        PageField fridayWeekday = pageField.from("Home - Agenda Recebimento - Dia da semana Sexta");

        assertThat(mondayWeekday).containsText(DateUtil.weekday(DayOfWeek.MONDAY));
        assertThat(tuesdayWeekday).containsText(DateUtil.weekday(DayOfWeek.TUESDAY));
        assertThat(wednesdayWeekday).containsText(DateUtil.weekday(DayOfWeek.WEDNESDAY));
        assertThat(thursdayWeekday).containsText(DateUtil.weekday(DayOfWeek.THURSDAY));
        assertThat(fridayWeekday).containsText(DateUtil.weekday(DayOfWeek.FRIDAY));
    }

    public void containsNetValues() {
        PageField mondayNetValue = pageField.from("Home - Agenda Recebimento - Valor Segunda");
        PageField tuesdayNetValue = pageField.from("Home - Agenda Recebimento - Valor Terça");
        PageField wednesdayNetValue = pageField.from("Home - Agenda Recebimento - Valor Quarta");
        PageField thursdayNetValue = pageField.from("Home - Agenda Recebimento - Valor Quinta");
        PageField fridayNetValue = pageField.from("Home - Agenda Recebimento - Valor Sexta");

        assertThat(mondayNetValue).containsText(netValue());
        assertThat(tuesdayNetValue).containsText(netValue());
        assertThat(wednesdayNetValue).containsText(netValue());
        assertThat(thursdayNetValue).containsText(netValue());
        assertThat(fridayNetValue).containsText(netValue());
    }

    public void containsNumberOfDeposits() {
        PageField mondayDeposits = pageField.from("Home - Agenda Recebimento - Qtd Depósitos Segunda");
        PageField tuesdayDeposits = pageField.from("Home - Agenda Recebimento - Qtd Depósitos Terça");
        PageField wednesdayDeposits = pageField.from("Home - Agenda Recebimento - Qtd Depósitos Quarta");
        PageField thursdayDeposits = pageField.from("Home - Agenda Recebimento - Qtd Depósitos Quinta");
        PageField fridayDeposits = pageField.from("Home - Agenda Recebimento - Qtd Depósitos Sexta");

        assertNumberOfDeposits(monday, mondayDeposits);
        assertNumberOfDeposits(tuesday, tuesdayDeposits);
        assertNumberOfDeposits(wednesday, wednesdayDeposits);
        assertNumberOfDeposits(thursday, thursdayDeposits);
        assertNumberOfDeposits(friday, fridayDeposits);
    }

    private void assertNumberOfDeposits(LocalDate date, PageField pageField) {
        if (!date.isAfter(today)) {
            assertThat(pageField).containsText(numberOfDeposits());
        } else {
            assertThat(pageField).hasCount(0);
        }
    }

    public void containsHighlightedInformation() {
        assumeThat(DateUtil.isWeekend(today))
                .withFailMessage("Today is weekend.")
                .isFalse();

        Pattern orangeClass = Pattern.compile(contractConfig.getActiveUserProfile().primaryCssClass());
        Pattern grayClass = Pattern.compile("cor-cinza-claro");
        Pattern greenColor = Pattern.compile(RegexUtil.escape("color: rgb(88, 207, 33)"));
        Pattern grayColor = Pattern.compile(RegexUtil.escape("color: rgb(156, 156, 156)"));

        for (LocalDate date : new LocalDate[] { monday, tuesday, wednesday, thursday, friday }) {
            String dayOfWeek = DateUtil.shortWeekday(date.getDayOfWeek());

            PageField weekday = pageField.from("Home - Agenda Recebimento - Dia da semana " + dayOfWeek);
            PageField netValue = pageField.from("Home - Agenda Recebimento - Valor " + dayOfWeek);
            PageField deposits = pageField.from("Home - Agenda Recebimento - Qtd Depósitos " + dayOfWeek);

            if (date.equals(today)) {
                assertThat(weekday).hasClass(orangeClass);
            } else {
                assertThat(weekday).not().hasClass(orangeClass);
            }

            if (date.isAfter(today)) {
                assertThat(netValue).hasAttribute("style", grayColor);
            } else {
                assertThat(netValue).hasAttribute("style", greenColor);
                assertThat(deposits).hasClass(grayClass);
            }
        }
    }

    public void assertThatViewDetailedReceiptsButtonIsVisible() {
        // TODO: trocar para testId
        Locator locator = page.locator("#CtnAgendaRecebimentosSemana").getByText("Ver tudo");
        assertThat(locator).isVisible();
        assertThat(locator).containsText("Ver tudo");
    }

    private static Pattern netValue() {
        return Pattern.compile("R\\$ [\\d.]+,\\d\\d");
    }

    private static Pattern numberOfDeposits() {
        return Pattern.compile("\\d+ depositos");
    }
}
