SELECT 
    e.nome AS nome_aluno,
    a.instituicao AS universidade,
    aa.notas AS pontuacao
FROM Estudante e
JOIN Aulas_assistidas aa  ON e.estudanteID = aa.estudanteID
JOIN Instrutor i           ON i.instrutorID = aa.instrutorID
JOIN Aula a                ON a.aulaID = aa.aulaID
WHERE a.estado = 'Santa Catarina'
  AND i.curso <> e.curso
  AND aa.notas > 70;
