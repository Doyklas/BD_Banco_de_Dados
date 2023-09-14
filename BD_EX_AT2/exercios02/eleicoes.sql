CREATE DATABASE ELEICOES;

USE ELEICOES;


CREATE TABLE CARGO (
    pk_Codigo_Cargo INT PRIMARY KEY,
    Nome_Cargo VARCHAR(30) UNIQUE NOT NULL,
    Salario FLOAT NOT NULL DEFAULT 17000.00,
    Numero_Vagas INT UNIQUE NOT NULL,

 

    CHECK (Nome_Cargo <> 'Prefeito' AND Nome_Cargo <> 'Vereador')
    );

CREATE TABLE PARTIDO (
    pk_Codigo_Partido INT PRIMARY KEY,
    Sigla CHAR(5) UNIQUE NOT NULL,
    Nome VARCHAR(40) UNIQUE NOT NULL,
    Numero INT UNIQUE NOT NULL
    );

CREATE TABLE CANDIDATO (
    pk_Numero_Candidato INT PRIMARY KEY,
    Nome VARCHAR(40) UNIQUE NOT NULL,
    fk_Codigo_Partido int,
    fk_Codigo_Cargo int,

    foreign key(fk_Codigo_Partido) references PARTIDO(pk_Codigo_Partido),
    foreign key(fk_Codigo_Cargo) references CARGO(pk_Codigo_cargo)
);

 

CREATE TABLE ELEITOR (
    PK_Titulo_Eleitor VARCHAR(30) PRIMARY KEY,
    Zona_Eleitoral CHAR(5) NOT NULL,
    Sessao_Eleitoral CHAR(5) NOT NULL,
    Nome VARCHAR(40) NOT NULL
);

 

CREATE TABLE VOTO (
	pk_id_voto int,
    fk_Titulo_Eleitor VARCHAR(30),
	fk_Numero_Candidato int,

    foreign key(fk_Numero_Candidato) references CANDIDATO(pk_Numero_Candidato),
    foreign key(fk_Titulo_Eleitor) references ELEITOR(pk_Titulo_Eleitor)
);