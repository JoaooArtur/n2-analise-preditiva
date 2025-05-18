-- Esta query seleciona os nomes dos alunos, as universidades onde estudam e suas pontuações
-- em aulas específicas, com base nos seguintes critérios:
-- 1. A aula precisa ter ocorrido no estado de 'Santa Catarina'.
-- 2. O curso do instrutor da aula deve ser diferente do curso do estudante.
-- 3. O estudante deve ter obtido nota superior a 70 na aula.
-- Os dados são obtidos a partir de quatro tabelas: Estudante, Aulas_assistidas, Instrutor e Aula.
SELECT 
    e.nome AS nome_aluno,
    a.instituicao AS universidade,
    aa.notas AS pontuacao
FROM Estudante e
JOIN Aulas_assistidas aa  ON e.estudanteID = aa.estudanteID     -- Relaciona estudantes com as aulas que assistiram
JOIN Instrutor i           ON i.instrutorID = aa.instrutorID     -- Relaciona essas aulas aos instrutores responsáveis
JOIN Aula a                ON a.aulaID = aa.aulaID               -- Relaciona com os dados da aula
WHERE a.estado = 'Santa Catarina'                                -- Filtra apenas aulas que ocorreram em SC
  AND i.curso <> e.curso                                         -- Garante que o curso do instrutor seja diferente do do estudante
  AND aa.notas > 70;                                             -- Filtra alunos com pontuação acima de 70