package com.fiserv.automation.api.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Objects;

public class SaleAuthorizationDto {
    public String numeroMerchant;
    public String origin;
    public String comprovante;
    public String codAutorizacao;
    public LocalDateTime dataHora;
    public BigDecimal valorTotalPlano;

    public SaleAuthorizationDto(SalesDto salesDto) {
        origin = "Sales";
        codAutorizacao = salesDto.codAutorizacao;
        dataHora = salesDto.getDataHora();
        valorTotalPlano = salesDto.valorTotalPlano;
        comprovante = salesDto.comprovante;
        numeroMerchant = salesDto.numeroMerchant;
    }

    public SaleAuthorizationDto(AuthorizationsDto authorizationsDto) {
        origin = "Authorization";
        codAutorizacao = authorizationsDto.codAutorizacao;
        dataHora = authorizationsDto.getDataHora();
        valorTotalPlano = BigDecimal.valueOf(Double.parseDouble(authorizationsDto.valorTransacao));
        comprovante = authorizationsDto.comprovante;
        numeroMerchant = authorizationsDto.estabelecimento;
    }

    public LocalDateTime getDataHora() {
        return dataHora;
    }

    public BigDecimal getValorTotalPlano() {
        return valorTotalPlano;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof SaleAuthorizationDto that)) return false;
        return Objects.equals(comprovante, that.comprovante);
    }

    @Override
    public int hashCode() {
        return Objects.hash(comprovante);
    }

    @Override
    public String toString() {
        return "SaleAuthorizationDto{" +
                "origin='" + origin + '\'' +
                ", comprovante='" + comprovante + '\'' +
                ", numeroMerchant='" + numeroMerchant + '\'' +
                ", codAutorizacao='" + codAutorizacao + '\'' +
                ", dataHora=" + dataHora +
                ", valorTotalPlano=" + valorTotalPlano +
                '}';
    }
}
