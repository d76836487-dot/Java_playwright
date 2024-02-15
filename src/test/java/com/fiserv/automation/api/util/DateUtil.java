package com.fiserv.automation.api.util;

import com.fiserv.qabrazil.config.ContractConfig;
import jakarta.annotation.PostConstruct;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Calendar;
import java.util.Locale;

@Component
public class DateUtil {
    private static Locale locale;

    private static final LocalDate today = LocalDate.now();

    @Autowired
    protected ContractConfig contractConfig;

    @PostConstruct
    public void init() {
        locale = Locale.forLanguageTag(contractConfig.getLocale());
    }

    public static String formattedDate(int daysToAdd) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, daysToAdd);
        SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyyMMdd");
        return simpleFormat.format(cal.getTime());
    }

    public static String convertDateFromPageToDateApi(String dateFromPage) {
        return dateFromPage.substring(6, 10) + dateFromPage.substring(3, 5) + dateFromPage.substring(0, 2);
    }

    public static String convertTimeFromPageToDateApi(String timeFromPage) {
        return timeFromPage.substring(4, 6) + timeFromPage.substring(7, 9);
    }

    public static LocalDate convertDateFromPageToLocale(String dateFromPage) {
        return LocalDate.parse(dateFromPage, DateTimeFormatter.ofPattern("yyyyMMdd"));
    }

    public static String day(LocalDate date) {
        return date.format(DateTimeFormatter.ofPattern("dd", locale));
    }

    public static String weekday(DayOfWeek dayOfWeek) {
        return today.getDayOfWeek().equals(dayOfWeek) ? "Hoje" : StringUtils.capitalize(dayOfWeek.getDisplayName(TextStyle.FULL, locale));
    }

    public static String month(LocalDate date) {
        String monthName = date.getMonth().getDisplayName(TextStyle.FULL, locale);
        return StringUtils.capitalize(monthName).substring(0, 3);
    }

    public static String[] dateAndMonth(LocalDate date) {
        return new String[] {day(date), month(date)};
    }
}
