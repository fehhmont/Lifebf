package br.com.lifebf.model;

public class Plano {
    private int id;
    private String nome_plano;
    private double preco_plano;
    private int quantidade_membros;

    public Plano(String nome_plano, double preco_plano, int quantidade_membros) {
        this.nome_plano = nome_plano;
        this.preco_plano = preco_plano;
        this.quantidade_membros = quantidade_membros;
    }
    public Plano(){

    };

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome_plano() {
        return nome_plano;
    }

    public void setNome_plano(String nome_plano) {
        this.nome_plano = nome_plano;
    }

    public double getPreco_plano() {
        return preco_plano;
    }

    public void setPreco_plano(double preco_plano) {
        this.preco_plano = preco_plano;
    }

    public int getQuantidade_membros() {
        return quantidade_membros;
    }

    public void setQuantidade_membros(int quantidade_membros) {
        this.quantidade_membros = quantidade_membros;
    }
}
