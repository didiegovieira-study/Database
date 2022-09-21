CREATE DATABASE sprint2;

USE sprint2;

CREATE TABLE Curso (
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sigla CHAR(3),
    coordenador VARCHAR(50)
);

INSERT INTO Curso (nome, sigla, coordenador) VALUES
	('Analise e Desenvolvimento de Sistemas', 'ADS', 'Diego'),
	('Ciencia da Computaçao', 'CCO', 'Lucas'),
	('Sistema da Informação', 'SIS', 'Victor');
    
-- A regra de negócio será:
-- 1 professor leciona apenas 1 cursos;
-- 1 curso é lecionada por varios professor;

CREATE TABLE Professor2 (
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sobrenome VARCHAR(30),
    dtNasc DATE 
);

INSERT INTO Professor2 (nome, sobrenome, dtNasc) VALUES
	('Diego', 'Vieira', '2001-06-06'),
	('Victor', 'Augusto', '2003-10-21'),
	('Lucas', 'Bonfim', '2001-02-13');

ALTER TABLE Professor2 ADD COLUMN fkCurso INT;
ALTER TABLE Professor2 ADD FOREIGN KEY (fkCurso) REFERENCES Curso(idCurso); 

UPDATE Professor2 SET fkCurso = 1 WHERE idProfessor = 1;
UPDATE Professor2 SET fkCurso = 2 WHERE idProfessor = 2;
UPDATE Professor2 SET fkCurso = 3 WHERE idProfessor = 3;

SELECT * FROM Professor2 JOIN Curso ON fkCurso = idCurso;
SELECT * FROM Professor2 JOIN Curso ON fkCurso = idCurso WHERE sigla = 'ADS';

ALTER TABLE Curso ADD CONSTRAINT chkSigla CHECK (sigla in('ADS', 'CCO', 'SIS'));
