CREATE DATABASE Sprint2;

USE Sprint2;

CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

INSERT INTO Atleta (nome, modalidade, qtdMedalha) VALUES
	('Diego', 'Futebol', 999),
	('Igor', 'Basquete', 12),
	('Lucas', 'Vôlei', 43),
	('Matheus', 'Natação', 5),
	('Victor', 'Golf', 23),
	('Estela', 'Vôlei', 54),
	('Amanda', 'Dança', 1);

CREATE TABLE Pais (
	idPais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    capital VARCHAR(40)
);

INSERT INTO Pais (nome, capital) VALUES
	('Brasil', 'Brasília'),
	('França', 'Paris'),
	('Alemanha', 'Berlim'),
	('Italia', 'Roma'),
	('Holanda', 'Amsterdã');

ALTER TABLE Atleta ADD COLUMN fkPais INT;

ALTER TABLE Atleta ADD foreign key (fkPais) references Pais(idPais);

SELECT * FROM Atleta;
UPDATE Atleta SET fkPais = 5 WHERE idAtleta = 1;
UPDATE Atleta SET fkPais = 1 WHERE idAtleta = 2;
UPDATE Atleta SET fkPais = 2 WHERE idAtleta = 3;
UPDATE Atleta SET fkPais = 3 WHERE idAtleta = 4;
UPDATE Atleta SET fkPais = 4 WHERE idAtleta = 5;
UPDATE Atleta SET fkPais = 5 WHERE idAtleta = 6;
UPDATE Atleta SET fkPais = 1 WHERE idAtleta = 7;

SELECT * FROM Atleta JOIN Pais ON idPais = fkPais;
SELECT Atleta.nome, Pais.nome FROM Atleta JOIN Pais ON idPais = fkPais;
SELECT Atleta.nome, Pais.nome FROM Atleta JOIN Pais ON idPais = fkPais WHERE capital = 'Amsterdã';

SELECT * FROM Pais;