-- Create Table A
CREATE TABLE A (
    matr INT PRIMARY KEY,
    Nome VARCHAR(50)
);

-- Create Table B
CREATE TABLE B (
    matr INT PRIMARY KEY,
    Endereço VARCHAR(50)
);

-- Populates Table A
INSERT INTO muzzi.a (matr, Nome) VALUES
(1111, 'Maria'),
(1112, 'Joana'),
(1113, 'José'),
(1114, NULL), -- Explicit NULL for empty "Nome"
(1115, 'Mário'),
(1116, 'Ana'),
(1117, 'Plínio');

	SELECT * FROM muzzi.a -- checking

-- Populates Table B
INSERT INTO b (matr, Endereço) VALUES
(1113, 'R. Morango'),
(1114, 'R. Abacate'),
(1115, 'R. Morango'),
(1116, NULL), -- Empty address → NULL
(1117, 'Av. Maçã'),
(1118, 'R. Pêra'),
(1119, 'R. Pitanga');

	SELECT * FROM muzzi.b; -- checking
	
/* exemplo de comentário */
    
-- Displays all 'matr' present in table a and also the ones that are present in table b
SELECT * FROM muzzi.a
LEFT JOIN muzzi.b
ON a.matr = b.matr
