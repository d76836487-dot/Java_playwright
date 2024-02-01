package com.fiserv.qabrazil.utils;

public class RegexUtils {

    public static String escape(String text) {
        return text.replaceAll("[-\\[\\]{}()*+?.,^$|#]", "\\\\$0");
    }
}
