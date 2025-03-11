create database lifebf;

use lifebf;

CREATE TABLE cliente(
    id_cliente int auto_increment primary key,
    nome varchar(255) not null,
    email varchar(120) not null,
    cpf varchar(13) not null unique,
    senha varchar(100) not null, 
    plano_saude varchar(20) not null,
    cep varchar(10) not null,
    rua varchar(50) not null,
    numero varchar(5) not null,
    bairro varchar(50) not null,
    cidade varchar(30) not null,
    estado varchar(40) not null
    
);

CREATE TABLE membro(
    id_membro int auto_increment primary key,
    nome varchar(255) not null,
    descricao varchar(50) not null,
    id_cliente int,
    foreign key(id_cliente) references cliente(id_cliente)
);

CREATE TABLE hospital(
    id_hospital int auto_increment primary key,
    nome varchar(255) not null, 
    cep char(8) not null,
    rua varchar(50) not null,
    numero varchar(5) not null,
    bairro varchar(50) not null,
    estado varchar(40) not null,
    id_membro int,
    foreign key(id_membro) references membro(id_membro)
);
CREATE TABLE plano(
    id_plano int auto_increment primary key,
    nome_plano varchar(200) not null,
    preco_plano decimal(5,2) not null,
    quantidade_membros int  not null
);
CREATE TABLE membro_plano(
    id_membroplano int auto_increment primary key,
    id_plano int,
    id_membro int,
    foreign key(id_plano) references plano(id_plano),
    foreign key(id_membro) references membro(id_membro)
);
