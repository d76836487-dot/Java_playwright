package com.fiserv.automation.api.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateUtil {
    public static String formattedDate(int daysAgo) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, daysAgo * -1);
        SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyyMMdd");
        return simpleFormat.format(cal.getTime());
    }

    public static String convertDateFromPageToDateApi(String dateFromPage) {
        return dateFromPage.substring(6, 10) + dateFromPage.substring(3, 5) + dateFromPage.substring(0, 2);
    }

    public static String convertTimeFromPageToDateApi(String timeFromPage) {
        return timeFromPage.substring(4, 6) + timeFromPage.substring(7, 9);
    }
}
