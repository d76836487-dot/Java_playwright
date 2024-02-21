package com.fiserv.qabrazil.dto;

import com.fiserv.automation.api.dto.SaleAuthorizationDto;
import com.fiserv.automation.api.dto.SalesDto;
import com.fiserv.automation.api.util.DateUtil;

import java.time.LocalDateTime;

public class SalesDtoPage {
    int index;
    public LocalDateTime dateTime;
    public String product;
    public String installments;
    public String channel;
    public String terminal;
    public String status;
    public String ec;
    double grossValue;

    public SalesDtoPage(int index, LocalDateTime dateTime, String product, String installments, String channel, String terminal, String status, String ec, double grossValue) {
        this.index = index;
        this.dateTime = dateTime;
        this.product = product;
        this.installments = installments;
        this.channel = channel;
        this.terminal = terminal;
        this.status = status;
        this.ec = ec;
        this.grossValue = grossValue;
    }

    public boolean compareToDtoApi(SaleAuthorizationDto receivedDto) {
        return dateTime.equals(receivedDto.getDataHora())
                && Math.abs(grossValue - receivedDto.getValorTotalPlano().doubleValue()) < 0.01;
    }

    @Override
    public String toString() {
        return "SalesDtoPage{" +
                "dateTime='" + dateTime + '\'' +
                ", product='" + product + '\'' +
                ", installments='" + installments + '\'' +
                ", channel='" + channel + '\'' +
                ", terminal='" + terminal + '\'' +
                ", status='" + status + '\'' +
                ", ec='" + ec + '\'' +
                ", grossValue=" + grossValue +
                '}';
    }
}
