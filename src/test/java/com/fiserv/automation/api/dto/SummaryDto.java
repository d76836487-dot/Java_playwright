package com.fiserv.automation.api.dto;

import java.math.BigDecimal;

public class SummaryDto {
    public String estabelecimento;
    public String tipoSumarizacao;
    public String quantidade;
    public BigDecimal sumarizacao;
    public String sumarizacaoConfirmado;

    public double getSumarizacao() {
        return sumarizacao.doubleValue();
    }

    @Override
    public String toString() {
        return "SummaryDto{" +
                "estabelecimento='" + estabelecimento + '\'' +
                ", tipoSumarizacao='" + tipoSumarizacao + '\'' +
                ", quantidade='" + quantidade + '\'' +
                ", sumarizacao='" + sumarizacao + '\'' +
                ", sumarizacaoConfirmado='" + sumarizacaoConfirmado + '\'' +
                '}';
    }
}
