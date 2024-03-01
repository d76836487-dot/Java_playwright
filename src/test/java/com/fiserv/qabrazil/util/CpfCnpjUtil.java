package com.fiserv.qabrazil.util;

import javax.swing.text.MaskFormatter;
import java.text.ParseException;

public class CpfCnpjUtil {
    public static String formatCpfCnpj(String input) throws ParseException {
        String cleanedInput = input.replaceAll("\\D", "");

        String mask = getCpfOrCnpjMask(cleanedInput);

        MaskFormatter formatter = new MaskFormatter(mask);
        formatter.setValueContainsLiteralCharacters(false);
        return formatter.valueToString(cleanedInput);
    }

    private static String getCpfOrCnpjMask(String cleanedInput) {
        if (cleanedInput.length() == 11) {
            return "###.###.###-##";
        } else if (cleanedInput.length() == 14) {
            return "##.###.###/####-##";
        } else {
            throw new RuntimeException("Invalid input for %s: must be either 11 or 14 digits.".formatted(cleanedInput));
        }
    }

    public static void main(String[] args) throws ParseException {
        String inputCpf = "12345678901"; // Example CPF
        String inputCnpj = "12345678000199"; // Example CNPJ

        System.out.println("Formatted CPF: " + formatCpfCnpj(inputCpf));
        System.out.println("Formatted CNPJ: " + formatCpfCnpj(inputCnpj));
    }

}
