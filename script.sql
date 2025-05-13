drop database lifebf;
CREATE DATABASE  lifebf;
USE lifebf;

CREATE TABLE plano (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(200) NOT NULL,
    preco_plano DECIMAL(5,2) NOT NULL,
    quantidade_membros INT NOT NULL,
    quantidade_endereco INT NOT NULL
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(120) NOT NULL unique,
    cpf VARCHAR(20) NOT NULL ,
    senha VARCHAR(100) NOT NULL,
    plano_saude VARCHAR(20) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(40) NOT NULL,
    id_plano INT,
    foreign key(id_plano) references  plano(id_plano)
);

CREATE TABLE membro (
    id_membro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE hospital (
    id_hospital INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cep VARCHAR(11) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    latitude DECIMAL(10, 6) NOT NULL,
    longitude DECIMAL(10, 6) NOT NULL
);

INSERT INTO plano (nome_plano, preco_plano, quantidade_membros, quantidade_endereco)
VALUES ('Plano Básico', 0, 1, 5);

INSERT INTO plano (nome_plano, preco_plano, quantidade_membros, quantidade_endereco)
VALUES ('Plano Família', 7.99, 4, 10);

INSERT INTO plano (nome_plano, preco_plano, quantidade_membros,quantidade_endereco)
VALUES ('Plano Empresarial', 29.99, 10, 40);



CREATE TABLE membro_hospital (
    id_membro_hospital INT AUTO_INCREMENT PRIMARY KEY,
    id_membro INT,
    id_hospital INT,
    FOREIGN KEY (id_membro) REFERENCES membro(id_membro),
    FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital)
);







select * from cliente
inner join plano p on c.id_plano = p.id_plano;


SELECT  count(m.id_membro)
                    FROM hospital h
                    JOIN membro_hospital mh ON h.id_hospital = mh.id_hospital
                    JOIN membro m ON mh.id_membro = m.id_membro
                    join cliente on m.id_cliente = cliente.id_cliente
				WHERE cliente.id_cliente = 1;

 use lifebf;
select m.id_membro, m.nome, m.descricao, m.id_cliente
	from membro m
    join cliente c on m.id_cliente = c.id_cliente
    where c.id_cliente =1;
   USE lifebf;


    SELECT `cliente`.`id_cliente`,
    `cliente`.`nome`,
    `cliente`.`email`,
    `cliente`.`cpf`,
    `cliente`.`senha`,
    `cliente`.`plano_saude`,
    `cliente`.`cep`,
    `cliente`.`rua`,
    `cliente`.`numero`,
    `cliente`.`bairro`,
    `cliente`.`cidade`,
    `cliente`.`estado`
FROM `lifebf`.`cliente`;
