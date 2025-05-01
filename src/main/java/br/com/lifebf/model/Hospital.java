package br.com.lifebf.model;

import java.math.BigDecimal;

public class Hospital {
    private int idHospital;
    private String nome;
    private String cep;
    private String rua;
    private String numero;
    private String bairro;
    private String estado;
    private BigDecimal latitude;
    private BigDecimal longitude;
    private int idMembro;



    // Construtor
    public Hospital(int idHospital, String nome, String cep, String rua, String numero, String bairro, String estado, BigDecimal latitude, BigDecimal longitude, int idMembro) {
        this.idHospital = idHospital;
        this.nome = nome;
        this.cep = cep;
        this.rua = rua;
        this.numero = numero;
        this.bairro = bairro;
        this.estado = estado;
        this.latitude = latitude;
        this.longitude = longitude;
        this.idMembro = idMembro;
    }
    public Hospital(){}

    // Getters e Setters

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }


    public int getIdHospital() {
        return idHospital;
    }

    public void setIdHospital(int idHospital) {
        this.idHospital = idHospital;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdMembro() {
        return idMembro;
    }

    public void setIdMembro(int idMembro) {
        this.idMembro = idMembro;
    }
}
