package com.fiserv.automation.api.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import static com.fiserv.automation.api.util.DateUtil.convertToDateTimeFromApi;

public class SalesDto {
    public String numeroTransacao;
    public String dataTransacao;
    public String horaTransacao;
    public String comprovante;
    public String codProdutoTransacao;
    public String descProdutoTransacao;
    public String codBandeira;
    public String descBandeira;
    public String codTipoTransacao;
    public String descTipoTransacao;
    public String numeroParcela;
    public String qtdeParcelas;
    public BigDecimal valorTotalPlano;
    public String codAutorizacao;
    public String numCartao;
    public String numTerminal;
    public String codTipoTerminal;
    public String descTipoTerminal;
    public String codTipoCartao;
    public String descTipoCartao;
    public String valorBrutoParcela;
    public String valorDescontoParcela;
    public BigDecimal valorLiquidoParcela;
    public String indicadorCredDeb;
    public String indicadorCancelVenda;
    public String numeroParcelado;
    public String numeroResumoVenda;
    public String dataPrevistaPagto;
    public String seuNumero;
    public String eciCode;
    public String cashbackAmount;
    public String reverseInterchange;
    public String valorTotalCancelamento;
    public String statusPagamento;
    public String dataEfetivaPagto;
    public String statusAntecipacao;
    public String numeroOrdemPagto;
    public String indicadorPrepago;
    public String networkToken;
    public String numeroMerchant;

    public String getDataTransacao() {
        return dataTransacao;
    }

    public String getHoraTransacaoCompactada() {
        return horaTransacao.replaceAll("\\D", "").substring(0, 4);
    }

    public LocalDateTime getDataHora() {
        return convertToDateTimeFromApi(dataTransacao + horaTransacao);
    }

    public double getValorTotalPlano() {
        return valorTotalPlano.doubleValue();
    }

    @Override
    public String toString() {
        return "SalesDto{" +
                "dataTransacao='" + dataTransacao + '\'' +
                ", horaTransacao='" + horaTransacao + '\'' +
                ", valorTotalPlano=" + valorTotalPlano +
                '}';
    }
}
