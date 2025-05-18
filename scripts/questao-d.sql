SELECT
    e.nome                    AS nome_estudante,
    e.curso                   AS curso,
    AVG(aa.notas)            AS media_por_estudante_no_curso
FROM Aulas_assistidas aa
JOIN Estudante e ON e.estudanteID = aa.estudanteID
GROUP BY
    e.nome,
    e.curso;