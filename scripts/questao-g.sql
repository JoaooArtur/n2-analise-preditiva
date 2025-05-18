-- Esta query calcula a média das notas das aulas assistidas, agrupando os dados usando o operador `CUBE`.
-- Diferente do `ROLLUP`, que gera apenas totais hierárquicos (em ordem), o `CUBE` gera **todas** as combinações
-- possíveis entre os campos agrupados, incluindo totais e subtotais em qualquer ordem:
--
-- Combinações geradas incluem, por exemplo:
-- - Média por estado + cidade + instituição (mais específica)
-- - Média por estado + cidade (todas instituições)
-- - Média por estado + instituição (todas cidades)
-- - Média por cidade + instituição (todos estados)
-- - Média por estado (todas cidades e instituições)
-- - Média por cidade (todos estados e instituições)
-- - Média por instituição (todos estados e cidades)
-- - Total geral (sem nenhum agrupamento, todos os dados)
--
-- As colunas com `NULL` no resultado indicam os totais ou subtotais correspondentes.

SELECT
    a.estado,                              -- Estado onde a aula ocorreu
    a.cidade,                              -- Cidade da aula
    a.instituicao,                         -- Instituição responsável pela aula
    AVG(aa.notas) AS media_notas          -- Média das notas atribuídas nas aulas
FROM Aulas_assistidas aa
JOIN Aula a ON a.aulaID = aa.aulaID       -- Relaciona a aula assistida com os dados da aula
GROUP BY CUBE (
    a.estado,                              -- Campo 1: Estado
    a.cidade,                              -- Campo 2: Cidade
    a.instituicao                          -- Campo 3: Instituição
);
