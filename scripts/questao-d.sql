-- Esta query calcula a média das notas obtidas por cada estudante, agrupadas por nome e curso.
-- Ou seja, mostra a média de desempenho de cada aluno dentro de seu respectivo curso,
-- com base nas aulas que ele assistiu, conforme a tabela Aulas_assistidas.

SELECT
    e.nome                    AS nome_estudante,              -- Nome do aluno
    e.curso                   AS curso,                       -- Curso ao qual o aluno pertence
    AVG(aa.notas)             AS media_por_estudante_no_curso-- Média das notas obtidas pelo aluno nas aulas assistidas
FROM Aulas_assistidas aa
JOIN Estudante e ON e.estudanteID = aa.estudanteID           -- Relaciona a aula assistida ao estudante
GROUP BY
    e.nome,                                                    -- Agrupa por nome do estudante
    e.curso;                                                   -- E também por curso (caso haja nomes repetidos em cursos diferentes)
