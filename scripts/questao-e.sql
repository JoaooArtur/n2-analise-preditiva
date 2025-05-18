-- Esta query calcula a média das notas que cada aluno recebeu de cada instrutor,
-- agrupando os dados por:
-- - nome do aluno,
-- - curso do aluno,
-- - ID do instrutor e
-- - curso do instrutor.
--
-- Isso permite analisar, por exemplo, como alunos de um determinado curso têm se saído
-- com instrutores de outros cursos, comparando médias por combinação aluno-instrutor.

SELECT
    e.nome                  AS aluno,               -- Nome do aluno
    e.curso                 AS curso_estudante,     -- Curso ao qual o aluno pertence
    i.instrutorID           AS instrutor,           -- ID do instrutor responsável pelas aulas
    i.curso                 AS curso_instrutor,     -- Curso do instrutor
    AVG(aa.notas)           AS media_notas          -- Média das notas que o aluno recebeu deste instrutor
FROM Aulas_assistidas aa
JOIN Estudante e ON e.estudanteID = aa.estudanteID        -- Relaciona a aula assistida ao estudante
JOIN Instrutor i ON i.instrutorID = aa.instrutorID        -- Relaciona a aula assistida ao instrutor
GROUP BY
    e.curso,                                               -- Agrupa por curso do aluno
    i.instrutorID,                                         -- Por instrutor
    i.curso,                                               -- Por curso do instrutor
    e.nome;                                                -- E por nome do aluno
