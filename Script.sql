CREATE DATABASE  lifebf;
USE lifebf;


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
    estado VARCHAR(40) NOT NULL
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
    rua VARCHAR(50) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    estado VARCHAR(40) NOT NULL
);


CREATE TABLE plano (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(200) NOT NULL,
    preco_plano DECIMAL(5,2) NOT NULL,
    quantidade_membros INT NOT NULL
);


CREATE TABLE membro_plano (
    id_membroplano INT AUTO_INCREMENT PRIMARY KEY,
    id_plano INT,
    id_membro INT,
    FOREIGN KEY (id_plano) REFERENCES plano(id_plano),
    FOREIGN KEY (id_membro) REFERENCES membro(id_membro)
);


CREATE TABLE membro_hospital (
    id_membro_hospital INT AUTO_INCREMENT PRIMARY KEY,
    id_membro INT,
    id_hospital INT,
    FOREIGN KEY (id_membro) REFERENCES membro(id_membro),
    FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital)
);
INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado) VALUES 
("Carlos Silva", "carlos.silva@email.com", "12345678901", "senha123", "Unimed", "01001-000", "Avenida Paulista", "1000", "Bela Vista", "São Paulo", "SP");

INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado) VALUES 
("Ana Souza", "ana.souza@email.com", "98765432100", "senha456", "Amil", "20031-007", "Rua do Ouvidor", "250", "Centro", "Rio de Janeiro", "RJ");

INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado) VALUES 
("João Pereira", "joao.pereira@email.com", "32165498702", "segura789", "Bradesco Saúde", "30110-000", "Avenida Afonso Pena", "500", "Centro", "Belo Horizonte", "MG");

INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado) VALUES 
("Mariana Costa", "mariana.costa@email.com", "74185296301", "mariana@321", "SulAmérica", "40020-002", "Rua Chile", "80", "Centro", "Salvador", "BA");

INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado) VALUES 
("Fernando Oliveira", "fernando.oliveira@email.com", "15935748602", "pass123", "Golden Cross", "80010-000", "Rua XV de Novembro", "300", "Centro", "Curitiba", "PR");



INSERT INTO membro (nome, descricao, id_cliente) VALUES 
("Felipe", "Descrição 1", 1),
("Felipe2", "Descrição 2", 2),
("Felipe3", "Descrição 3", 3),
("Felipe4", "Descrição 4", 4),
("Felipe5", "Descrição 5", 5);


INSERT INTO hospital (nome, cep, rua, numero, bairro, estado) VALUES
("Hospital Municipal", "06278-080", "Rua Arthur", "2", "Mutinga", "Osasco"),
("Hospital Santa Casa", "01310-000", "Rua Doutor Cesário Mota Júnior", "112", "Vila Buarque", "São Paulo"),
("Hospital Albert Einstein", "05652-900", "Avenida Albert Einstein", "627", "Morumbi", "São Paulo"),
("Hospital Sírio-Libanês", "01308-050", "Rua Dona Adma Jafet", "91", "Bela Vista", "São Paulo"),
("Hospital das Clínicas", "05403-000", "Avenida Doutor Enéas de Carvalho Aguiar", "255", "Cerqueira César", "São Paulo"),
("Hospital São Lucas", "09090-000", "Rua São João", "45", "Centro", "Santo André"),
("Hospital Nossa Senhora das Graças", "80050-340", "Rua General Carneiro", "181", "Centro", "Curitiba"),
("Hospital Moinhos de Vento", "90560-030", "Rua Ramiro Barcelos", "910", "Moinhos de Vento", "Porto Alegre"),
("Hospital Universitário", "50670-901", "Av. Professor Moraes Rego", "1235", "Cidade Universitária", "Recife"),
("Hospital São Francisco", "29100-160", "Rua São Francisco", "50", "Centro", "Vila Velha"),
("Hospital Infantil", "70040-000", "Avenida das Nações", "0", "Zona Cívico-Administrativa", "Brasília"),
("Hospital Mater Dei", "30140-083", "Rua Gonçalves Dias", "2700", "Santo Agostinho", "Belo Horizonte"),
("Hospital São Vicente", "80020-010", "Rua José Loureiro", "100", "Centro", "Curitiba"),
("Hospital João XXIII", "30550-360", "Avenida Professor Alfredo Balena", "400", "Santa Efigênia", "Belo Horizonte"),
("Hospital Regional", "57072-005", "Rua Cônego Machado", "100", "Farol", "Maceió");


INSERT INTO membro_hospital (id_membro, id_hospital) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10),
(1, 11),
(2, 12),
(3, 13),
(4, 14),
(5, 15);
