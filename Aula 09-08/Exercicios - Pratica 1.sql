-- Primeira Atividade:
-- Criar a database como "sprint1"
CREATE DATABASE sprint1;

-- Selecionar a sprint1
USE sprint1;

-- Criar a tabela dos Atletas
CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY,
	nome VARCHAR(40),
	modalidade VARCHAR(40),
    qtdMedalha INT
);

-- Inserir os dados dos atletas
INSERT INTO Atleta VALUES
	('1', 'Diego', 'Futebol', '79'),
	('2', 'Victor', 'Futebol', '1'),
	('3', 'Lucas', 'Golf', '32'),
	('4', 'Igor', 'Futebol', '34'),
	('5', 'Estela', 'Golf', '8'),
	('6', 'Amanda', 'Tenis', '26'),
	('7', 'Matheus', 'Basquete', '42'),
	('8', 'Sara', 'Tenis', '11');

-- Verificar a tabela
SELECT * FROM Atleta;

-- Verificar apenas os nomes e as medalhas dos atletas
SELECT nome, qtdMedalha FROM Atleta;

-- Verificar apenas uma modalidade especifica
SELECT * FROM Atleta WHERE modalidade = 'Futebol';

-- Verificar as modalidades em ordem crescente
SELECT * FROM Atleta ORDER BY modalidade ASC;

-- Verificar as quantidade de medalha em ordem decrescente
SELECT * FROM Atleta ORDER BY qtdMedalha DESC;

-- Verificar apenas nomes que tenham letra S independente da ordem
SELECT * FROM Atleta WHERE nome LIKE '%s%';

-- Verificar apenas nomes que comecem com D
SELECT * FROM Atleta WHERE nome LIKE 'd%';

-- Verificar apenas nomes que terminem com O
SELECT * FROM Atleta WHERE nome LIKE '%o';

-- Verificar apenas nomes que tenham R em penultimo
SELECT * FROM Atleta WHERE nome LIKE '%r_';

-- Excluir a tabela
DROP TABLE Atleta;



-- Segunda Atividade:
-- Criar a tabela de Música
CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

-- Inserir os dados das musicas
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

-- Verificar a tabela
SELECT * FROM Musica;

-- Verificar apenas os titulos e os artistas das musicas
SELECT titulo, artista FROM Musica;

-- Verificar os dados da musica de um determinado genero
SELECT * FROM Musica WHERE genero LIKE 'INDIE';

-- Verificar os dados da musica de um determinado artista
SELECT * FROM Musica WHERE artista = 'Joji';

-- Verificar os dados da tabela em ordem crescente pelo titulo
SELECT * FROM Musica ORDER BY titulo ASC;

-- Verificar os dados da tabela em ordem decrescente pelo artista
SELECT * FROM Musica ORDER BY artista DESC;

-- Verificar os dados da tabela onde o titulo comece por uma determinada letra
SELECT * FROM Musica WHERE titulo LIKE 'b%';

-- Verificar os dados da tabela onde o nome do artista comece por uma determinada letra
SELECT * FROM Musica WHERE artista LIKE 'j%';

-- Verificar os dados da tabela onde um genero tenha como segunda letra uma determinada letra
SELECT * FROM Musica WHERE genero LIKE '_e%';

-- Verificar os dados da tabela onde o titulo tenha uma penultima letra especifica
SELECT * FROM Musica WHERE titulo LIKE '%o_';

-- Excluir a tabela
DROP TABLE Musica;



-- Terceira Atividade:
-- Criar a tabela de Filme
CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
);

-- Inserir os dados da tabela de filmes
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

-- Verificar os dados da tabela
SELECT * FROM Filme;

-- Verificar apenas os titulos e diretores dos filmes
SELECT titulo, diretor FROM Filme;

-- Verificar apenas os filmes de um determinado genero
SELECT * FROM Filme WHERE genero = 'Drama';

-- Verificar apenas os filmes de um determinado diretor
SELECT * FROM Filme WHERE diretor = 'Peter Jackson';

-- Verificar os dados da tabela em ordem crescente pelo titulo
SELECT * FROM Filme ORDER BY titulo ASC;

-- Verificar os dados da tabela em ordem decrescente pelo diretor
SELECT * FROM Filme ORDER BY diretor DESC;

-- Verificar os dados da tabela onde um titulo comece com uma letra especifica
SELECT * FROM Filme WHERE titulo LIKE 'o%';

-- Verificar os dados da tabela onde um diretor termine com uma letra especifica// NO PDF DIZ ARTISTA MAS TROQUEI PARA DIRETOR PRA FICAR CERTO
SELECT * FROM Filme WHERE diretor LIKE '%n';

-- Verificar os dados da tabela onde o genero tenha como segunda letra uma letra especifica
SELECT * FROM Filme WHERE genero LIKE '_c%';

-- Verificar os dados da tabela onde o titulo tenha uma penultima letra especifica
SELECT * FROM Filme WHERE titulo LIKE '%e_';

-- Excluir a tabela
DROP TABLE Filme;



