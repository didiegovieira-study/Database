-- Exercicio 01
CREATE DATABASE Pet;
USE Pet;

CREATE TABLE cliente (
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefoneFixo CHAR(10),
    telefoneCelular CHAR(11),
    endereco VARCHAR(45)
);

CREATE TABLE pet (
	idPet INT AUTO_INCREMENT,
    tipo VARCHAR(45),
    nome VARCHAR(45),
    raca VARCHAR(45),
    dtNasc DATE,
    fkCliente INT,
    FOREIGN KEY (fkCliente) REFERENCES cliente(idCliente),
    PRIMARY KEY (idPet, fkCliente)
)AUTO_INCREMENT=100;

INSERT INTO cliente (nome, telefoneFixo, telefoneCelular, endereco) VALUES
	('Diego Vieira', '1146484470', '11972981912', 'Guarulhos'),
	('Estela Polverini', null, null, 'Belem'),
    ('Lucas Vieira', null, null, 'Itapevi'),
    ('Victor Augusto', null, '11987652345', 'Guarulhos');


INSERT INTO pet (tipo, nome, raca, dtNasc, fkCliente) VALUES
	('Cachorro', 'Amora', 'Shih-Tzu', '2021-01-02', 1),
    ('Cachorro', 'Ragnar', 'Husky', '2022-04-25', 2),
    ('Gato', 'Pudim', 'Siames', '2022-04-25', 3),
    ('Arara', 'Rio', 'Azul', '2022-09-13', 4);
    
SELECT * FROM cliente;
SELECT * FROM pet;

ALTER TABLE cliente MODIFY COLUMN nome VARCHAR(50);

SELECT * FROM pet WHERE tipo = 'Cachorro';

SELECT nome, dtNasc FROM pet;

SELECT * FROM pet ORDER BY nome ASC;

SELECT * FROM cliente ORDER BY endereco DESC;

SELECT * FROM pet WHERE nome like 'A%';

SELECT * FROM cliente WHERE nome like '% Vieira';

UPDATE cliente SET telefoneFixo = '1147654321' WHERE idCliente = 2;

SELECT * FROM cliente;

SELECT * FROM cliente JOIN pet ON fkCliente = idCliente;

SELECT * FROM cliente JOIN pet ON fkCliente = idCliente WHERE idCliente = 2;

DELETE FROM pet WHERE idPet = 103;

SELECT * FROM pet;

DROP TABLE pet;
DROP TABLE cliente;



-- Exercicio 02
CREATE DATABASE familia;
USE familia;

CREATE TABLE pessoa (
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNasc DATE,
    profissao VARCHAR(45)
);

CREATE TABLE gasto (
	idGasto INT AUTO_INCREMENT,
    dtGasto DATE,
    valor DECIMAL(10.2),
    descricao VARCHAR(45),
    fkPessoa INT,
    FOREIGN KEY (fkPessoa) REFERENCES pessoa(idPessoa),
    PRIMARY KEY (idGasto, fkPessoa)
);

INSERT INTO pessoa (nome, dtNasc, profissao) VALUES
	('Estela', '2004-04-29', 'Medica'),
	('Diego', '2001-06-06', 'Medico'),
	('Lucas', '2001-04-18', 'Limpeza'),
	('Matheus', '2004-04-22', 'Cozinheiro');

INSERT INTO gasto (dtGasto, valor, descricao, fkPessoa) VALUES
	('2022-09-01', '250.50', 'Conta de Agua', 2),
	('2022-10-02', '540.29', 'Conta de Luz', 1),
	('2022-10-03', '1320.20', 'Aluguel', 1),
	('2022-10-04', '5000.00', 'Escola', 2),
	('2022-10-05', '50.56', 'Pensao', 3),
	('2022-10-06', '200.00', 'Alimentacao', 2),
	('2022-10-07', '1020.10', 'Telefone', 3),
	('2022-10-08', '1020.10', 'Telefone', 1),
	('2022-10-09', '2304.05', 'Internet', 2),
	('2022-10-10', '234.05', 'Internet', 4),
	('2022-10-23', '102.29', 'Gas', 4);

SELECT * FROM gasto;

SELECT * FROM pessoa;

SELECT profissao FROM pessoa;
SELECT descricao FROM gasto;

SELECT gasto.descricao, pessoa.nome FROM gasto JOIN pessoa ON fkPessoa = idPessoa;

SELECT gasto.descricao, pessoa.nome FROM gasto JOIN pessoa ON fkPessoa = idPessoa WHERE idPessoa = 1;

UPDATE gasto SET valor = '250.30' WHERE idGasto >= 8;

DELETE FROM gasto WHERE idGasto = 2;
DELETE FROM gasto WHERE idGasto = 4;
DELETE FROM gasto WHERE idGasto = 1;



-- Exercicio 03
CREATE DATABASE PraticaFuncionario;
USE PraticaFuncionario;

CREATE TABLE setor (
	idSetor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    numAndar INT
);

