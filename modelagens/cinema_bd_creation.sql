CREATE DATABASE cinema;
USE cinema;

-- TABELA USUARIO
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(13) NOT NULL UNIQUE,
    data_nasc DATETIME NOT NULL,
    telefone VARCHAR(13) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- TABELA PEDIDO
CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    data_pedido DATETIME NOT NULL,
    status ENUM('PENDENTE','PAGO','CANCELADO') NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

-- TABELA PAGAMENTO
CREATE TABLE pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    forma_pagamento VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status ENUM('PENDENTE','FINALIZADO','REJEITADO','EXTORNADO') NOT NULL,
    data_pg DATETIME NOT NULL,
    id_reserva INT NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES pedido(id)
);

-- TABELA TIPO_POLTRONA
CREATE TABLE tipo_poltrona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- TABELA POLTRONA
CREATE TABLE poltrona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(3) NOT NULL,
    id_tipo_poltrona INT NOT NULL,
    FOREIGN KEY (id_tipo_poltrona) REFERENCES tipo_poltrona(id)
);

-- TABELA TIPO_INGRESSO
CREATE TABLE tipo_ingresso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

-- TABELA INGRESSO
CREATE TABLE ingresso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_poltrona INT NOT NULL,
    id_sessao INT NOT NULL,
    id_tipo_ingresso INT NOT NULL,
    id_pedido INT NOT NULL,
    CONSTRAINT uq_poltrona_sessao UNIQUE (id_poltrona, id_sessao),
    FOREIGN KEY (id_poltrona) REFERENCES poltrona(id),
    FOREIGN KEY (id_sessao) REFERENCES sessao(id),
    FOREIGN KEY (id_tipo_ingresso) REFERENCES tipo_ingresso(id),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id)
);

-- TABELA FILME
CREATE TABLE filme (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    sinopse TEXT NOT NULL,
    duracao TIME NOT NULL,
    classificacao VARCHAR(5) NOT NULL,
    poster BLOB NOT NULL
);

-- TABELA GENERO
CREATE TABLE genero (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);


-- TABELA FILME_GENERO
CREATE TABLE filme_genero (
    id_filme INT NOT NULL,
    id_genero INT NOT NULL,
    PRIMARY KEY (id_filme, id_genero),
    FOREIGN KEY (id_filme) REFERENCES filme(id),
    FOREIGN KEY (id_genero) REFERENCES genero(id)
);


-- TABELA TIPO_SESSAO
CREATE TABLE tipo_sessao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    adicional DECIMAL(3,2) NOT NULL
);


-- TABELA SESSAO
CREATE TABLE sessao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_sala INT NOT NULL,
    horario DATETIME NOT NULL,
    id_tipo INT NOT NULL,
    preco_base DECIMAL(8,2) NOT NULL,
    id_filme INT NOT NULL,
    FOREIGN KEY (id_sala) REFERENCES sala(id),
    FOREIGN KEY (id_tipo) REFERENCES tipo_sessao(id),
    FOREIGN KEY (id_filme) REFERENCES filme(id)
);

-- TABELA SESSAO_TIPO_SESSAO
CREATE TABLE sessao_tipo_sessao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_sessao INT NOT NULL,
    id_tipo_sessao INT NOT NULL,
    FOREIGN KEY (id_sessao) REFERENCES sessao(id),
    FOREIGN KEY (id_tipo_sessao) REFERENCES tipo_sessao(id)
);

-- TABELA TIPO_SALA
CREATE TABLE tipo_sala (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

-- TABELA SALA
CREATE TABLE sala (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL,
    capacidade INT NOT NULL,
    id_tipo_sala INT NOT NULL,
    FOREIGN KEY (id_tipo_sala) REFERENCES tipo_sala(id)
);
