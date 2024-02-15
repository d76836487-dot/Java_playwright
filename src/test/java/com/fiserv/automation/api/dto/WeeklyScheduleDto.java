package com.fiserv.automation.api.dto;

public class WeeklyScheduleDto {
    public String monthDay;
    public String month;
    public String weekday;
    public double values;
    public int occurrences;

    public WeeklyScheduleDto(String monthDay, String month, String weekday, double values, int occurrences) {
        this.monthDay = monthDay;
        this.month = month;
        this.weekday = weekday;
        this.values = values;
        this.occurrences = occurrences;
    }

    public double getValues() {
        return values;
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
                ", values=" + values +
                ", occurences=" + occurrences +
                '}';
    }
}
