package com.fiserv.qabrazil.components;

import com.fiserv.automation.framework.annotations.ScenarioComponent;
import com.fiserv.qabrazil.pages.BasePage;
import com.fiserv.qabrazil.pages.PageField;
import com.microsoft.playwright.Page;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.Calendar;

import static com.fiserv.qabrazil.util.WaitUtil.sleep;

@ScenarioComponent
public class DateRangerPage extends BasePage {
    @Autowired
    Page page;

    public void userSelectsYesterday() {
        bandaidSMP57();
        pageField.from("Date ranger - Image").click();
        pageField.from("Date ranger - Ontem").click();
    }

    public void userSelectsThisMonth() {
        bandaidSMP57();
        pageField.from("Date ranger - Image").click();
        pageField.from("Date ranger - Mês Atual").click();
    }

    public void userSelectsLastSevenDays() {
        bandaidSMP57();
        pageField.from("Date ranger - Image").click();
        pageField.from("Date ranger - Últimos 7 dias").click();
    }

    public void userSelectsLastFourteenDays() {
        bandaidSMP57();
        pageField.from("Date ranger - Image").click();
        pageField.from("Date ranger - Últimos 14 dias").click();
    }

    public void userSelectsLastThirdDays() {
        setDateInCalendar(-30, "Date ranger - Dia inicial Digitado");
    }

    public void userSelectsNextFourteenDays() {
        setDateInCalendar(0, "Date ranger - Dia inicial Digitado");
        setDateInCalendar(14, "Date ranger - Dia final Digitado");
    }

    public void userSelectsNextThirdDays() {
        setDateInCalendar(30, "Date ranger - Dia final Digitado");
    }

    public void userSelectsSpecificDay(String dateToType) {
        bandaidSMP57();
        pageField.from("Date ranger - Image").click();
        typeDayInCalendar("Date ranger - Dia inicial Digitado", dateToType);
        typeDayInCalendar("Date ranger - Dia final Digitado", dateToType);
        pageField.from("Date ranger - Aplicar").click();

        sleep(Duration.ofSeconds(2));
    }

    private void setDateInCalendar(int daysToAdd, String typedDateField) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, daysToAdd);
        SimpleDateFormat simpleFormat = new SimpleDateFormat("dMyyyy");
        String thirdDaysAgo = simpleFormat.format(cal.getTime());

        pageField.from("Date ranger - Image").click();
        typeDayInCalendar(typedDateField, thirdDaysAgo);
        pageField.from("Date ranger - Aplicar").click();
    }

    private void typeDayInCalendar(String typedDateField, String date) {
        PageField inputInitialDate = pageField.from(typedDateField);
        inputInitialDate.click();
        inputInitialDate.getLocator().clear();
        page.keyboard().press("ArrowLeft");
        page.keyboard().press("ArrowLeft");
        inputInitialDate.pressSequentially(date);
    }

    private void bandaidSMP57() {
        // TODO: remove after SMP-57 has been closed
        sleep(Duration.ofSeconds(2));
        page.mouse().wheel(0, 180);
    }
}
