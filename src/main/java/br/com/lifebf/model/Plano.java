package br.com.lifebf.model;

public class Plano {
    private int id_plano;
    private String nomePlano;
    private double precoPlano;
    private int quantidadeMembros;

    public Plano(int id_plano,String nomePlano, double precoPlano, int quantidadeMembros) {
        this.id_plano = id_plano;
        this.nomePlano = nomePlano;
        this.precoPlano = precoPlano;
        this.quantidadeMembros = quantidadeMembros;
    }
    public Plano(){

    };

    public int getid_plano() {
        return id_plano;
    }

    public void setid_plano(int id_plano) {
        this.id_plano = this.id_plano;
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
