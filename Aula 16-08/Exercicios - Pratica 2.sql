-- Atividade 1
CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE Atleta (
	idAtleta int primary key,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);

INSERT INTO Atleta VALUES 
	(1, 'Diego', 'Futebol', 2398),
	(2, 'Lucas', 'Basquete', 1),
	(3, 'Igor', 'Golf', 34),
	(4, 'Matheus', 'Futebol', 2398),
	(5, 'Estela', 'Golf', 9);
    
SELECT * FROM Atleta;

UPDATE Atleta SET qtdMedalha = '9238' WHERE idAtleta = '1';

UPDATE Atleta SET qtdMedalha = '3' WHERE idAtleta = '2' or idAtleta = '3';

UPDATE Atleta SET nome = 'Amanda' WHERE idAtleta = '4';

ALTER TABLE Atleta ADD COLUMN dtNasc date;

UPDATE Atleta SET dtNasc = '2001-06-06' WHERE idAtleta >= 0;

DELETE FROM Atleta WHERE idAtleta = '5';

SELECT * FROM Atleta WHERE modalidade = 'Futebol';

SELECT * FROM Atleta WHERE qtdMedalha >= 3;

ALTER TABLE Atleta MODIFY COLUMN modalidade varchar(60);

DESC Atleta;

DROP TABLE Atleta;

-- Atividade 2:
CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

INSERT INTO Musica VALUES
	('1', 'Star Shopping', 'Lil Peep', 'INDIE'),
	('2', 'Benz Truck', 'Lil Peep', 'INDIE'),
	('3', 'crybaby', 'Lil Peep', 'INDIE'),
	('4', 'hellboy', 'Lil Peep', 'INDIE'),
	('5', 'Life is Beautiful', 'Lil Peep', 'INDIE'),
	('6', 'Falling Down', 'Lil Peep', 'INDIE'),
	('7', 'beamer boy', 'Lil Peep', 'INDIE'),
	('8', 'Revenge', 'XXXTENTACION', 'TRAP'),
	('9', 'Lucid Dreams', 'Juice Wrld', 'TRAP'),
	('10', 'Glimpse of Us', 'Joji', 'INDIE');

SELECT * FROM Musica;

ALTER TABLE Musica ADD COLUMN curtidas int;

UPDATE Musica SET curtidas = 10 WHERE idMusica >= 1;

ALTER TABLE Musica MODIFY COLUMN artista varchar(80);

UPDATE Musica SET curtidas = 20 WHERE idMusica = 1;

UPDATE Musica SET curtidas = 25 WHERE idMusica = 2 or idMusica = 3;

UPDATE Musica SET titulo = 'Melhor' WHERE idMusica = 5;

DELETE FROM Musica WHERE idMusica = 4;

SELECT * FROM Musica WHERE genero = 'trap';

SELECT * FROM Musica WHERE curtidas >= 20;

DESC Musica;

DROP TABLE Musica;

-- Atividade 3:
CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
);

INSERT INTO Filme VALUES
	('1', 'Um Sonho de Liberdade', 'Drama', 'Frank Darabont'),
    ('2', 'O Poderoso Chefão', 'Drama', 'Francis Ford'),
    ('3', 'Batman: O Cavaleiro das Trevas', 'Ação', 'Christopher Nolan'),
    ('4', 'O Poderoso Chefão II', 'Drama', 'Francis Ford'),
    ('5', '12 Homens e uma Sentença', 'Drama', 'Sidney Lumet'),
    ('6', 'A Lista de Schindler', 'Biografia', 'Steven Spielberg'),
    ('7', 'O Senhor dos Anéis: O Retorno do Rei', 'Ação', 'Peter Jackson'),
    ('8', 'Pulp Fiction: Tempo de Violência', 'Drama', 'Quentin Tarantino'),
    ('9', 'O Senhor dos Anéis: A Sociedade do Anel', 'Ação', 'Peter Jackson');

SELECT * FROM Filme;

ALTER TABLE Filme ADD COLUMN protagonista varchar(50);

UPDATE Filme SET protagonista = 'Jack Sparrow' WHERE idFilme >= 1;