CREATE TABLE funcionario (
	idFunc INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    salario VARCHAR(45), CONSTRAINT chkSalario CHECK (salario > 0),
    telefone CHAR(11),
    fkSetor INT,
    FOREIGN KEY (fkSetor) REFERENCES setor(idSetor)
)AUTO_INCREMENT=100;

CREATE TABLE acompanhante (
	idAcompanhante INT AUTO_INCREMENT,
    nome VARCHAR(45),
    relacao VARCHAR(45),
    dtNasc DATE,
    fkFunc INT,
    FOREIGN KEY (fkFunc) REFERENCES funcionario(idFunc),
    PRIMARY KEY (idAcompanhante, fkFunc)
)AUTO_INCREMENT=10;

INSERT INTO setor (nome, numAndar) VALUES
	('Financeiro', 2),
	('TI', 2),
	('Comercial', 3),
	('Recursos Humanos', 3);

INSERT INTO funcionario (nome, salario, telefone, fkSetor) VALUES
	('Diego', '80000', '11972981912', 1),
	('Estela', '600', '11987651234', 1),
	('Lucas', '9832', '11976543456', 3),
	('Matheus', '834', '11923456789', 4),
	('Victor', '2394', '11976854756', 2);

INSERT INTO acompanhante (nome, relacao, dtNasc, fkFunc) VALUES
	('Nalu', 'Sobrinha', '2010-11-23', '1'),
	('Dante', 'Irmão', '2011-09-23', '2'),
	('Ragnar', 'Irmão', '2022-01-23', '3'),
	('Lucas', 'Namorado', '2022-01-23', '4'),
	('Vinicius', 'Irmão', '2009-02-23', '5');
    
SELECT * FROM setor;
SELECT * FROM funcionario;
SELECT * FROM acompanhante;

SELECT * FROM setor JOIN funcionario ON fkSetor = idSetor;

SELECT * FROM setor JOIN funcionario ON fkSetor = idSetor WHERE setor.nome = 'Financeiro';

SELECT * FROM funcionario JOIN acompanhante ON fkFunc = idFunc WHERE idFunc = 1;

SELECT * FROM funcionario JOIN acompanhante ON fkFunc = idFunc;



-- Exercicio 04
CREATE DATABASE Treinador;

USE Treinador;

CREATE TABLE treinador (
	idTreinador INT PRIMARY KEY AUTO_INCREMENT,
    fkExperiente INT,
    nome VARCHAR(45),
    telefone CHAR(11),
    email VARCHAR(45),
    FOREIGN KEY (fkExperiente) REFERENCES treinador(idTreinador)
)AUTO_INCREMENT=10;

CREATE TABLE nadador (
	idNadador INT AUTO_INCREMENT,
    nome VARCHAR(45),
    estado VARCHAR(45),
    dtNasc DATE,
    fkTreinador INT,
    FOREIGN KEY (fkTreinador) REFERENCES treinador(idTreinador),
    PRIMARY KEY (idNadador, fkTreinador)
)AUTO_INCREMENT=100;

INSERT INTO treinador (fkExperiente, nome, telefone, email) VALUES
	(null, 'Diego', '11972981912', 'diego.vieira@sptech.school'),
	(10, 'Lucas', '11900020003', 'lucas.bonfim@sptech.school'),
	(10, 'Estela', '11900040005', 'estela.polverini@sptech.school'),
	(10, 'Victor', '11900050006', 'victor.pereira@sptech.school'),
	(12, 'Igor', '11900070008', 'igor.gabriel@sptech.school'),
	(11, 'Matheus', '11900090010', 'matheus.lessa@sptech.school');
    
INSERT INTO nadador (nome, estado, dtNasc, fkTreinador) VALUES
	('Amanda', 'São Paulo', '2003-08-20', 12),
	('Erik', 'Rio de Janeiro', '2004-06-04', 13),
	('Nilton', 'Minas Gerais', '2002-10-20', 14),
	('Pedro', 'Pernambuco', '2003-09-10', 15),
	('Paulo', 'Ceará', '2004-03-02', 10),
	('Bruno', 'Paraná', '2003-10-01', 11),
	('Vitoria', 'Brasília', '2002-08-23', 12);

SELECT * FROM treinador;
SELECT * FROM nadador;

SELECT * FROM treinador JOIN nadador ON fkTreinador = idTreinador;

SELECT * FROM treinador JOIN nadador ON fkTreinador = idTreinador WHERE treinador.nome = 'Estela';

SELECT * FROM treinador WHERE treinador.nome = 'Diego';

SELECT * FROM treinador AS id INNER JOIN treinador AS fk ON fk.fkExperiente = id.idTreinador;

SELECT * FROM treinador AS id INNER JOIN treinador AS fk ON fk.fkExperiente = id.idTreinador WHERE id.nome = 'Diego';

SELECT * FROM nadador AS nad JOIN treinador AS id ON nad.fkTreinador = id.idTreinador INNER JOIN treinador AS fk ON fk.idTreinador = id.fkExperiente;

SELECT * FROM nadador AS nad JOIN treinador AS id ON nad.fkTreinador = id.idTreinador INNER JOIN treinador AS fk ON fk.idTreinador = id.fkExperiente WHERE fk.nome = 'Diego';

