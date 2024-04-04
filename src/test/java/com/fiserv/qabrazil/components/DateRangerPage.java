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
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, -30);
        SimpleDateFormat simpleFormat = new SimpleDateFormat("dMyyyy");
        String thirdDaysAgo = simpleFormat.format(cal.getTime());

        pageField.from("Date ranger - Image").click();
        PageField inputInitialDate = pageField.from("Date ranger - Dia inicial Digitado");
        inputInitialDate.click();
        inputInitialDate.getLocator().clear();
        page.keyboard().press("ArrowLeft");
        page.keyboard().press("ArrowLeft");
        inputInitialDate.pressSequentially(thirdDaysAgo);
        pageField.from("Date ranger - Aplicar").click();
    }

    private void bandaidSMP57() {
        // TODO: remove after SMP-57 has been closed
        sleep(Duration.ofSeconds(2));
        page.mouse().wheel(0, 180);
    }
}
