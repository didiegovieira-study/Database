CREATE DATABASE Sprint2;

USE Sprint2;

CREATE TABLE Musica (
	idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

INSERT INTO Musica (titulo, artista, genero) VALUES
	('Star Shopping', 'Lil Peep', 'INDIE'),
	('Benz Truck', 'Lil Peep', 'INDIE'),
	('crybaby', 'Lil Peep', 'INDIE'),
	('hellboy', 'Lil Peep', 'INDIE'),
	('Life is Beautiful', 'Lil Peep', 'INDIE'),
	('Falling Down', 'Lil Peep', 'INDIE'),
	('beamer boy', 'Lil Peep', 'INDIE'),
	('Revenge', 'XXXTENTACION', 'TRAP'),
	('Lucid Dreams', 'Juice Wrld', 'TRAP'),
	('Glimpse of Us', 'Joji', 'INDIE');
    
CREATE TABLE Album (
	idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    tipo VARCHAR(20), CONSTRAINT chkTipo CHECK (tipo in ('digital', 'fisico')),
    dtLancamento DATE
);

INSERT INTO Album (nome, tipo, dtLancamento) VALUES
	('stargazing', 'fisico', '2022-08-30'),
	('devils', 'digital', '2022-08-30');
    
SELECT * FROM Musica;
SELECT * FROM Album;

ALTER TABLE Musica ADD COLUMN fkAlbum INT;

ALTER TABLE Musica ADD foreign key (fkAlbum) references Album(idAlbum);

SELECT * FROM Musica;

UPDATE Musica SET fkAlbum = 1 WHERE idMusica = 1;
UPDATE Musica SET fkAlbum = 1 WHERE idMusica = 2;
UPDATE Musica SET fkAlbum = 1 WHERE idMusica = 3;
UPDATE Musica SET fkAlbum = 1 WHERE idMusica = 4;
UPDATE Musica SET fkAlbum = 1 WHERE idMusica = 5;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 6;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 7;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 8;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 9;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 10;

SELECT * FROM Musica;
SELECT * FROM Musica JOIN Album;
SELECT Musica.titulo, Album.nome FROM Musica JOIN Album on idAlbum = fkAlbum;

SELECT Musica.titulo, Album.nome FROM Musica JOIN Album on idAlbum = fkAlbum WHERE tipo = 'fisico';

