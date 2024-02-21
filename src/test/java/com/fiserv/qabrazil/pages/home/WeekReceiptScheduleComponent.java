package com.fiserv.qabrazil.pages.home;

import com.fiserv.automation.api.util.DateUtil;
import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.util.Identifier;
import com.fiserv.qabrazil.util.RegexUtil;
import com.microsoft.playwright.Locator;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.regex.Pattern;

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

    public void containsDates() {
        Locator mondayDay = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Dia Segunda").testId());
        Locator tuesdayDay = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Dia Terça").testId());
        Locator wednesdayDay = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Dia Quarta").testId());
        Locator thursdayDay = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Dia Quinta").testId());
        Locator fridayDay = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Dia Sexta").testId());

        assertThat(mondayDay).containsText(DateUtil.day(monday));
        assertThat(tuesdayDay).containsText(DateUtil.day(tuesday));
        assertThat(wednesdayDay).containsText(DateUtil.day(wednesday));
        assertThat(thursdayDay).containsText(DateUtil.day(thursday));
        assertThat(fridayDay).containsText(DateUtil.day(friday));
    }

    public void containsMonths() {
        Locator mondayMonth = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Mês Segunda").testId());
        Locator tuesdayMonth = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Mês Terça").testId());
        Locator wednesdayMonth = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Mês Quarta").testId());
        Locator thursdayMonth = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Mês Quinta").testId());
        Locator fridayMonth = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Mês Sexta").testId());

        assertThat(mondayMonth).containsText(DateUtil.month(monday));
        assertThat(tuesdayMonth).containsText(DateUtil.month(tuesday));
        assertThat(wednesdayMonth).containsText(DateUtil.month(wednesday));
        assertThat(thursdayMonth).containsText(DateUtil.month(thursday));
        assertThat(fridayMonth).containsText(DateUtil.month(friday));
    }

    public void containsWeekDates() {
        Locator mondayWeekday = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Dia da semana Segunda").testId());
        Locator tuesdayWeekday = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Dia da semana Terça").testId());
        Locator wednesdayWeekday = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Dia da semana Quarta").testId());
        Locator thursdayWeekday = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Dia da semana Quinta").testId());
        Locator fridayWeekday = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Dia da semana Sexta").testId());

        assertThat(mondayWeekday).containsText(DateUtil.weekday(DayOfWeek.MONDAY));
        assertThat(tuesdayWeekday).containsText(DateUtil.weekday(DayOfWeek.TUESDAY));
        assertThat(wednesdayWeekday).containsText(DateUtil.weekday(DayOfWeek.WEDNESDAY));
        assertThat(thursdayWeekday).containsText(DateUtil.weekday(DayOfWeek.THURSDAY));
        assertThat(fridayWeekday).containsText(DateUtil.weekday(DayOfWeek.FRIDAY));
    }

    public void containsNetValues() {
        Locator mondayNetValue = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Valor Segunda").testId());
        Locator tuesdayNetValue = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Valor Terça").testId());
        Locator wednesdayNetValue = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Valor Quarta").testId());
        Locator thursdayNetValue = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Valor Quinta").testId());
        Locator fridayNetValue = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Valor Sexta").testId());

        assertThat(mondayNetValue).containsText(netValue());
        assertThat(tuesdayNetValue).containsText(netValue());
        assertThat(wednesdayNetValue).containsText(netValue());
        assertThat(thursdayNetValue).containsText(netValue());
        assertThat(fridayNetValue).containsText(netValue());
    }

    public void containsNumberOfDeposits() {
        Locator mondayDeposits = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Qtd Depósitos Segunda").testId());
        Locator tuesdayDeposits = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Qtd Depósitos Terça").testId());
        Locator wednesdayDeposits = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Qtd Depósitos Quarta").testId());
        Locator thursdayDeposits = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Qtd Depósitos Quinta").testId());
        Locator fridayDeposits = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Qtd Depósitos Sexta").testId());

        assertNumberOfDeposits(monday, mondayDeposits);
        assertNumberOfDeposits(tuesday, tuesdayDeposits);
        assertNumberOfDeposits(wednesday, wednesdayDeposits);
        assertNumberOfDeposits(thursday, thursdayDeposits);
        assertNumberOfDeposits(friday, fridayDeposits);
    }

    private void assertNumberOfDeposits(LocalDate date, Locator mondayDeposits) {
        if (!date.isAfter(today)) {
            assertThat(mondayDeposits).containsText(numberOfDeposits());
        } else {
            assertThat(mondayDeposits).hasCount(0);
        }
    }

    public void containsHighlightedInformation() {
        assumeThat(DateUtil.isWeekend(today))
                .withFailMessage("Today is weekend.")
                .isFalse();

        Pattern orangeClass = Pattern.compile(contractConfig.getPrimaryCssClass());
        Pattern grayClass = Pattern.compile("cor-cinza-claro");
        Pattern greenColor = Pattern.compile(RegexUtil.escape("color: rgb(88, 207, 33)"));
        Pattern grayColor = Pattern.compile(RegexUtil.escape("color: rgb(156, 156, 156)"));

        for (LocalDate date : new LocalDate[] { monday, tuesday, wednesday, thursday, friday }) {
            String dayOfWeek = DateUtil.shortWeekday(date.getDayOfWeek());

            Locator weekday = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Dia da semana " + dayOfWeek).testId());
            Locator netValue = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Valor " + dayOfWeek).testId());
            Locator deposits = page.getByTestId(Identifier.from("Home - Agenda Recebimento - Qtd Depósitos " + dayOfWeek).testId());

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
        Locator locator = page.locator("#CtnAgendaRecebimentosSemana2").getByText("Ver recebimentos detalhado");
        assertThat(locator).isVisible();
        assertThat(locator).containsText("Ver recebimentos detalhado");
    }

    private static Pattern netValue() {
        return Pattern.compile("R\\$[\\d.]+,\\d\\d");
    }

    private static Pattern numberOfDeposits() {
        return Pattern.compile("\\d+ depositos");
    }
}
