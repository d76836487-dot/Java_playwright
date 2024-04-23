package com.fiserv.qabrazil.consistency;

import java.util.HashMap;
import java.util.Map;

public class SavedInfoForConsistency {
    public String date;
    public Map<String, String> values;

    public SavedInfoForConsistency(String weekday) {
        this.date = weekday;
        values = new HashMap<>();
    }

    public static SavedInfoForConsistency buildNull(String weekday) {
        return new SavedInfoForConsistency(weekday);
    }

    @Override
    public String toString() {
        return "AnyDayInfo{" +
                "date='" + date + '\'' +
                ", values=" + values +
                '}';
    }
}
