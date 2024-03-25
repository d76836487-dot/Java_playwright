package com.fiserv.automation.api.dto;

import java.time.LocalDateTime;
import java.util.Objects;

import static com.fiserv.automation.api.util.DateUtil.convertToDateTimeFromApi;

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

    public LocalDateTime getDataHora() {
        return convertToDateTimeFromApi(data + hora);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof AuthorizationsDto that)) return false;
        return Objects.equals(tipoAutorizacao, that.tipoAutorizacao)
                && Objects.equals(data, that.data)
                && isEqualsTime(that)
                && Objects.equals(valorTransacao, that.valorTransacao);
    }

    private boolean isEqualsTime(AuthorizationsDto that) {
        if (hora.length() == that.hora.length()) return Objects.equals(hora, that.hora);

        return Objects.equals(hora.substring(0, 4), that.hora.substring(0, 4));
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
