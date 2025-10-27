# 🏥 Projeto: Banco de Dados de Clínica Veterinária (PostgreSQL)

Este repositório contém um projeto de banco de dados para um sistema simplificado de gerenciamento de Clínica Veterinária 🐶🐱. 

O projeto foi desenvolvido como uma atividade de estudo, cobrindo desde a modelagem conceitual (DER) até a criação, manipulação e consulta de dados utilizando SQL (especificamente PostgreSQL).

## 🛠️Tecnologias Utilizadas
- SGBD: PostgreSQL
- Linguagem: SQL (DDL, DML, DQL)
- Modelagem: Draw.io

---

## Estrutura do Projeto

O projeto está dividido em quatro etapas principais, cada uma representada por seus respectivos arquivos:

1.  [Modelagem (DER)](#1-DERclinica.pdf)
2.  [Script de Criação e Inserção](#2-clinica_consulta.sql)
3.  [Script de Manipulação](#3-clinica_criacao.sql)
4.  [Script de Consultas](#4-clinica_manipulacao.sql)

---

🚀 Etapas e Estrutura do Projeto
O projeto foi dividido em quatro etapas principais, e os arquivos correspondentes estão neste repositório:
---
## 1. 🗺️ Modelagem (DER)

A primeira etapa consistiu no planejamento e modelagem do banco de dados. O Diagrama Entidade-Relacionamento (DER) foi criado para visualizar as entidades, seus atributos e os relacionamentos entre elas.

* **Arquivo:** `DER clinica.pdf`

### Entidades Principais:
* **`Tutor`**: Armazena os dados dos donos dos animais.
* **`Veterinario`**: Armazena os dados dos profissionais da clínica (médicos).
* **`Pet`**: Armazena os dados dos animais (pacientes).
* **`Consulta`**: Registra o histórico de atendimentos, sintomas e tratamentos.

### Relacionamentos:
* **Tutor (1) --- (N) Pet**: Um tutor pode ser responsável por vários pets, mas cada pet pertence a apenas um tutor.
* **Pet (1) --- (N) Consulta**: Um pet pode ter um histórico de várias consultas, mas uma consulta é referente a um único pet.
* **Veterinario (1) --- (N) Consulta**: Um veterinário pode realizar várias consultas, mas uma consulta específica é realizada por um único veterinário.

---

## 2. 🏗️ Script de Criação e Inserção de Dados

Esta etapa traduz o modelo DER para código SQL (DDL e DML), criando a estrutura física do banco de dados e populando-o com dados de exemplo.

* **Arquivo:** `clinica_criacao.sql`

### Ações Executadas:

#### DDL (Data Definition Language):
* `CREATE TABLE`: São criadas as quatro tabelas (`Tutor`, `Veterinario`, `Pet`, `Consulta`).
* **Ordem de Criação:** As tabelas são criadas em ordem de dependência:
    1.  `Tutor` e `Veterinario` (não dependem de ninguém).
    2.  `Pet` (depende de `Tutor`).
    3.  `Consulta` (depende de `Pet` e `Veterinario`).
* **Chaves e Restrições:**
    * `PRIMARY KEY` (usando `SERIAL`) são definidas para criar identificadores únicos auto-incrementais (ex: `id_tutor`, `id_pet`).
    * `FOREIGN KEY` são usadas para conectar as tabelas e garantir a integridade referencial, conforme definido no DER (ex: `pet.id_tutor` referencia `tutor.id_tutor`).

#### DML (Data Manipulation Language):
* `INSERT INTO`: Após a criação das tabelas, são inseridos registros de exemplo (tutores, veterinários, pets e consultas) para que o banco de dados tenha conteúdo para ser manipulado e consultado nas etapas seguintes.

---

## 3. ✏️ Script de Manipulação (UPDATE/DELETE)

Este script contém exemplos de comandos DML para modificar e excluir dados existentes no banco, demonstrando a manutenção diária dos registros.

* **Arquivo:** `clinica_manipulacao.sql`

### Ações Executadas:

* **`UPDATE`**:
    * Demonstra como alterar um dado existente. Por exemplo, a atualização do e-mail de contato de um `Tutor` específico, utilizando a cláusula `WHERE` para identificar o registro correto pelo seu `id_tutor`.

* **`DELETE`**:
    * Demonstra como remover um registro do banco. Para segurança, o exemplo sugere a inserção de um registro "consulta" e sua subsequente exclusão, mostrando o uso da cláusula `WHERE` para garantir que apenas o registro indesejado seja apagado.
---

## 4. 📊 Script de Consultas com JOIN e Filtros

O script final demonstra como extrair informações úteis e relatórios do banco de dados. O foco é o uso do `JOIN` para combinar dados de múltiplas tabelas e do `WHERE` para filtrar apenas os resultados relevantes.

* **Arquivo:** `clinica_consulta.sql`

### Consultas de Exemplo Detalhadas:

1.  **Histórico Completo de Consultas:**
    * **Objetivo:** Listar todas as consultas, mas em vez de mostrar apenas os IDs (`id_pet`, `id_veterinario`), exibe o *nome* do pet e o *nome* do veterinário.
    * **Comandos:** Utiliza `JOIN` para conectar `Consulta` com `Pet` (usando `id_pet`) e `Consulta` com `Veterinario` (usando `id_veterinario`).

2.  **Filtrar Consultas por Pet Específico:**
    * **Objetivo:** Mostrar o histórico de consultas (data, tratamento) de *apenas um* pet específico (ex: "Tilapia").
    * **Comandos:** Utiliza `JOIN` (Consulta -> Pet) e adiciona uma cláusula `WHERE p.nome = 'Tilapia'` para filtrar os resultados.

## 🚀 Como Executar

Para executar este projeto, você precisará de uma instância do PostgreSQL (como pgAdmin, DBeaver ou psql no terminal).

1.  Execute o `clinica_criacao.sql` primeiro para criar a estrutura do banco e inserir os dados.
2.  Execute (ou estude) o `clinica_manipulacao.sql` para ver exemplos de DML.
3.  Execute (ou estude) o `clinica_consulta.sql` para extrair informações do banco.
