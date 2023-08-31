-- Isto é um comentario
-- Criar o banco de dados clinica (CREATE DATABASE)
-- CREATE DATABASE clinica_turmaA;
-- Ativar o banco (USE DATABASENAME)
USE clinica_turmaA;
-- Cria uma tabela (CREATE TABLE TABLENAME)
CREATE TABLE sala(
	numero_sala int NOT NULL, -- numero da sala 'int' -sendo um numero interio E 'NOT NULL' - não podendo ser nulo
    andar int NOT NULL, -- numero do Andar 'int' - sendo um numero interio E 'NOT NULL' - não podendo ser nulo
    CHECK(numero_sala>1 and numero_sala<50), -- verifica se o numero da sala é maior que 1 e menor que 50
    CHECk(andar<12) -- verifica se o numero do andar é menor que 12
);

CREATE TABLE medicos(
	crm 			char(15) NOT NULL UNIQUE, -- Cria um crm de 15 cracteres, nao nulo (NOT NULL) e Unico (UNIQUE)
    nome 			varchar(40) NOT NULL, -- cria o nome do medico nao nulo
    idade  			int,
    especialidade 	char(20) NOT NULL DEFAULT "ORTOPEDIA",
    CPF 			char(11) NOT NULL,
    data_adimissao 	date NOT NULL,
    CHECK(idade>23)
);

CREATE TABLE pacientes(
	RG CHAR(9) UNIQUE NOT NULL,
    nome VARCHAR(40) NOT NULL,
    data_nascimento date NOT NULL,
    cidade VARCHAR(30) DEFAULT 'ITABUNA',
    doenca VARCHAR(40) NOT NULL,
    plano_saude VARCHAR(40) DEFAULT 'SUS'
);

CREATE TABLE funcionarios(
	matricula CHAR(15)  NOT NULL UNIQUE,
    nome VARCHAR(40) NOT NULL,
    data_nascimento date NOT NULL,
    data_admissao date NOT NULL,
    cargo  VARCHAR(40)  NOT NULL DEFAULT 'ASSITENTE MEDICO',
    salrio FLOAT NOT NULL DEFAULT '510.00'
);
CREATE TABLE funcionarios(
    matricula CHAR (15) NOT NULL UNIQUE,
    nome VARCHAR(40) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_admissao DATE NOT NULL,
    cargo VARCHAR(40) NOT NULL DEFAULT "ASSISTENTE  MEDICO",
    salario FLOAT NOT NULL DEFAULT "510.00"
);
CREATE TABLE consultas(
    codigo_consulta INT UNIQUE NOT NULL,
    data_horario DATETIME
);




