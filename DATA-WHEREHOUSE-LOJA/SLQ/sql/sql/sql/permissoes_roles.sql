-- Criação de roles
CREATE ROLE etl_user LOGIN PASSWORD 'senha_segura';
CREATE ROLE analista_dados LOGIN PASSWORD 'senha_analista';

-- Permissões para o usuário de ETL
GRANT USAGE ON SCHEMA loja_dw TO etl_user;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA loja_dw TO etl_user;

-- Permissões para o analista de dados (somente leitura)
GRANT USAGE ON SCHEMA loja_dw TO analista_dados;
GRANT SELECT ON ALL TABLES IN SCHEMA loja_dw TO analista_dados;

-- Permitir acesso a novas tabelas criadas futuramente
ALTER DEFAULT PRIVILEGES IN SCHEMA loja_dw
GRANT SELECT ON TABLES TO analista_dados;

ALTER DEFAULT PRIVILEGES IN SCHEMA loja_dw
GRANT INSERT, UPDATE, DELETE ON TABLES TO etl_user;
