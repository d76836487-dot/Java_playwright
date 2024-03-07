package com.fiserv.qabrazil.dto;

public class GenerateReportDto {
    private String ec;
    private String type;
    private String rangeDate;
    private String filetype;

    public String getEc() {
        return ec;
    }

    public GenerateReportDto setEc(String ec) {
        this.ec = ec;
        return this;
    }

    public String getType() {
        return type;
    }

    public GenerateReportDto setType(String type) {
        this.type = type;
        return this;
    }

    public String getRangeDate() {
        return rangeDate;
    }

    public GenerateReportDto setRangeDate(String rangeDate) {
        this.rangeDate = rangeDate;
        return this;
    }

    public String getFiletype() {
        return filetype;
    }

    public GenerateReportDto setFiletype(String filetype) {
        this.filetype = filetype;
        return this;
    }
}
