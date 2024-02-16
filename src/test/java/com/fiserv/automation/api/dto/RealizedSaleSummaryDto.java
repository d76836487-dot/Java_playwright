package com.fiserv.automation.api.dto;

import java.math.BigDecimal;

public class RealizedSaleSummaryDto {
    public String numeroMerchant;
    public String data;
    public BigDecimal valorTotalCancelamento;
    public BigDecimal valorTotalPlano;
    public BigDecimal valorTotalLiquidoPlano;
    public BigDecimal valorTotalDesconto;
    public int quantidade;
    public int quantidadeCancelamento;

    public String getData() {
        return data;
    }

    public double getValorTotalPlano() {
        return valorTotalPlano.doubleValue();
    }
}
