create database meu_segundo_DB;

USE meu_segundo_db;
-- Exercício 01
-- Escreva uma cláusula SQL para criar uma tabela simples
-- chamada Países, incluindo as colunas country_id, country_name e region_id.
create table paises(
	country_id 	char(4) NOT NULL PRIMARY KEY, -- primary key (chave primaria,  nao podendo ser nula)
    contry_name varchar(40) NOT NULL,
    region_id 	char(5)
);

-- Exercício 02 - Escreva uma cláusula SQL para criar uma tabela simples de países incluindo as colunas country_id, country_name e 
-- region_id que já existe.
-- usnado o medodto IF NOT EXISTS 
create table  IF NOT EXISTS paises(
	country_id 	char(4) NOT NULL PRIMARY KEY, -- primary key (chave primaria,  nao podendo ser nula)
    contry_name varchar(40) NOT NULL,
    region_id 	char(5)
);

-- Exercício 03 - Escreva uma instrução SQL para criar a estrutura de uma tabela dup_countries semelhantes a países
create table IF NOT EXISTS dup_countries LIKE paises;

-- Exercício 06 - Escreva uma instrução SQL para criar uma tabela chamada jobs incluindo as colunas job_id, 
-- job_title, min_salary, max_salary e verifique se o valor max_salary excede o limite superior de 25.000

CREATE TABLE jobs(
	job_id 		varchar(10) NOT NULL,
    job_title	varchar(40) NOT NULL,
    min_salary	decimal(6,2),	-- dec ou decimal
    max_salary	dec(6,2),
    
    check(max_salary<=25000)
);

-- Exercício 07 - Escreva uma instrução SQL para criar uma tabela chamada 
-- países incluindo as colunas country_id, country_name e region_id e 
-- certifique-se de que nenhum país, exceto Itália, Índia e China, será inserido na tabela.

create table countries_2(
	country_id char(4) NOT NULL PRIMARY KEY, -- primary key (chave primaria,  nao podendo ser nula)
    country_name varchar(40) NOT NULL,
    region_id 	char(5),
    -- check(coutry_name = "Itália" or coutry_name = "Índia" or coutry_name = "China")
    check(country IN ("Itália", "Índia", "China"))
);

-- Exercício 08 - Escreva uma instrução SQL para criar uma tabela chamada job_history incluindo as colunas 
-- Employee_id, start_date, end_date, job_id e Department_id 
-- e certifique-se de que o valor da coluna end_date será inserido no momento da inserção no formato como '--/-- /----'.

create table job_history(
	Employee_id INT AUTO_INCREMENT PRIMARY KEY, -- incrementa automaticamente a coluna 
    start_date date NOT NULL, 
    end_date DATE NOT NULL, 
    job_id varchar(5) NOT NULL,
    Department_id varchar(5) NOT NULL,
    check(end_date LIKE '--/-- /----')
);
-- Exercício 09 - Escreva uma instrução SQL para criar uma tabela chamada países 
-- incluindo as colunas country_id, country_name e region_id e certifique-se de 
-- que nenhum dado duplicado na coluna country_id será permitido no momento da inserção.
create table countries_3(
	country_id char(4) NOT NULL PRIMARY KEY UNIQUE, -- primary key (chave primaria,  nao podendo ser nula)
    country_name varchar(40) NOT NULL,
    region_id 	char(5),
);

-- Exercício 10 - Escreva uma instrução SQL para criar uma tabela chamada 
-- jobs incluindo as colunas job_id, job_title, min_salary e max_salary e 
-- certifique-se de que o valor padrão para job_title esteja em branco e 
-- min_salary seja 8000 e max_salary seja NULL será inserido 
-- automaticamente no momento de inserção se nenhum valor for atribuído às colunas especificadas.

create if not exists jobs(
	job_id 		varchar(10) NOT NULL UNIQUE,
    job_title	varchar(40) NOT NULL DEFAULT ' ',
    min_salary	decimal(6,2) DEFAULT '8000',	-- dec ou decimal
    max_salary	dec(6,2) DEFAULT NULL
    
);


