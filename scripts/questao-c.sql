SELECT
    i.instrutorID                     AS instrutor,
    AVG(aa.notas)                     AS media_notas
FROM Aulas_assistidas aa
JOIN Estudante e ON e.estudanteID     = aa.estudanteID
JOIN Instrutor i ON i.instrutorID     = aa.instrutorID
JOIN Aula a      ON a.aulaID          = aa.aulaID
WHERE a.cidade = 'Joinville'
GROUP by ROLLUP
    (i.instrutorID);