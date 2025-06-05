 # 📦 Data Warehouse - Loja Portas & Janelas

> Repositório do projeto de Data Warehouse desenvolvido como parte do Projeto Integrador (PI) 2025 – Ciência da Computação – UNIFEOB.

---

## 🧠 Visão Geral

Este projeto tem como objetivo centralizar e analisar os dados operacionais de uma loja de portas e janelas, utilizando um modelo estrela em PostgreSQL, com processos de ETL automatizados em Python e consultas SQL analíticas para geração de relatórios estratégicos.

---

## ⭐ Modelo Estrela

- **Fato:** Compras  
- **Dimensões:** Data, Cliente, Produto

---

## 🛠️ Tecnologias Utilizadas

- 🐘 **PostgreSQL** – Banco de dados analítico
- ☁️ **Neon** – Plataforma PostgreSQL em nuvem (hospedagem online)
- 🐍 **Python** – Scripts de ETL (em desenvolvimento)
- 📊 **SQL** – Consultas analíticas
- 🔐 **Roles & Permissões** – Controle de acesso

---

## 📂 Estrutura do Projeto

data-warehouse-loja/
├── sql/
│ ├── criacao_tabelas.sql # Estrutura do DW
│ ├── consultas_analiticas.sql # Relatórios e análises
│ └── permissoes_roles.sql # Gestão de usuários e permissões
├── imagens/
│ └── modelo-estrela.png # Diagrama da modelagem
└── README.md

---


---

## 🔄 Processo ETL (Exemplo)

- **Extração:** Dados das tabelas de produção
- **Transformação:** Limpeza e padronização de dados
- **Carga:** Inserção nas tabelas fato e dimensão

> *(Script `etl_processo.py` poderá ser incluído futuramente)*

---

## 📈 Consultas Analíticas

Inclui exemplos de:

- Vendas por ano
- Produtos mais vendidos
- Faturamento por estado
- Análise de formas de pagamento

---

## 🔐 Permissões no Banco de Dados

Configuração de usuários com diferentes acessos:

| Role              | Permissões              |
|-------------------|--------------------------|
| `etl_user`        | INSERT, UPDATE, DELETE   |
| `analista_dados`  | SELECT (somente leitura) |

---

## ☁️ Implantação em Nuvem

O banco de dados foi hospedado gratuitamente na plataforma **[Neon](https://neon.tech/)**, permitindo acesso remoto e online para testes e validações do projeto.

---

## 👨‍💻 Desenvolvido por

**Cleudio de Faria**  
Aluno de Ciência da Computação – UNIFEOB  
📧 cleudio123@gmail.com  
📱 (19) 98121-6013 *(WhatsApp)*

---

## 🌐 Licença

Este projeto é acadêmico e pode ser usado livremente para fins educacionais.

---

⭐ Se você gostou do projeto, não esqueça de deixar uma estrela!



