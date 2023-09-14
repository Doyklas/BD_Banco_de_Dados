CREATE DATABASE REVENDEDORA_CARROS;

USE REVENDEDORA_CARROS;

CREATE TABLE AUTOMOVEIS (
    RENAVAM INT PRIMARY KEY,
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
    Codigo_Cliente INT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Sobrenome VARCHAR(30) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    Rua VARCHAR(50) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Complemento VARCHAR(50) DEFAULT '',
    Bairro VARCHAR(40) NOT NULL
    );

CREATE TABLE ENDERECO_CLIENTES(
	CEP VARCHAR(10) NOT NULL,
	Rua VARCHAR(50) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Complemento VARCHAR(50),
    Bairro VARCHAR(40) NOT NULL,
    Cidade VARCHAR(40) NOT NULL,
    Estado CHAR(2) NOT NULL,
    Pais   VARCHAR(40) NOT NULL,
    
	foreign key (CEP) references CLIENTES(CEP),
    foreign key (Rua) references CLIENTES(Rua),
    foreign key (Numero) references CLIENTES(Numero),
    foreign key (Complemento) references CLIENTES(Complemento),
    foreign key (Bairro) references CLIENTES(Bairro)
    
);

CREATE TABLE VENDEDORES (
    Codigo_Vendedor INT PRIMARY KEY,
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
    Codigo_Venda INT,
    Codigo_Cliente INT NOT NULL,
    Codigo_Vendedor INT NOT NULL,
    RENAVAM INT NOT NULL,
    Preco_Pago FLOAT NOT NULL,
	
    primary key (Codigo_Venda),
    foreign key(Codigo_Cliente) references CLIENTES(pk_Codigo_Cliente),
    foreign key(Codigo_Vendedor) references VENDEDORES(pk_Codigo_Vendedor),
    foreign key(RENAVAM) references AUTOMOVEIS(RENAVAM)
);

