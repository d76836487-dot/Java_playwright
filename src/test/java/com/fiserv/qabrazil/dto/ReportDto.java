package com.fiserv.qabrazil.dto;

import java.util.Objects;

public class ReportDto {
    private String name;
    private String document;
    private String reportType;
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

    public String getReportType() {
        return reportType;
    }

    public ReportDto setReportType(String reportType) {
        this.reportType = reportType;
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

    public static ReportDto from(GenerateReportDto dto, String alianceName, String requestedIn) {
        return new ReportDto()
                .setName(formatName(dto, alianceName))
                .setDocument(ecFromGenerateReportDto(dto))
                .setRange(dto.getRangeDate())
                .setRequestedIn(requestedIn)
                .setReportType(dto.getType());
    }

    private static String ecFromGenerateReportDto(GenerateReportDto dto) {
        return dto.getEc().split(" ")[0];
    }

    private static String formatName(GenerateReportDto dto, String alianceName) {
        return String.format("%s_%s_%s%s",
                alianceName,
                dto.getType(),
                formatDate(dto.getRangeDate()),
                formatFiletype(dto));

    }

    private static Object formatFiletype(GenerateReportDto dto) {
        String type = dto.getFiletype().split(" ")[0];
        return type.toLowerCase();
    }

    private static String formatDate(String date) {
        String[] dates = date.split(" ");
        String from = dates[0].replaceAll("/", "-");
        String to = dates[0].replaceAll("/", "-");
        return from + "_" + to;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReportDto reportDto = (ReportDto) o;
        return Objects.equals(name, reportDto.name)
                && Objects.equals(document, reportDto.document)
                && Objects.equals(reportType, reportDto.reportType)
                && Objects.equals(requestedIn, reportDto.requestedIn)
                && Objects.equals(range, reportDto.range);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, document, reportType, requestedIn, range);
    }

    @Override
    public String toString() {
        return "ReportDto{" +
                "name='" + name + '\'' +
                ", document='" + document + '\'' +
                ", reportType='" + reportType + '\'' +
                ", requestedIn='" + requestedIn + '\'' +
                ", range='" + range + '\'' +
                '}';
    }
}
