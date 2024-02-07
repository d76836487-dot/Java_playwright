package com.fiserv.automation.api.dto;

import java.util.Objects;

public class AuthorizationsDto {
    public String codAutorizacao;
    public String codTipoAutorizacao;
    public String quantParcelas;
    public String tipoAutorizacao;
    public String comprovante;
    public String tipoCanal;
    public String estabelecimento;

    public String data;
    public String hora;
    public String dataExpiracao;
    public String dataConfirmacao;
    public String horaConfirmacao;
    public String terminal;
    public String bandeira;
    public String produto;
    public String numeroCartao;

    public String status;
    public String valorTransacao;
    public String valorConfirmado;

    public AuthorizationsDto setTipoAutorizacao(String tipoAutorizacao) {
        this.tipoAutorizacao = tipoAutorizacao;
        return this;
    }

    public AuthorizationsDto setData(String data) {
        this.data = data;
        return this;
    }

    public AuthorizationsDto setHora(String hora) {
        this.hora = hora;
        return this;
    }

    public AuthorizationsDto setValorTransacao(String valorTransacao) {
        this.valorTransacao = valorTransacao;
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof AuthorizationsDto that)) return false;
        return Objects.equals(tipoAutorizacao, that.tipoAutorizacao)
                && Objects.equals(data, that.data)
                && Objects.equals(hora, that.hora)
                && Objects.equals(valorTransacao, that.valorTransacao);
    }

    @Override
    public int hashCode() {
        return Objects.hash(tipoAutorizacao, data, hora, valorTransacao);
    }

    @Override
    public String toString() {
        return String.format("{%s\\%s\\%s\\%s}", tipoAutorizacao, data, hora, valorTransacao);
    }
}
