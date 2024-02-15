package com.fiserv.automation.api.dto;

import java.math.BigDecimal;

public class PaymentSummaryDto {
    public String dataEfetivaPgto;
    public BigDecimal pagamentoLiquidoTotal;
    public String pagamentoCedidoTotal;
    public String codigoStatusPgto;
    public String descStatusPagamento;
    public String statusPagamento;
    public int quantidade;
    public String quantidadeCedido;

    public String getDataEfetivaPgto() {
        return dataEfetivaPgto;
    }

    public double getPagamentoLiquidoTotal() {
        return pagamentoLiquidoTotal.doubleValue();
    }

    public int getQuantidade() {
        return quantidade;
    }
}
