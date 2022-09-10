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
    
ALTER TABLE Professor ADD COLUMN fkDisc INT;
ALTER TABLE Professor ADD FOREIGN KEY (fkDisc) REFERENCES Disciplina(idDisc);

UPDATE Professor SET fkDisc = '1' WHERE idProfessor >= 1;
UPDATE Professor SET fkDisc = '2' WHERE idProfessor >= 3;
UPDATE Professor SET fkDisc = '3' WHERE idProfessor >= 5;

SELECT * FROM Professor JOIN Disciplina ON idDisc = fkDisc;

SELECT Professor.nome, Disciplina.nomeDisc FROM Professor JOIN Disciplina ON idDisc = fkDisc;

SELECT Professor.nome, Disciplina.nomeDisc FROM Professor JOIN Disciplina ON idDisc = fkDisc WHERE sobrenome = 'Polverini';

SELECT Professor.especialidade1, Disciplina.nomeDisc FROM Professor JOIN Disciplina ON idDisc = fkDisc WHERE nome = 'Estela' ORDER BY especialidade1;
