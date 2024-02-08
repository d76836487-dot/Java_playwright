package com.fiserv.automation.api.dto;

public class PrepaymentMessageDto {
    public String merchantID;
    public String prepaymentIndicator;
    public String prepaymentIndicatorDesc;
    public String prepaymentEffectiveDate;
    public String reservePercent;
    public String autoPrepayRate;
    public String releasedRate;
    public String unreleasedRate;
    public PrepaymentMessageAmountDto amount;
}
