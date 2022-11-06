CREATE DATABASE venda;

USE venda;

-- tabela clientes onde tem um autorelacionamento com cliente indicado
CREATE TABLE cliente (
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    fkIndicador INT,
    FOREIGN KEY (fkIndicador) REFERENCES cliente (idCliente)
);

-- tabela de produtos
CREATE TABLE produto (
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(45),
    preco DECIMAL(10,2)
);

-- tabela de vendas onde leva a fkCliente com relação fraca pois a venda depende do cliente para existir
CREATE TABLE venda (
	idVenda INT AUTO_INCREMENT,
    totalVenda DECIMAL(10,2),
    dataVenda DATE,
    fkCliente INT,
    PRIMARY KEY (idVenda, fkCliente),
    FOREIGN KEY (fkCliente) REFERENCES cliente (idCliente)
);

-- tabela endereços
CREATE TABLE endereco (
	idEnd INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(9),
    bairro VARCHAR(45),
    cidade VARCHAR(45)
);

-- tabela endereço completo, com relaçao n to n, pois varios clientes podem morar no mesmo local
CREATE TABLE enderecoCompleto (
	fkEnd INT,
    fkCliente INT,
    numero INT,
    complemento VARCHAR(45),
    FOREIGN KEY (fkEnd) REFERENCES endereco (idEnd),
    FOREIGN KEY (fkCliente) REFERENCES cliente (idCliente),
    PRIMARY KEY (fkEnd, fkCliente)
);

-- tabela de vendaFinal onde leva todo o processo da venda para que não seja redundante, mais os descontos
CREATE TABLE vendaFinal (
	idVendaFinal INT AUTO_INCREMENT,
    fkVenda INT,
    fkCliente INT,
    fkProduto INT,
    quantidade INT,
    desconto DECIMAL(10,2),
    PRIMARY KEY (idVendaFinal, fkVenda, fkCliente, fkProduto),
    FOREIGN KEY (fkVenda) REFERENCES venda (idVenda),
    FOREIGN KEY (fkCliente) REFERENCES cliente (idCliente),
    FOREIGN KEY (fkProduto) REFERENCES produto (idProduto)
);

INSERT INTO cliente (nome, email, fkIndicador) VALUES 
	('Diego', 'diego.vieira@sptech.school', null),
	('Lucas', 'lucas.bonfim@sptech.school', 1),
	('Igor', 'igor.gabriel@sptech.school', 1),
	('Victor', 'victor.augusto@sptech.school', 2),
	('Estela', 'estela.polverini@sptech.school', 2);
    
INSERT INTO produto (nome, descricao, preco) VALUES
	('Caneta', 'Caneta Preta', 3.00),
	('Caderno', 'Caderno Cicero', 7.50),
	('Lápis', 'Lápis de Escrever', 2.00),
	('Borracha', 'Borracha Escolar', 1.00),
	('Lápis de Cor', 'Lápis de Colorir', 6.00),
	('Estojo', 'Estojo para Material Escolar', 3.00),
	('Apontador', 'Apontador Escolar', 1.00),
	('Régua', 'Régua Escolar', 4.00);
    
INSERT INTO venda (totalVenda, dataVenda, fkCliente) VALUES
	(12.00, '2022-10-10', 1),
	(7.50, '2022-11-10', 1),
	(6.00, '2022-10-10', 2),
	(1.00, '2022-10-10', 2),
	(2.00, '2022-09-10', 3),
	(4.00, '2022-10-10', 3),
	(3.00, '2022-10-11', 4),
	(6.00, '2022-10-10', 4),
	(15.00, '2022-10-22', 5),
	(1.00, '2022-10-23', 5);
    
INSERT INTO endereco (cep, bairro, cidade) VALUES
	('08583-440', 'Parque Piratininga', 'Itaquaquecetuba'),
	('01929-234', 'Cohab', 'Itapevi'),
	('05464-345', 'Chacará Klabin', 'Vila Mariana'),
	('02398-456', 'Belenzinho', 'Belém');
    
