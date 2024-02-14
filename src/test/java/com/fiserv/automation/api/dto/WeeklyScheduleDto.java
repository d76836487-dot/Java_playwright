package com.fiserv.automation.api.dto;

public class WeeklyScheduleDto {
    public String monthDay;
    public String month;
    public String weekday;
    public double values;
    public int occurences;

    public WeeklyScheduleDto(String monthDay, String month, String weekday, double values, int occurences) {
        this.monthDay = monthDay;
        this.month = month;
        this.weekday = weekday;
        this.values = values;
        this.occurences = occurences;
    }

    public double getValues() {
        return values;
    }

    @Override
    public String toString() {
        return "WeeklyScheduleDto{" +
                "monthDay='" + monthDay + '\'' +
                ", month='" + month + '\'' +
                ", weekday='" + weekday + '\'' +
                ", values=" + values +
                ", occurences=" + occurences +
                '}';
    }
}
