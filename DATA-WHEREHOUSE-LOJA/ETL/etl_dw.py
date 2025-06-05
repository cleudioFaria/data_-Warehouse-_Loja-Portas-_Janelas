import pandas as pd
from sqlalchemy import create_engine
import mysql.connector
from datetime import datetime

# 1️⃣ Conexão com MySQL (ajuste com seus dados locais)
mysql_conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="admin123",
    database="sistema_loja"
)

# 2️⃣ Conexão com PostgreSQL (Neon)
pg_engine = create_engine("postgresql+psycopg2://neondb_owner:npg_UhcS9pgEjJC8@ep-frosty-mouse-a8ajuw4l-pooler.eastus2.azure.neon.tech/neondb?sslmode=require")

# 3️⃣ Extração dos dados
clientes = pd.read_sql("SELECT id AS id_cliente, nome, cidade, cpf_cnpj FROM clientes", mysql_conn)
produtos = pd.read_sql("SELECT id AS id_produto, nome, tipo, preco FROM produtos", mysql_conn)
compras = pd.read_sql("SELECT * FROM compras", mysql_conn)

# 4️⃣ Transformação da dimensão tempo
datas = pd.concat([compras['data_compra'], compras['data_entrega']]).dropna().drop_duplicates()
dim_tempo = pd.DataFrame({'data': datas})
dim_tempo['ano'] = pd.to_datetime(dim_tempo['data']).dt.year
dim_tempo['mes'] = pd.to_datetime(dim_tempo['data']).dt.month
dim_tempo['dia'] = pd.to_datetime(dim_tempo['data']).dt.day
dim_tempo['trimestre'] = pd.to_datetime(dim_tempo['data']).dt.quarter
dim_tempo.reset_index(drop=True, inplace=True)

# 5️⃣ Carga das dimensões no PostgreSQL
clientes.to_sql("dim_clientes", pg_engine, if_exists='replace', index=False)
produtos.to_sql("dim_produtos", pg_engine, if_exists='replace', index=False)
dim_tempo.to_sql("dim_tempo", pg_engine, if_exists='replace', index_label='id_tempo')

# 6️⃣ Gerar IDs de tempo para a fato_compras
def buscar_id_data(data):
    if pd.isnull(data): return None
    row = dim_tempo[dim_tempo['data'] == data]
    return row.index[0] if not row.empty else None

compras['id_data_compra'] = compras['data_compra'].apply(buscar_id_data)
compras['id_data_entrega'] = compras['data_entrega'].apply(buscar_id_data)

# 7️⃣ Montar a tabela fato
fato_compras = compras.rename(columns={
    'cliente_id': 'id_cliente',
    'produto_id': 'id_produto',
    'valor': 'valor_total',
    'forma_pagamento': 'forma_pagamento'
})[['id_cliente', 'id_produto', 'id_data_compra', 'id_data_entrega', 'valor_total', 'forma_pagamento']]

# 8️⃣ Carregar a fato_compras no DW
fato_compras.to_sql("fato_compras", pg_engine, if_exists='replace', index=False)

print("✅ ETL concluído com sucesso! As tabelas foram carregadas no Neon.")