INSERT INTO enderecoCompleto VALUES
	(1, 1, 337, 'Frente a Praça'),
	(2, 2, 653, 'Cohab'),
	(3, 3, 321, 'Perto Mecanica'),
    (1, 4, 336, 'Frente a Praça'),
	(4, 5, 545, 'Apartamento');
    
INSERT INTO vendaFinal (fkVenda, fkCliente, fkProduto, quantidade, desconto) VALUES
	(1, 1, 5, 2, 3.00),
	(2, 1, 2, 1, 1.00),
	(3, 2, 6, 2, 2.00),
	(4, 2, 4, 1, 0.00),
	(5, 3, 3, 1, 0.50),
	(6, 3, 8, 1, 1.00),
	(7, 4, 1, 1, 0.00),
	(8, 4, 5, 1, 1.00),
	(9, 5, 2, 2, 4.00),
	(10, 5, 7, 2, 0.00);
    
-- e) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM venda;
SELECT * FROM endereco;
SELECT * FROM enderecoCompleto;
SELECT * FROM vendaFinal;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.

-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
SELECT * FROM cliente as c JOIN venda as v ON v.fkCliente = c.idCliente;

-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
SELECT * FROM cliente as c JOIN venda as v ON v.fkCliente = c.idCliente JOIN vendaFinal as vf ON vf.fkCliente = c.idCliente  WHERE c.nome = 'Diego';

-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.
SELECT * FROM cliente as c JOIN cliente as ci ON c.fkIndicador = ci.idCliente;

-- j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes 
-- indicadores, porém somente de um determinado cliente indicador (informar o nome 
-- do cliente que indicou na consulta).
SELECT * FROM cliente as c JOIN cliente as ci ON c.fkIndicador = ci.idCliente WHERE c.nome = 'Lucas';

-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos
SELECT p.nome, c.*, ci.*, v.* FROM cliente as c 
LEFT JOIN cliente as ci ON c.idCliente = ci.fkIndicador
JOIN venda as v ON v.fkCliente = c.idCliente
JOIN vendaFinal as vf ON vf.fkCliente = c.idCliente 
JOIN produto as p ON vf.fkProduto = p.idProduto;

-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
SELECT v.dataVenda 'Data', p.nome 'NomeProduto', vf.quantidade 'Quantidade' FROM venda as v JOIN vendaFinal as vf
	ON v.idVenda = vf.fkVenda JOIN produto as p ON p.idProduto = vf.fkProduto WHERE v.idVenda = 1;

-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.
SELECT p.nome 'NomeProduto', p.preco 'ValorProduto', SUM(vf.quantidade) 'QuantidadeVendida' FROM produto as p JOIN
	vendaFinal as vf ON p.idProduto = vf.fkProduto GROUP BY p.nome;
    
-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.
INSERT INTO cliente (nome, email, fkIndicador) VALUES
	('Nathan', 'nathan@sptech.school', 1);
INSERT INTO enderecoCompleto VALUES
	(1, 6, 456,'Frente a Praça');
SELECT * FROM cliente as c LEFT JOIN venda as v ON c.idCliente = v.fkCliente;

-- p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;
SELECT max(p.preco) 'Maior Preço', min(preco) 'Menor Preço' FROM produto as p;

-- q) Exibir a soma e a média dos preços dos produtos;
SELECT SUM(preco)'Soma', AVG(preco) 'Média' FROM produto;

-- r) Exibir a quantidade de preços acima da média entre todos os produtos;
SELECT COUNT(preco) 'Quantidade de Preços Acima da Média' FROM produto WHERE preco > (select AVG(preco) from produto);

-- s) Exibir a soma dos preços distintos dos produtos;
SELECT SUM(distinct preco) 'Soma dos Preços Distintos' FROM produto;

-- t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
SELECT SUM(p.preco) FROM produto as p
JOIN vendaFinal as vf ON p.idProduto = vf.fkProduto  WHERE fkProduto = 5;