-- Quarta Atividade:
-- Criar a tabela Professor
CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
	nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
);

-- Inserir dados da tabela Professor
-- Data ta inserida como AAAA-MM-DD
INSERT INTO Professor VALUE
	('1', 'Vivian', 'Banco de Dados', '1983-10-13'),
	('2', 'Monica', 'Tecnologia da Informação', '1984-12-01'),
	('3', 'Chola', 'Arquitetura Computacional', '1983-01-02'),
	('4', 'Fernanda', 'Pesquisa e Inovação', '1994-02-12'),
	('5', 'Yoshi', 'Algoritmos', '1994-11-15'),
	('6', 'Vera', 'Socio Emocional', '1990-08-03');
    
-- Verificar os dados da tabela
SELECT * FROM Professor;

-- Verificar apenas as especialidades dos professors
SELECT especialidade FROM Professor;

-- Verificar os dados dos professor de uma especialidade especifica
SELECT * FROM Professor WHERE especialidade = 'Algoritmos';

-- Verificar os dados em ordem crescente pelo nome do professor
SELECT * FROM Professor ORDER BY nome ASC;

-- Verificar os dados da tabela em ordem decrescente pela dtNasc
SELECT * FROM Professor ORDER BY dtNasc DESC;

-- Verificar os dados onde o nome comece com uma letra especifica
SELECT * FROM Professor WHERE nome LIKE 'v%';

-- Verificar os dados onde o nome termine com uma letra especifica
SELECT * FROM Professor WHERE nome LIKE '%a';

-- Verificar os dados onde a segunda letra seja especifica
SELECT * FROM Professor WHERE nome LIKE '_o%';

-- Verificar os dados onde a penultima letra seja especifica
SELECT * FROM Professor WHERE nome LIKE '%c_';

-- Excluir a tabela
DROP TABLE Professor;



-- Quinta Atividade:
-- Criar a tabela Curso
CREATE TABLE Curso (
	idCurso INT PRIMARY KEY,
    nome VARCHAR(50),
    sigla VARCHAR(3),
    coordenador VARCHAR(40)
);

-- Inserir os dados da tabela
INSERT INTO Curso VALUES
	('1', 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Monica'),
	('2', 'Ciência da Computação', 'CCI', 'Thiago'),
    ('3', 'Sistema da Informação', 'SIS', 'Matue');

-- Verificar todos os dados da tabela
SELECT * FROM Curso;

-- Verificar os dados apenas dos coordenadores
SELECT coordenador FROM Curso;

-- Verificar os dados de uma sigla especifica
SELECT * FROM Curso WHERE sigla = 'ADS';

-- Verificar os dados dos nomes em ordem crescente
SELECT * FROM Curso ORDER BY nome ASC;

-- Verificar os dados dos coordenadores em ordem decrescente
SELECT * FROM Curso ORDER BY coordenador DESC;

-- Verificar os dados dos nomes do curso que comecem com uma letra especifica
SELECT * FROM Curso WHERE nome LIKE 'a%';

-- Verificar os dados dos nomes do curso onde a ultima letra seja especifica
SELECT * FROM Curso WHERE nome LIKE '%o';

-- Verificar os dados dos nomes do curso onde a segunda letra seja especifica
SELECT * FROM Curso WHERE nome LIKE '_i%';

-- Verificar os dados dos nomes do curso onde a penultima letra seja especifica
SELECT * FROM Curso WHERE nome LIKE '%a_';

-- Excluir a tabela
DROP TABLE Curso;




-- Sexta Atividade:
-- Criar a tabela Revista
CREATE TABLE Revista (
	idRevista INT PRIMARY KEY,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

-- Inserir os dados da revista
INSERT INTO Revista VALUES
	('1', 'Revista Placar', null ),
	('2', 'Revista Invicto', null ),
	('3', 'Revista ESPN Brasil', null ),
	('4', 'Revista Hardcore', null );
    
-- Verificar todos os dados
SELECT * FROM Revista;

-- Atualizar as categorias das 4 revistas inseridas
UPDATE Revista SET categoria = 'Esporte' WHERE idRevista in ('1', '2', '3', '4');

-- Verificar todos os dados
SELECT * FROM Revista;

INSERT INTO Revista VALUES
	('5', 'Veja', 'Politica'),
	('6', 'Isto É', 'Noticias'),
	('7', 'Epoca', 'Noticias');
    
-- Verificar todos os dados
SELECT * FROM Revista;

-- Descrever a estrutura da tabela
DESCRIBE Revista;

-- Alterar a tabela pra coluna categoria ter 40 caracteres
ALTER TABLE Revista MODIFY COLUMN categoria VARCHAR(40);

-- Descrever a estrutura da tabela
DESC Revista;

-- Acrescentar a coluna periodicidade a tabela
ALTER TABLE Revista ADD periodicidade VARCHAR(15);

-- Verificar todos os dados
SELECT * FROM Revista;

-- Excluir a coluna periodicidade da tabela
ALTER TABLE Revista DROP COLUMN periodicidade;

-- Excluir o database
DROP DATABASE sprint1;