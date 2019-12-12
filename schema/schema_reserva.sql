CREATE DATABASE va;

use va;

CREATE TABLE vacina (
  id INT AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  validade DATE,
  PRIMARY KEY(id),
  UNIQUE (nome)
);

CREATE TABLE usuario (
  id INT AUTO_INCREMENT,
  primeiro_nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  sexo CHAR(1) NOT NULL,
  CPF CHAR(14) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (CPF)
);

CREATE TABLE aplicador (
  id INT AUTO_INCREMENT,
  primeiro_nome VARCHAR(100) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  sexo CHAR(1) NOT NULL,
  CPF CHAR(14) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (CPF)
);

CREATE TABLE aplicacao (
  id INT AUTO_INCREMENT,
  id_vacina INT NOT NULL,
  id_usuario INT NOT NULL,
  id_aplicador INT NOT NULL,
  data_aplicacao DATE DEFAULT CURDATE(),
  PRIMARY KEY(id),
  FOREIGN KEY(id_vacina) REFERENCES vacina(id),
  FOREIGN KEY(id_usuario) REFERENCES usuario(id),
  FOREIGN KEY(id_aplicador) REFERENCES aplicador(id)
);

DESC usuario;

DESC aplicador;

DESC vacina;

DESC aplicacao;