-- Criação do esquema
CREATE SCHEMA IF NOT EXISTS loja_dw;
SET search_path TO loja_dw;

-- Tabela Fato: Compras
CREATE TABLE fato_compras (
    id SERIAL PRIMARY KEY,
    data_key INT NOT NULL,
    cliente_key INT NOT NULL,
    produto_key INT NOT NULL,
    forma_pagamento VARCHAR(50),
    valor NUMERIC(10,2),
    data_entrega DATE
);

-- Dimensão: Data
CREATE TABLE dim_data (
    data_key INT PRIMARY KEY,
    data_completa DATE,
    dia INT,
    mes INT,
    ano INT,
    dia_semana VARCHAR(15)
);

-- Dimensão: Cliente
CREATE TABLE dim_cliente (
    cliente_key SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(50)
);

-- Dimensão: Produto
CREATE TABLE dim_produto (
    produto_key SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco NUMERIC(10,2),
    marca VARCHAR(100)
);
