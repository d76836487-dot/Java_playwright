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
}
