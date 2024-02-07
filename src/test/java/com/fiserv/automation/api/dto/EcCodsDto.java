package com.fiserv.automation.api.dto;

public class EcCodsDto {
    public String ec;

    public String status;
    public String statusCode;
    public String document;
    public String hierarchy;
    public String nomeFantasia;

    @Override
    public String toString() {
        return "EcCods{" +
                "ec='" + ec + '\'' +
                ", status='" + status + '\'' +
                ", statusCode='" + statusCode + '\'' +
                ", document='" + document + '\'' +
                ", hierarchy='" + hierarchy + '\'' +
                ", nomeFantasia='" + nomeFantasia + '\'' +
                '}';
    }
}
