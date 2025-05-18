SELECT
    e.nome                  AS aluno,
    e.curso       AS curso_estudante,
    i.instrutorID           AS instrutor,
    i.curso       AS curso_instrutor,
    AVG(aa.notas) AS media_notas
FROM Aulas_assistidas aa
JOIN Estudante e ON e.estudanteID = aa.estudanteID
JOIN Instrutor i ON i.instrutorID = aa.instrutorID
GROUP BY
    e.curso,
    i.instrutorID,
    i.curso,
	e.nome;