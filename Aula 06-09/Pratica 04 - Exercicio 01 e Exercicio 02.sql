CREATE DATABASE sprint2;

USE sprint2;

-- Professor
CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sobrenome VARCHAR(30),
    especialidade1 VARCHAR(40),
    especialidade2 VARCHAR(40)
);

INSERT INTO Professor (nome, sobrenome, especialidade1, especialidade2) VALUES 
	('Diego', 'Vieira', 'Javascript', 'MySQL'),
	('Lucas', 'Bonfim', 'HTML', 'CSS'),
	('Victor', 'Augusto', 'HTML', 'CSS'),
	('Estela', 'Polverini', 'MySQL', 'Javascript'),
	('Matheus', 'Lessa', 'Modelagem BD', 'CSS'),
	('Igor', 'Gabriel', 'HTML', 'CSS');
    
-- Disciplina
CREATE TABLE Disciplina (
	idDisc INT PRIMARY KEY AUTO_INCREMENT,
    nomeDisc VARCHAR(45)
);

INSERT INTO Disciplina (nomeDisc) VALUES
	('Algoritmos'),
	('Bando de Dados'),
	('Tecnologia da Informação');
    
ALTER TABLE Disciplina ADD COLUMN fkProf INT;
ALTER TABLE Disciplina ADD FOREIGN KEY (fkProf) REFERENCES Professor(idProfessor);

UPDATE Disciplina SET fkProf = '1' WHERE idDisc = 1;
UPDATE Disciplina SET fkProf = '4' WHERE idDisc = 2;
UPDATE Disciplina SET fkProf = '5' WHERE idDisc = 4;

SELECT * FROM Professor JOIN Disciplina ON idProfessor = fkProf;

SELECT Professor.nome, Disciplina.nomeDisc FROM Professor JOIN Disciplina ON idProfessor = fkProf;

SELECT Professor.nome, Disciplina.nomeDisc FROM Professor JOIN Disciplina ON idProfessor = fkProf WHERE sobrenome = 'Polverini';

SELECT Professor.especialidade1, Disciplina.nomeDisc FROM Professor JOIN Disciplina ON idProfessor = fkProf WHERE nome = 'Estela' ORDER BY especialidade1;


-- Exercicio 02

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
