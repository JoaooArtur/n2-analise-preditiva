-- Esta query calcula a média das notas das aulas assistidas, agrupadas por:
-- 1. Estado
-- 2. Cidade
-- 3. Instituição
--
-- Com o uso de `ROLLUP`, a query também fornece subtotais e um total geral:
-- - Média por instituição dentro da cidade e estado.
-- - Média por cidade (somando todas as instituições daquela cidade).
-- - Média por estado (somando todas as cidades daquele estado).
-- - Média geral (todas as notas de todas as localidades).
--
-- Quando os campos `estado`, `cidade` ou `instituicao` aparecem como NULL no resultado,
-- isso indica uma linha de subtotal ou total.

SELECT
    a.estado,                              -- Estado onde a aula ocorreu
    a.cidade,                              -- Cidade da aula
    a.instituicao,                         -- Instituição responsável pela aula
    AVG(aa.notas) AS media_notas           -- Média das notas atribuídas nas aulas
FROM Aulas_assistidas aa
JOIN Aula a ON a.aulaID = aa.aulaID       -- Relaciona a aula assistida com os dados da aula
GROUP BY ROLLUP (
    a.estado,                              -- Nível mais alto do agrupamento
    a.cidade,                              -- Nível intermediário
    a.instituicao                          -- Nível mais específico
);
