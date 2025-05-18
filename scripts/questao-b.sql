-- Esta query calcula a média das notas que cada aluno recebeu em aulas ministradas por diferentes instrutores,
-- considerando apenas aulas realizadas na cidade de 'Joinville'.
-- Os resultados são agrupados por aluno e por instrutor, ou seja, mostra a média de notas por par aluno-instrutor.
-- As tabelas envolvidas são: Aulas_assistidas (dados das aulas que os alunos assistiram),
-- Estudante, Instrutor e Aula.

SELECT
    e.nome                  AS aluno,              -- Nome do aluno
    i.instrutorID           AS instrutor,          -- ID do instrutor responsável pela aula
    AVG(aa.notas)           AS media_notas         -- Média das notas que o aluno tirou com esse instrutor
FROM Aulas_assistidas aa
JOIN Estudante e ON e.estudanteID   = aa.estudanteID   -- Relaciona a aula assistida ao aluno
JOIN Instrutor i ON i.instrutorID   = aa.instrutorID   -- Relaciona a aula assistida ao instrutor
JOIN Aula a      ON a.aulaID        = aa.aulaID        -- Relaciona a aula assistida aos dados da aula
WHERE a.cidade = 'Joinville'                           -- Considera apenas aulas ocorridas em Joinville
GROUP BY
    e.nome,                                            -- Agrupa por aluno
    i.instrutorID;                                     -- E por instrutor
