-- criação da tabela Aluno
CREATE TABLE Aluno (
  id INTEGER PRIMARY KEY,
  nome TEXT NOT NULL
);
-- insert some values
INSERT INTO Aluno VALUES (1, 'Lucas');

-- fetch some values
SELECT * FROM Aluno;

-- criação da tabela Responsavel
CREATE TABLE Responsavel (
  id INTEGER PRIMARY KEY,
  nome TEXT NOT NULL
);
-- insert some values
INSERT INTO Responsavel VALUES (1, 'Pablo');
INSERT INTO Responsavel VALUES (2, 'Brenda');
INSERT INTO Responsavel VALUES (3, 'Tereza');
INSERT INTO Responsavel VALUES (4, 'Andres');
INSERT INTO Responsavel VALUES (5, 'Pedro');
-- fetch some values
SELECT * FROM Responsavel;

-- criação da tabela Parentesco
CREATE TABLE Parentesco (
    idResponsavel INT,
    idAluno INT,
    parentesco TEXT NOT NULL,

    FOREIGN KEY (idResponsavel) REFERENCES Responsavel(id),
    FOREIGN KEY (idAluno) REFERENCES Aluno(id)
);

INSERT INTO Parentesco VALUES (1, 1, 'Pai');
INSERT INTO Parentesco VALUES (2, 1, 'Mae');
INSERT INTO Parentesco VALUES (3, 1, 'Avó');
INSERT INTO Parentesco VALUES (4, 1, 'Tio');
INSERT INTO Parentesco VALUES (5, 1, 'Irmao');

SELECT Al.nome as Aluno, Rs.nome as Responsavel_1, Pr.parentesco as Parentesco
FROM Parentesco as Pr
join Aluno as Al on Al.id = Pr.idAluno 
join Responsavel as Rs on Rs.id = Pr.idResponsavel;

--Mostra ponto 2
SELECT
    al.nome AS nome_aluno,
    r1.nome AS responsavel1,
    pr1.parentesco as P1,
    r2.nome AS responsavel2,
    pr2.parentesco as P2
FROM Aluno al
LEFT JOIN Parentesco pr1 ON al.id = pr1.idAluno AND pr1.parentesco = 'Pai'
LEFT JOIN Responsavel r1 ON pr1.idResponsavel = r1.id
LEFT JOIN Parentesco pr2 ON al.id = pr2.idAluno AND pr2.parentesco = 'Mae'
LEFT JOIN Responsavel r2 ON pr2.idResponsavel = r2.id;

SELECT Al.nome as Aluno, Rs.nome as Responsavel_1, Pr.parentesco as Parentesco
FROM Parentesco as Pr
join Aluno as Al on Al.id = Pr.idAluno 
join Responsavel as Rs on Rs.id = Pr.idResponsavel;

SELECT
    al.nome AS nome_aluno,
    r1.nome AS responsavel1,
    pr1.parentesco as P1,
    r2.nome AS responsavel2,
    pr2.parentesco as P2
FROM Aluno al
LEFT JOIN Parentesco pr1 ON al.id = pr1.idAluno AND pr1.parentesco = 'Pai'
LEFT JOIN Responsavel r1 ON pr1.idResponsavel = r1.id
LEFT JOIN Parentesco pr2 ON al.id = pr2.idAluno AND pr2.parentesco = 'Mae'
LEFT JOIN Responsavel r2 ON pr2.idResponsavel = r2.id;

--Mostra ponto 3 (Minha Versão)
SELECT
    al.nome AS nome_aluno,
    r1.nome AS responsavel1,
    pr1.parentesco as P1,
    r2.nome AS responsavel2,
    pr2.parentesco as P2,
    (SELECT GROUP_CONCAT((rr.nome||'_'|| pp.parentesco), ', ') FROM parentesco pp LEFT JOIN Responsavel rr ON pp.idResponsavel = rr.id WHERE pp.idAluno = al.id and (pp.parentesco <> 'Pai' and pp.parentesco <> 'Mae'))as demais
FROM Aluno al
LEFT JOIN Parentesco pr1 ON al.id = pr1.idAluno AND pr1.parentesco = 'Pai'
LEFT JOIN Responsavel r1 ON pr1.idResponsavel = r1.id
LEFT JOIN Parentesco pr2 ON al.id = pr2.idAluno AND pr2.parentesco = 'Mae'
LEFT JOIN Responsavel r2 ON pr2.idResponsavel = r2.id;


