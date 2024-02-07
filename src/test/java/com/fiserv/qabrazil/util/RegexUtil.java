package com.fiserv.qabrazil.util;

public class RegexUtil {

    public static String escape(String text) {
        return text.replaceAll("[-\\[\\]{}()*+?.,^$|#]", "\\\\$0");
    }
}
