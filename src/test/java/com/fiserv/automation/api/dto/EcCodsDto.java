package com.fiserv.automation.api.dto;

public class EcCodsDto {
    public String ec;

    public String status;
    public String statusCode;
    public String document;
    public String hierarchy;
    public String nomeFantasia;

    public String concatEcAndName() {
        return "%s - %s".formatted(ec, nomeFantasia);
    }

    public String getEc() {
        return ec;
    }

    public String getStatus() {
        return status;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public String getDocument() {
        return document;
    }

    public String getHierarchy() {
        return hierarchy;
    }

    public String getNomeFantasia() {
        return nomeFantasia;
    }

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
