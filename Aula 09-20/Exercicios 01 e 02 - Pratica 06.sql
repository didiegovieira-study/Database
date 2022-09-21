-- BD EXERCICIOS PRATICA 06

-- Exercicio 01
DROP DATABASE sprint2;
CREATE DATABASE sprint2;

USE sprint2;

CREATE TABLE projeto (
	idProjeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(45)
);

CREATE TABLE aluno (
	RA INT PRIMARY KEY AUTO_INCREMENT,
    fkRep INT,
    nome VARCHAR(45),
    telefone VARCHAR(12),
    fkProjeto INT,
    CONSTRAINT fkRepresentante FOREIGN KEY (fkRep) REFERENCES aluno (RA),
    CONSTRAINT fkProjeto FOREIGN KEY (fkProjeto) REFERENCES projeto (idProjeto)
);

CREATE TABLE acompanhante (
	idAcomp INT AUTO_INCREMENT,
    nome VARCHAR(45),
    relacao VARCHAR(45),
    fkAluno INT,
    CONSTRAINT fkAluno FOREIGN KEY (fkAluno) REFERENCES aluno (RA),
    PRIMARY KEY (idAcomp, fkAluno)
);

INSERT INTO projeto (nome, descricao) VALUES 
	('SPTech', 'Escola de Tecnologia'),
	('C6Bank', 'Banco Startup'),
	('Safra', 'Banco Tradicional'),
	('Accenture', 'Empresa de Auditoria');

INSERT INTO aluno (fkRep, nome, telefone, fkProjeto) VALUES
	(null, 'Diego', '11972981912', 3),
	(1, 'Estela', '11900000000', 3),
	(1, 'Lucas', '11911111111', 3),
	(null, 'Victor', '11922222222', 2),
	(2, 'Igor', '11933333333', 2),
	(2, 'Matheus', '11944444444', 4),
	(2, 'Erik', '11955555555', 4),
	(null, 'Giovanna', '11966666666', 1);
    
INSERT INTO acompanhante (nome, relacao, fkAluno) VALUES
	('Nalu', 'Sobrinha', 1),
	('Amora', 'Filha', 1),
	('Dante', 'Irmão', 2),
	('Ragnar', 'Filho', 3),
	('Sara', 'Esposa', 3),
	('Vinicius', 'Irmão', 4),
	('Nalu', 'Irmã', 5);
    
SELECT * FROM projeto;
SELECT * FROM aluno;
SELECT * FROM acompanhante;

SELECT * FROM projeto JOIN aluno ON fkProjeto = idProjeto;

SELECT * FROM aluno JOIN acompanhante ON fkAluno = RA;

SELECT * FROM aluno as a JOIN
	aluno as r ON r.fkRep = a.RA;
    
SELECT * FROM aluno as a JOIN
	projeto as p ON a.fkProjeto = p.idProjeto
		WHERE p.nome = 'Safra';
        
SELECT * FROM aluno JOIN
	projeto ON aluno.fkProjeto = projeto.idProjeto
		JOIN acompanhante ON acompanhante.fkAluno = aluno.RA;
        


-- Exercicio 02
DROP DATABASE Campanha;
CREATE DATABASE Campanha;

USE Campanha;

CREATE TABLE organizador (
	idOrg INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    rua VARCHAR(45),
    bairro VARCHAR(45),
    email VARCHAR(45),
    fkExp INT,
    FOREIGN KEY (fkExp) REFERENCES organizador (idOrg)
)AUTO_INCREMENT = 500;

CREATE TABLE campanha (
	idCamp INT AUTO_INCREMENT,
    fkOrg INT,
    categoria VARCHAR(45),
    instituicao VARCHAR(45),
    dtFinal DATE,
    FOREIGN KEY (fkOrg) REFERENCES organizador (idOrg),
    PRIMARY KEY (idCamp, fkOrg)
)AUTO_INCREMENT = 30;
    
INSERT INTO organizador (nome, rua, bairro, email, fkExp) VALUES 
	('Diego', 'Rua 17', 'Pira', 'diego.vieira@sptech.school', null),
    ('Estela', 'Rua Seila', 'Seila', 'estela.polverini@sptech.school', 500),
    ('Victor', 'Rua Seila2', 'Seila', 'victor.augusto@sptech.school', 500),
    ('Lucas', 'Rua Seila3', 'Seila', 'lucas.bonfim@sptech.school', null),
    ('Igor', 'Rua Seila4', 'Seila', 'igor.gabriel@sptech.school', 504);

INSERT INTO campanha (fkOrg, categoria, instituicao, dtFinal) VALUES 
	(500, 'alimento', 'Comidas2', '2022-10-09'),
	(501, 'alimento', 'Comidas2', '2022-10-09'),
	(502, 'alimento', 'Comidas2', '2022-10-09'),
	(503, 'higiene', 'HigieneBala', '2022-11-10'),
	(504, 'higiene', 'HigieneBala', '2022-11-10');

SELECT * FROM organizador;
SELECT * FROM campanha;

SELECT * FROM organizador JOIN campanha ON fkOrg = idOrg;

SELECT * FROM organizador JOIN campanha ON fkOrg = idOrg WHERE organizador.nome = 'Diego';

SELECT * FROM organizador as nov
	JOIN organizador as exp
		ON nov.fkExp = exp.idOrg;

SELECT * FROM organizador as nov
	JOIN organizador as exp
		ON nov.fkExp = exp.idOrg
			WHERE exp.nome = 'Diego';

SELECT * FROM organizador as nov
	JOIN organizador as exp
		ON nov.fkExp = exp.idOrg
			JOIN campanha ON
				fkOrg = exp.idOrg;

SELECT * FROM organizador as nov
	JOIN organizador as exp
		ON nov.fkExp = exp.idOrg
			JOIN campanha ON
				fkOrg = exp.idOrg
                WHERE nov.idOrg = 501;

