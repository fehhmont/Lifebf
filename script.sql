create database lifebf;
use lifebf;
CREATE TABLE plano (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(200) NOT NULL,
    preco_plano DECIMAL(5,2) NOT NULL,
    quantidade_membros INT NOT NULL,
    quantidade_endereco INT NOT NULL,
    quantidade_hospitais INT NOT NULL
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(120) NOT NULL,
    cpf VARCHAR(13) NOT NULL UNIQUE,
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

use lifebf;
select * from membro;
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




INSERT INTO plano (nome_plano, preco_plano, quantidade_membros,quantidade_endereco ,quantidade_hospitais)
VALUES ('Plano Básico', 0, 1, 2,2);

INSERT INTO plano (nome_plano, preco_plano, quantidade_membros,quantidade_endereco ,quantidade_hospitais)
VALUES ('Plano Família', 129.90, 4,4,4);

INSERT INTO plano (nome_plano, preco_plano, quantidade_membros,quantidade_endereco,quantidade_hospitais)
VALUES ('Plano Empresarial', 299.90, 10, 4,4);



CREATE TABLE membro_hospital (
    id_membro_hospital INT AUTO_INCREMENT PRIMARY KEY,
    id_membro INT,
    id_hospital INT,
    FOREIGN KEY (id_membro) REFERENCES membro(id_membro),
    FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital)
);

INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado) VALUES
("admin", "admin@admin.com", "12345678", "admin", "Unimed", "01001-000", "Avenida Paulista", "1000", "Bela Vista", "São Paulo", "SP");

INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado, id_plano) VALUES
("Carlos Silva", "carlos.silva@email.com", "12345678901", "senha123", "Unimed", "01001-000", "Avenida Paulista", "1000", "Bela Vista", "São Paulo", "SP", 1);

INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado, id_plano) VALUES
("Ana Souza", "ana.souza@email.com", "98765432100", "senha456", "Amil", "20031-007", "Rua do Ouvidor", "250", "Centro", "Rio de Janeiro", "RJ", 3);

INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado) VALUES
("João Pereira", "joao.pereira@email.com", "32165498702", "segura789", "Bradesco Saúde", "30110-000", "Avenida Afonso Pena", "500", "Centro", "Belo Horizonte", "MG");

INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado) VALUES
("Mariana Costa", "mariana.costa@email.com", "74185296301", "mariana@321", "SulAmérica", "40020-002", "Rua Chile", "80", "Centro", "Salvador", "BA");

INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado) VALUES
("Fernando Oliveira", "fernando.oliveira@email.com", "15935748602", "pass123", "Golden Cross", "80010-000", "Rua XV de Novembro", "300", "Centro", "Curitiba", "PR");

use lifebf;
select * from hospital;
select * from membro_hospital;
select * from cliente;
INSERT INTO membro (nome, descricao, id_cliente) VALUES
("Felipe", "Descrição 1", 1),
("Felipe2", "Descrição 2", 1),
("Felipe2", "Descrição 2", 2),
("Felipe3", "Descrição 3", 3),
("Felipe4", "Descrição 4", 4),
("Felipe5", "Descrição 5", 5);




INSERT INTO hospital (nome, cep, rua, numero, bairro, estado, latitude, longitude) VALUES
("Hospital Municipal", "06278-080", "Rua Arthur", "2", "Mutinga", "Osasco", -23.5703026, -46.6967364),
("Hospital Santa Casa", "01310-000", "Rua Doutor Cesário Mota Júnior", "112", "Vila Buarque", "São Paulo", -23.550057, -46.640062),
("Hospital Albert Einstein", "05652-900", "Avenida Albert Einstein", "627", "Morumbi", "São Paulo", -23.621291, -46.695844),
("Hospital Sírio-Libanês", "01308-050", "Rua Dona Adma Jafet", "91", "Bela Vista", "São Paulo", -23.559129, -46.661544),
("Hospital das Clínicas", "05403-000", "Avenida Doutor Enéas de Carvalho Aguiar", "255", "Cerqueira César", "São Paulo", -23.560667, -46.690158),
("Hospital São Lucas", "09090-000", "Rua São João", "45", "Centro", "Santo André", -23.657285, -46.529991),
("Hospital Nossa Senhora das Graças", "80050-340", "Rua General Carneiro", "181", "Centro", "Curitiba", -25.428690, -49.269830),
("Hospital Moinhos de Vento", "90560-030", "Rua Ramiro Barcelos", "910", "Moinhos de Vento", "Porto Alegre", -30.037315, -51.211124),
("Hospital Universitário", "50670-901", "Av. Professor Moraes Rego", "1235", "Cidade Universitária", "Recife", -8.061919, -34.938412),
("Hospital São Francisco", "29100-160", "Rua São Francisco", "50", "Centro", "Vila Velha", -20.319265, -40.296571),
("Hospital Infantil", "70040-000", "Avenida das Nações", "0", "Zona Cívico-Administrativa", "Brasília", -15.780147, -47.929265),
("Hospital Mater Dei", "30140-083", "Rua Gonçalves Dias", "2700", "Santo Agostinho", "Belo Horizonte", -19.930358, -43.937360),
("Hospital São Vicente", "80020-010", "Rua José Loureiro", "100", "Centro", "Curitiba", -25.430358, -49.271362),
("Hospital João XXIII", "30550-360", "Avenida Professor Alfredo Balena", "400", "Santa Efigênia", "Belo Horizonte", -19.931175, -43.937713),
("Hospital Regional", "57072-005", "Rua Cônego Machado", "100", "Farol", "Maceió", -9.657252, -35.747688);


INSERT INTO membro_hospital (id_membro, id_hospital) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6),
(2, 7),
(2, 7),
(3, 8),
(4, 9),
(5, 10),
(1, 11),
(2, 12),
(3, 13),
(4, 14),
(5, 15);


select * from cliente c
inner join plano p on c.id_plano = p.id_plano;

USE LIFEBF;
SELECT h.id_hospital, h.nome, h.cep, h.rua, h.numero, h.bairro, h.estado, m.id_membro, h.latitude, h.longitude
                    FROM hospital h
                    JOIN membro_hospital mh ON h.id_hospital = mh.id_hospital
                    JOIN membro m ON mh.id_membro = m.id_membro
				WHERE m.id_membro = 2;

 use lifebf;
select m.id_membro, m.nome, m.descricao, m.id_cliente
	from membro m
    join cliente c on m.id_cliente = c.id_cliente
    where c.id_cliente =1;
   USE lifebf;

select * from cliente;
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