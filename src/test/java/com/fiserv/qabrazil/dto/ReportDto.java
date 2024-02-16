package com.fiserv.qabrazil.dto;

public class ReportDto {
    private String name;
    private String document;
    private String fileType;
    private String requestedIn;
    private String range;

    public String getName() {
        return name;
    }

    public ReportDto setName(String name) {
        this.name = name;
        return this;
    }

    public String getDocument() {
        return document;
    }

    public ReportDto setDocument(String document) {
        this.document = document;
        return this;
    }

    public String getFileType() {
        return fileType;
    }

    public ReportDto setFileType(String fileType) {
        this.fileType = fileType;
        return this;
    }

    public String getRequestedIn() {
        return requestedIn;
    }

    public ReportDto setRequestedIn(String requestedIn) {
        this.requestedIn = requestedIn;
        return this;
    }

    public String getRange() {
        return range;
    }

    public ReportDto setRange(String range) {
        this.range = range;
        return this;
    }
}
