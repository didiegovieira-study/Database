CREATE DATABASE estudo1;

USE estudo1;

CREATE TABLE estudo (
	id int primary key auto_increment,
    nome varchar(40),
    area varchar(30),
    cargo varchar(30)
);

ALTER TABLE estudo ADD CONSTRAINT chkCargo CHECK (cargo in ("junior", "pleno", "senior"));
ALTER TABLE estudo ADD CONSTRAINT chkArea CHECK (area in ("front-end", "back-end"));

INSERT INTO estudo (nome, area, cargo) VALUES  
('diego', 'back-end', 'senior'),
('victor', 'back-end', 'pleno'),
('lucas', 'front-end', 'junior'),
('igor', 'back-end', 'pleno'),
('matheus', 'front-end', 'junior'),
('estela', 'front-end', 'senior');

-- INSERT INTO estudo (nome, area, cargo) VALUES
-- ('amanda', 'front', 'pleno');
-- nao funciona pois inflinge a CONSTRAINT.

ALTER TABLE estudo DROP CONSTRAINT chkArea;

DESC estudo;

SELECT * FROM estudo;
SELECT id FROM estudo;
SELECT * FROM estudo WHERE id = 1;
SELECT * FROM estudo ORDER BY nome ASC;
SELECT * FROM estudo WHERE nome like '%s';

TRUNCATE TABLE estudo;

SELECT * FROM estudo;

DROP TABLE estudo;

DROP DATABASE estudo1;





