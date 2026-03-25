# Grupo 4

> **Serratec Residência de Software · Sala 34 · Atividade de Banco de Dados**

---

## Bem-vindos, Grupo 4!

O projeto consiste na modelagem e implementação de um banco de dados relacional para controle de empréstimos de livros, contemplando diagramas conceitual, lógico e físico, além das queries solicitadas.

---

## Integrantes

- ANA PAULA
- DIANA MONTEIRO
- ESTHER MEDEIROS
- GABRIELA CARVALHO
- LUIZA TAVARES
- VITOR MARCELINO

---

## O Trabalho

A atividade consiste no desenvolvimento de um banco de dados para empréstimos de livros, com **10 pontos**, abrangendo:

- Modelagem **conceitual**, **lógica** e **física**
- Implementação das tabelas com **integridade referencial**
- População das tabelas com `INSERT`
- Construção de **7 queries** específicas


## Modelo Físico — Tabelas
```sql
-- Tabela: autor
id_autor   SERIAL (PK)
nome

-- Tabela: livro
id_livro   SERIAL (PK)
titulo
id_autor   FK → autor(id_autor)

-- Tabela: usuario
id_usuario (PK)
nome
email      UNIQUE

-- Tabela: emprestimo
id_emprestimo (PK)
data_emprestimo
data_devolucao
valor_emprestimo
id_usuario FK → usuario(id_usuario)
id_livro   FK → livro(id_livro)
```

---

## Queries

1. Retornar os livros emprestados
2. Retornar os livros que **não** foram emprestados
3. Contar quantos livros foram emprestados
4. A quantidade de livros que cada autor tem
5. Exibir os livros do mais caro ao mais barato
6. Apagar um autor e verificar a exclusão automática de seus livros
7. Mostrar o total arrecadado em empréstimos de um determinado livro

---

## Estrutura do Repositório
```
EMPRESTIMO-DE-LIVROS/
├── Emprestimo de Livros.sql
├── Modelo Conceitual.brM3
└── README.md
```

---

## URL para clonar o repositório

```bash
git clone https://github.com/luluzinha05/Emprestimo-de-Livros.git
```

## Ferramentas

- [PostgreSQL](https://www.postgresql.org/) — SGBD recomendado para a atividade
- [DBeaver](https://dbeaver.io/) — Interface gráfica para gerenciamento do banco
- [BrModelo](https://www.sis4.com/) — Criação dos diagramas conceitual e lógico

---

<p align="center">
  <strong>Grupo 4 — Serretec Residência · Sala 34</strong>
</p>