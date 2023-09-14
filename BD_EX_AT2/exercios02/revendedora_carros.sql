CREATE DATABASE REVENDEDORA_CARROS;

 

USE REVENDEDORA_CARROS;

 

CREATE TABLE AUTOMOVEIS (
    pk_RENAVAM INT PRIMARY KEY,
    Placa VARCHAR(7) NOT NULL,
    Marca VARCHAR(30) NOT NULL,
    Modelo VARCHAR(30) NOT NULL,
    Ano_Fabricacao DATE NOT NULL,
    Ano_Modelo DATE NOT NULL,
    Cor VARCHAR(20) NOT NULL,
    Motor VARCHAR(20) NOT NULL,
    Numero_Portas INT NOT NULL,
    Tipo_Combustivel VARCHAR(20) NOT NULL,
    Preco FLOAT NOT NULL
    );

CREATE TABLE CLIENTES (
    pk_Codigo_Cliente INT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Sobrenome VARCHAR(30) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Rua VARCHAR(50) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Complemento VARCHAR(50),
    Bairro VARCHAR(40) NOT NULL,
    Cidade VARCHAR(40) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP VARCHAR(10) NOT NULL
    );

CREATE TABLE VENDEDORES (
    pk_Codigo_Vendedor INT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Sobrenome VARCHAR(30) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Rua VARCHAR(50) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Complemento VARCHAR(50),
    Bairro VARCHAR(40) NOT NULL,
    Cidade VARCHAR(40) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    Data_Admissao DATE NOT NULL,
    Salario FLOAT NOT NULL
);

 

CREATE TABLE VENDAS (
    pk_Codigo_Venda INT,
    fk_Codigo_Cliente INT NOT NULL,
    fk_Codigo_Vendedor INT NOT NULL,
    fk_RENAVAM INT NOT NULL,
    Preco_Pago FLOAT NOT NULL,

    foreign key(fk_Codigo_Cliente) references CLIENTES(pk_Codigo_Cliente),
    foreign key(fk_Codigo_Vendedor) references VENDEDORES(pk_Codigo_Vendedor),
    foreign key(fk_RENAVAM) references AUTOMOVEIS(pk_RENAVAM)
);