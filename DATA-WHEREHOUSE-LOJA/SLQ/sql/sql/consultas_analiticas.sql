-- Total de compras por ano
SELECT d.ano, SUM(f.valor) AS total_anual
FROM fato_compras f
JOIN dim_data d ON f.data_key = d.data_key
GROUP BY d.ano
ORDER BY d.ano;

-- Produtos mais vendidos (por quantidade de compras)
SELECT p.nome, COUNT(*) AS quantidade_vendida
FROM fato_compras f
JOIN dim_produto p ON f.produto_key = p.produto_key
GROUP BY p.nome
ORDER BY quantidade_vendida DESC
LIMIT 10;

-- Compras por estado
SELECT c.estado, SUM(f.valor) AS total
FROM fato_compras f
JOIN dim_cliente c ON f.cliente_key = c.cliente_key
GROUP BY c.estado
ORDER BY total DESC;

-- Média de valor por forma de pagamento
SELECT forma_pagamento, AVG(valor) AS media_valor
FROM fato_compras
GROUP BY forma_pagamento;
