CREATE DATABASE va;
use va;

CREATE TABLE vacina (
  id INT AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  validade TIMESTAMP DEFAULT DATE_ADD(CURDATE(), INTERVAL 1 YEAR),
  PRIMARY KEY(id),
  UNIQUE (nome)
);

CREATE TABLE usuario (
  id INT AUTO_INCREMENT,
  nome VARCHAR(230) NOT NULL,
  CPF CHAR(11) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (CPF)
)

CREATE TABLE aplicador (
  id INT AUTO_INCREMENT,
  nome VARCHAR(230) NOT NULL,
  CPF CHAR(11) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (CPF)
)

CREATE TABLE aplicacao (
  id INT AUTO_INCREMENT,
  id_vacina INT NOT NULL,
  id_usuario INT NOT NULL,
  id_aplicador INT NOT NULL,
  data_aplicacao TIMESTAMP DEFAULT CURDATE(),
  PRIMARY KEY(id),
  FOREIGN KEY(id_vacina) REFERENCES vacina(id),
  FOREIGN KEY(id_usuario) REFERENCES usuario(id),
  FOREIGN KEY(id_aplicador) REFERENCES aplicador(id)
)