ALTER TABLE Filme MODIFY COLUMN diretor varchar(150);

UPDATE Filme SET diretor = 'Mac' WHERE idFilme = 5;

UPDATE Filme SET diretor = 'Denis' WHERE idFilme = 2 or idFilme = 7;

UPDATE Filme SET titulo = 'Shrek 3' WHERE idFilme = 6;

DELETE FROM Filme WHERE idFilme = 3;

SELECT * FROM Filme WHERE genero = 'Ação';

SELECT * FROM Filme WHERE genero = 'suspense';

DESC Filme;

DROP TABLE Filme;


-- Atividade 4:
CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
	nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
);

INSERT INTO Professor VALUE
	(1, 'Vivian', 'Banco de Dados', '1983-10-13'),
	(2, 'Monica', 'Tecnologia da Informação', '1984-12-01'),
	(3, 'Chola', 'Arquitetura Computacional', '1983-01-02'),
	(4, 'Fernanda', 'Pesquisa e Inovação', '1994-02-12'),
	(5, 'Yoshi', 'Algoritmos', '1994-11-15'),
	(6, 'Vera', 'Socio Emocional', '1990-08-03');
    
SELECT * FROM Professor;

ALTER TABLE Professor ADD funcao varchar(50);

ALTER TABLE Professor ADD CONSTRAINT chkFuncao CHECK (funcao in ('monitor', 'assistente', 'titular'));

UPDATE Professor SET funcao = 'monitor' WHERE idProfessor >=1;
UPDATE Professor SET funcao = 'assistente' WHERE idProfessor >=3;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor >=6;

INSERT INTO Professor VALUE (7, 'Brandao', 'PI', '1978-08-98');

DELETE FROM Professor WHERE idProfessor = 5;

SELECT * FROM Professor WHERE funcao = 'titular';

SELECT especialidade, dtNasc FROM Professor WHERE funcao = 'monitor';

UPDATE Professor SET dtNasc = '0000-00-00' WHERE idProfessor = 3;

DROP TABLE Professor;


-- Atividade 5:
CREATE TABLE Curso (
	idCurso INT PRIMARY KEY,
    nome VARCHAR(50),
    sigla VARCHAR(3),
    coordenador VARCHAR(40)
);

INSERT INTO Curso VALUES
	('1', 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Monica'),
	('2', 'Ciência da Computação', 'CCI', 'Thiago'),
    ('3', 'Sistema da Informação', 'SIS', 'Matue');

SELECT * FROM Curso;

SELECT coordenador FROM Curso;

SELECT * FROM Curso WHERE sigla = 'SIS';

SELECT * FROM Curso ORDER BY nome ASC;

SELECT * FROM Curso ORDER BY coordenador DESC;

SELECT * FROM Curso WHERE nome LIKE 'a%';

SELECT * FROM Curso WHERE nome LIKE '%o';

SELECT * FROM Curso WHERE nome LIKE '_i%';

SELECT * FROM Curso WHERE nome LIKE '%a_';

DROP TABLE Curso;


-- Atividade 6:
CREATE TABLE Revista (
	idRevista INT PRIMARY KEY auto_increment,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

INSERT INTO Revista (nome, categoria) VALUES
	('Revista Placar', null ),
	('Revista Invicto', null ),
	('Revista ESPN Brasil', null ),
	('Revista Hardcore', null );
    
SELECT * FROM Revista;

UPDATE Revista SET categoria = 'Esportes' WHERE idRevista >= 1;

SELECT * FROM Revista;

INSERT INTO Revista (nome, categoria) VALUES
	('Veja', 'Politica'),
	('Isto É', 'Noticias'),
	('Epoca', 'Noticias');

SELECT * FROM Revista;

DESC Revista;

ALTER TABLE Revista MODIFY COLUMN categoria varchar(40);

DESCRIBE Revista;

ALTER TABLE Revista ADD COLUMN periodicidade varchar(15);

SELECT * FROM Revista;

ALTER TABLE Revista DROP COLUMN periodicidade;

DESC Revista;

DROP TABLE Revista;


DROP DATABASE sprint1;