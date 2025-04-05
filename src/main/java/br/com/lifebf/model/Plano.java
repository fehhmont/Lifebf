package br.com.lifebf.model;

public class Plano {
    private int id;
    private String nomePlano;
    private double precoPlano;
    private int quantidadeMembros;

    public Plano(String nomePlano, double precoPlano, int quantidadeMembros) {
        this.nomePlano = nomePlano;
        this.precoPlano = precoPlano;
        this.quantidadeMembros = quantidadeMembros;
    }
    public Plano(){

    };

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomePlano() {
        return nomePlano;
    }

    public void setNomePlano(String nomePlano) {
        this.nomePlano = nomePlano;
    }

    public double getPrecoPlano() {
        return precoPlano;
    }

    public void setPrecoPlano(double precoPlano) {
        this.precoPlano = precoPlano;
    }

    public int getQuantidadeMembros() {
        return quantidadeMembros;
    }

    public void setQuantidadeMembros(int quantidadeMembros) {
        this.quantidadeMembros = quantidadeMembros;
    }
}
