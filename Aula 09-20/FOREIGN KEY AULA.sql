CREATE DATABASE domingos;

USE domingos;

CREATE TABLE funcionario (
	idFunc INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    SALARIO DECIMAL(10,2),
    fkSuper INT,
    CONSTRAINT fkSupervisor FOREIGN KEY (fkSuper)
		REFERENCES funcionario (idFunc)
);

CREATE TABLE dependente (
	idDep INT,
    fkFunc INT,
    FOREIGN KEY (fkFunc) REFERENCES funcionario(idFunc),
    PRIMARY KEY (idDep, fkFunc),
    nome VARCHAR(45),
    parentesco VARCHAR(45)
);

-- criar um funcionario supervisor
INSERT INTO funcionario VALUES 
	(null, 'Domingos', 8.99, null);
    
SELECT * FROM funcionario;

-- inserir os funcionarios supervisionados pelo Domingos
INSERT INTO funcionario VALUES
	(null, 'Vivian', 1.99, 1),
	(null, 'Paulo', 1.99, 1);

INSERT INTO funcionario (nome, salario, fkSuper) VALUES
	('Thiago', 0.09, 2);
    
SELECT * FROM funcionario;

INSERT INTO dependente VALUES
	(1, 1, 'Sábado', 'esposa'),
	(1, 2, 'Betinha', 'mãe');
    
SELECT * FROM dependente;

INSERT INTO dependente VALUES
	(2, 1, 'Feriado', 'pai'),
	(1, 4, 'Tânia', 'irmã');
    
 SELECT f.nome as NomeFunc,
		s.nome as NomeSuper,
        d.nome as NomeDep
        FROM funcionario as f 
		 JOIN funcionario as s
			ON f.fkSuper = s.idFunc
		 JOIN dependente as d
			ON d.fkFunc = s.idFunc;