SELECT
    a.estado,
    a.cidade,
    a.instituicao,
    AVG(aa.notas) AS media_notas
FROM Aulas_assistidas aa
JOIN Aula a ON a.aulaID = aa.aulaID
GROUP by ROLLUP
    (a.estado,
    a.cidade,
    a.instituicao);