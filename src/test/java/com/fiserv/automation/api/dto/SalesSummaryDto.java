package com.fiserv.automation.api.dto;

import java.math.BigDecimal;

public class SalesSummaryDto {
    public String numeroMerchant;
    public String data;
    public BigDecimal valorBrutoParcela;
    public BigDecimal valorDescontoParcela;
    public BigDecimal valorLiquidoParcela;
    public BigDecimal valorLiquidoMedio;
    public BigDecimal valorBrutoMedio;
    public String quantidade;

    public String getData() {
        return data;
    }

    public double getValorLiquidoParcela() {
        return valorLiquidoParcela.doubleValue();
    }
}
