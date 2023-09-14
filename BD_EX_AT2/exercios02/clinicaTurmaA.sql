drop database clinica_turmaa;

-- cria o banco de dados
create database clinica_turma_a;
-- ativa o banco de dados para uso
use clinica_turma_a;
-- cria a tabela sala
create table sala(
	num_sala 	int not null UNIQUE,
    andar 		int not null UNIQUE,
    
    check 		(num_sala 	>= 1 and num_sala 	<= 50),
    check 		(andar 		>= 1 and andar 		<= 50),
    
    PRIMARY KEY (num_sala)
);

create table paciente(
	nome 			varchar(40) not null,
    rg 				char(9) not null UNIQUE,
    data_nascimento DATE not null,
    cidade 			varchar(30) DEFAULT "ITABUNA",
    doenca 			varchar(40) not null,
    plano_saude		varchar(40) not null DEFAULT "SUS",
    PRIMARY KEY 	(rg)
);
create table funcionarios(
	matricula 		char(15) not null UNIQUE,
    nome 			varchar(40) not null,
    data_nascimento date not null,
    data_adimissao	date not null,
    cargo 			varchar(40) not null DEFAULT 'Assistente Médico',
    salario 		float not null DEFAULT 510.00,
    PRIMARY KEY		(matricula)
);

create table medicos(
	crm 			char(15) not null UNIQUE,
	nome 			varchar(40) not null,
    idade 			int not null,
    especialidade	varchar(40) not null DEFAULT 'Ortopedia',
    cpf 			char(11) not null UNIQUE,
    data_adimissao  date,
    num_sala 		int not null,
    matricula 		varchar(15) not null UNIQUE,
    check 			(idade >= 23),
    PRIMARY KEY 	(crm),
    FOREIGN KEY 	(num_sala) references sala(num_sala),
    FOREIGN KEY 	(matricula) references funcionarios(matricula)
);
create table consulta(
	id_consulta 	int not null UNIQUE,
	data_horario	datetime not null,
    crm_medico 		char(15) not null UNIQUE,
    rg_paciente 	char(9) not null UNIQUE,
    PRIMARY KEY 	(id_consulta),
    FOREIGN KEY 	(crm_medico) 	references medicos(crm),
    FOREIGN KEY 	(rg_paciente) 	references paciente(rg)
);


