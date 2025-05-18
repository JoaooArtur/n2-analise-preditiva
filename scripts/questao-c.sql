-- Esta query calcula a média das notas atribuídas pelos instrutores em aulas assistidas por alunos,
-- considerando apenas aulas realizadas na cidade de 'Joinville'.
-- Os resultados são agrupados por instrutor e, com o uso de ROLLUP, também inclui um total geral (média geral das notas).
-- Isso significa que além da média por instrutor, a última linha da consulta mostrará a média geral de todas as notas.

SELECT
    i.instrutorID                     AS instrutor,    -- ID do instrutor (poderá aparecer como NULL na linha de total geral)
    AVG(aa.notas)                     AS media_notas   -- Média das notas atribuídas em Joinville
FROM Aulas_assistidas aa
JOIN Estudante e ON e.estudanteID     = aa.estudanteID   -- Relaciona a aula assistida ao aluno
JOIN Instrutor i ON i.instrutorID     = aa.instrutorID   -- Relaciona a aula assistida ao instrutor
JOIN Aula a      ON a.aulaID          = aa.aulaID        -- Relaciona a aula assistida aos dados da aula
WHERE a.cidade = 'Joinville'                             -- Considera apenas aulas ocorridas em Joinville
GROUP BY ROLLUP (i.instrutorID);                         -- Agrupa por instrutor e inclui a média geral na última linha
