package br.com.lifebf.model;

public class Cliente {
    private int id_cliente;
    private String nome;
    private String email;
    private String cpf;
    private String senha;
    private String planoSaude;
    private String cep;
    private String rua;
    private String numero;
    private String bairro;
    private String cidade;
    private int id_plano;
    private String nome_plano;


    private String estado;

    // Construtor padrão
    public Cliente(){}
    // Construtor com parâmetros
    public Cliente(int id_cliente,String nome, String email, String cpf, String senha, String planoSaude, String cep, String rua, String numero, String bairro, String cidade, String estado, int id_plano, String nome_plano) {
        this.id_cliente = id_cliente;
        this.nome = nome;
        this.email = email;
        this.cpf = cpf;
        this.senha = senha;
        this.planoSaude = planoSaude;
        this.cep = cep;
        this.rua = rua;
        this.numero = numero;
        this.bairro = bairro;
        this.cidade = cidade;
        this.estado = estado;
        this.id_plano = id_plano;
        this.nome_plano = nome_plano;
    }
    public Cliente(String email, String senha){
        this.email = email;
        this.senha = senha;
    }

    public Cliente(String nome, String email, String senha){
        this.nome = nome;
        this.email =email;
        this.senha = senha;
    }
    // Getters e Setters

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getPlanoSaude() {
        return planoSaude;
    }

    public void setPlanoSaude(String planoSaude) {
        this.planoSaude = planoSaude;
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

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getId_plano() { return id_plano;}

    public void setId_plano(int id_plano) { this.id_plano = id_plano;}

    public String getNome_plano() {return nome_plano;}

    public void setNome_plano(String nome_plano) {this.nome_plano = nome_plano;}


}