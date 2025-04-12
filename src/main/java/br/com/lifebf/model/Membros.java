package br.com.lifebf.model;

public class Membros {
    private int id_membro;
    private String nome;
    private  String descricao;
    private int id_cliente;

    public Membros(int id_membro, String nome, String descricao, int id_cliente) {
        this.id_membro = id_membro;
        this.nome = nome;
        this.descricao = descricao;
        this.id_cliente = id_cliente;
    }
    public Membros(){}
    public int getId_membro() {
        return id_membro;
    }

    public void setId_membro(int id_membro) {
        this.id_membro = id_membro;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }
}
