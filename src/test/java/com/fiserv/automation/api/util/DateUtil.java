package com.fiserv.automation.api.util;

import com.fiserv.qabrazil.config.ContractConfig;
import jakarta.annotation.PostConstruct;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.time.temporal.TemporalAdjusters;
import java.util.Calendar;
import java.util.Locale;

@Component
public class DateUtil {
    private static Locale locale;

    private static final LocalDate today = LocalDate.now();

    @Autowired
    protected ContractConfig contractConfig;

    public static boolean isWeekend(LocalDate date) {
        DayOfWeek dayOfWeek = date.getDayOfWeek();
        return DayOfWeek.SATURDAY.equals(dayOfWeek) || DayOfWeek.SUNDAY.equals(dayOfWeek);
    }

    public static String yesterdayInFormatMonthNameAndDayAndYear() {
        return today
                .minusDays(1)
                .format(DateTimeFormatter.ofPattern("MMMM d, yyyy"));
    }

    public static LocalDate calculateLocalDate(String expectedDate) {
        return switch (expectedDate) {
            case "dia início do mês", "data início do mês" -> LocalDate.now().withDayOfMonth(1);
            case "dia final do mês", "data final do mês" -> LocalDate.now().withDayOfMonth(1)
                    .plusMonths(1)
                    .minusDays(1);
            case "dia de sete dias atrás", "data de sete dias atrás" -> LocalDate.now().minusDays(7);
            case "dia de ontem", "data de ontem" -> LocalDate.now().minusDays(1);
            case "início da semana" -> LocalDate.now().with(TemporalAdjusters.previousOrSame(DayOfWeek.SUNDAY));
            case "fim da semana" -> LocalDate.now().with(TemporalAdjusters.nextOrSame(DayOfWeek.SATURDAY));
            default -> throw new IllegalStateException("Unexpected value: " + expectedDate);
        };
    }

    @PostConstruct
    public void init() {
        locale = Locale.forLanguageTag(contractConfig.getActiveUserProfile().locale());
    }

    public static String addSubtractForWeekdays(int daysToAdd, String format) {
        Calendar cal = Calendar.getInstance();
        int subtractOrAddOneDay = daysToAdd < 0 ? -1 : 1;

        while (daysToAdd != 0) {
            cal.add(Calendar.DAY_OF_MONTH, subtractOrAddOneDay);

            if (cal.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY && cal.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY) {
                daysToAdd += (subtractOrAddOneDay * -1);
            }
        }

        SimpleDateFormat simpleFormat = new SimpleDateFormat(format);
        return simpleFormat.format(cal.getTime());
    }

    public static String formattedDate(int daysToAdd) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, daysToAdd);
        SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyyMMdd");
        return simpleFormat.format(cal.getTime());
    }
    
    public static String formattedDateAddMinute(int minutesToAdd, String dateFormat) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MINUTE, minutesToAdd);
        SimpleDateFormat simpleFormat = new SimpleDateFormat(dateFormat);
        return simpleFormat.format(cal.getTime());
    }

    public static LocalDateTime convertToDateTimeFromPage(String dateTimeFromPage) {
        String onlyNumbers = dateTimeFromPage.replaceAll("\\D", "");
        return LocalDateTime.of(Integer.parseInt(onlyNumbers.substring(4, 8)),
                Integer.parseInt(onlyNumbers.substring(2, 4)),
                Integer.parseInt(onlyNumbers.substring(0, 2)),
                Integer.parseInt(onlyNumbers.substring(8, 10)),
                Integer.parseInt(onlyNumbers.substring(10, 12)));
    }

    public static LocalDateTime convertToDateTimeFromApi(String dateTimeFromApi) {
        String onlyNumbers = dateTimeFromApi.replaceAll("\\D", "");
        return LocalDateTime.of(Integer.parseInt(onlyNumbers.substring(0, 4)),
                Integer.parseInt(onlyNumbers.substring(4, 6)),
                Integer.parseInt(onlyNumbers.substring(6, 8)),
                Integer.parseInt(onlyNumbers.substring(8, 10)),
                Integer.parseInt(onlyNumbers.substring(10, 12)));
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

    public static String year(LocalDate date) {
        return date.format(DateTimeFormatter.ofPattern("yyyy", locale));
    }

    public static String weekday(DayOfWeek dayOfWeek) {
        return today.getDayOfWeek().equals(dayOfWeek) ? "Hoje" : StringUtils.capitalize(dayOfWeek.getDisplayName(TextStyle.FULL, locale));
    }

    public static String shortWeekday(DayOfWeek dayOfWeek) {
        return StringUtils.substringBefore(StringUtils.capitalize(dayOfWeek.getDisplayName(TextStyle.FULL, locale)), "-");
    }

    public static String month(LocalDate date) {
        String monthName = date.getMonth().getDisplayName(TextStyle.FULL, locale);
        return StringUtils.capitalize(monthName).substring(0, 3);
    }

    public static String monthName(LocalDate date) {
        return date.getMonth().getDisplayName(TextStyle.FULL, locale);
    }

    public static String[] dateAndMonth(LocalDate date) {
        return new String[] {day(date), month(date)};
    }

    public static boolean isInFormat(String stringDate, String format) {
        try {
            LocalDate date = LocalDate.parse(stringDate, DateTimeFormatter.ofPattern(format));
            String formatted = date.format(DateTimeFormatter.ofPattern(format));
            return formatted.equals(stringDate);
        } catch (Exception e) {
            return false;
        }
    }

    public static LocalDate toLocalDate(String date, String format) {
        return LocalDate.parse(date, DateTimeFormatter.ofPattern(format));
    }
}
