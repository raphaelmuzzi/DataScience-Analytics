# 🗃️ Script SQL - Manipulação de Tabelas e LEFT JOIN

## 📌 Descrição
Este script SQL cria e manipula duas tabelas (`A` e `B`), insere dados e realiza consultas utilizando `LEFT JOIN`. Ele demonstra a integração entre diferentes conjuntos de dados, permitindo visualizar todas as matrículas presentes na tabela `A` e também as que existem na tabela `B`.

SUGESTÕES DE MELHORIAS SÃO MUITO BEM VINDAS!

---

## 🚀 Funcionalidades Principais
- 📌 **Criação de Tabelas**: `A` (com Nome) e `B` (com Endereço).
- 📌 **Inserção de Dados**: População inicial de ambas as tabelas com diferentes registros.
- 📌 **Consulta e Verificação**: `SELECT` para verificar os dados inseridos.
- 📌 **Junção de Dados**: Uso de `LEFT JOIN` para combinar registros das tabelas `A` e `B`.

---

## 📦 Pacotes e Dependências
Este script utiliza **SQL padrão**, sem a necessidade de pacotes adicionais.

---

## 🛠️ Funções e Comandos Utilizados
- `CREATE TABLE` → Criação de tabelas 📌  
- `INSERT INTO` → Inserção de dados 📝  
- `SELECT * FROM` → Seleção de todos os dados da tabela 🔍  
- `LEFT JOIN` → Combinação de registros entre duas tabelas 🔗  
- Comentários (`--` e `/* */`) → Explicações dentro do código 🗒️  

---

## 🔍 Exemplo de Saída
Após a execução do `LEFT JOIN`, o resultado pode ser algo como:

| matr  | Nome   | matr  | Endereço    |
|-------|--------|-------|------------|
| 1111  | Maria  | NULL  | NULL       |
| 1112  | Joana  | NULL  | NULL       |
| 1113  | José   | 1113  | R. Morango |
| 1114  | NULL   | 1114  | R. Abacate |
| 1115  | Mário  | 1115  | R. Morango |
| 1116  | Ana    | 1116  | NULL       |
| 1117  | Plínio | 1117  | Av. Maçã   |

Isso demonstra que todas as matrículas da tabela `A` são mantidas, mesmo que não tenham correspondência na tabela `B`.

---

## 📢 Hashtags  
#SQL #BancoDeDados #Joins #SQLQueries #DataAnalysis #DataScience
