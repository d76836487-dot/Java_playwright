package com.fiserv.automation.api.dto;

public class WeeklyScheduleDto {
    public static final WeeklyScheduleDto NULL =
            new WeeklyScheduleDto("", "", "", 0, 0.0, 0);

    public String monthDay;
    public String month;
    public String weekday;
    public double grossValues;
    public double netValues;
    public int occurrences;

    public WeeklyScheduleDto(String monthDay, String month, String weekday, double values, double netValues, int occurrences) {
        this.monthDay = monthDay;
        this.month = month;
        this.weekday = weekday;
        this.grossValues = values;
        this.netValues = netValues;
        this.occurrences = occurrences;
    }

    public double getGrossValues() {
        return grossValues;
    }

    public int getOccurrences() {
        return occurrences;
    }

    @Override
    public String toString() {
        return "WeeklyScheduleDto{" +
                "monthDay='" + monthDay + '\'' +
                ", month='" + month + '\'' +
                ", weekday='" + weekday + '\'' +
                ", grossValues=" + grossValues +
                ", netValues=" + netValues +
                ", occurences=" + occurrences +
                '}';
    }
}
