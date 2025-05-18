
# 📊 N2 - Análise Preditiva

Este projeto tem como objetivo resolver um conjunto de queries SQL relacionadas à análise preditiva, utilizando um ambiente dockerizado com suporte a banco de dados relacional.

---

## 🚀 Como executar o ambiente

Para subir a infraestrutura do banco de dados via Docker, execute:

```bash
docker-compose -f ./docker/docker-compose.Infrastructure.yaml up -d
```

Isso iniciará os containers necessários para o funcionamento do banco de dados.

---

## 🗄️ Scripts de criação e consultas

- `create-tables.sql`: script responsável por criar todas as tabelas utilizadas no projeto.
- `questao-*.sql`: scripts de resolução das questões da atividade (de A a G).

---

## 💾 Como inserir os dados

Após o banco estar rodando, execute o script de criação:

```bash
psql -h localhost -U <usuario> -d <nome_do_banco> -f scripts/create-tables.sql
```

Substitua `<usuario>` e `<nome_do_banco>` conforme a configuração definida no `docker-compose`.

---

## 📁 Resultados

Os resultados esperados para cada questão estão armazenados na pasta [`scripts/results`](scripts/results), com arquivos `.png` nomeados conforme a questão correspondente:

| Questão | Script SQL             | Resultado (imagem)        |
|---------|------------------------|----------------------------|
| A       | `questao-a.sql`        | `questao-a.png`           |
| B       | `questao-b.sql`        | `questao-b.png`           |
| C       | `questao-c.sql`        | `questao-c.png`           |
| D       | `questao-d.sql`        | `questao-d.png`           |
| E       | `questao-e.sql`        | `questao-e.png`           |
| F       | `questao-f.sql`        | `questao-f.png`           |
| G       | `questao-g.sql`        | `questao-g.png`           |

---

## 📎 Estrutura do Projeto

```
N2-ANALISEPREDITIVA/
│
├── docker/
│   └── docker-compose.Infrastructure.yaml   # Configuração do ambiente docker
│
├── scripts/
│   ├── create-tables.sql                    # Criação de tabelas
│   ├── questao-a.sql                        # Query A
│   ├── questao-b.sql                        # Query B
│   ├── questao-c.sql                        # Query C
│   ├── questao-d.sql                        # Query D
│   ├── questao-e.sql                        # Query E
│   ├── questao-f.sql                        # Query F
│   ├── questao-g.sql                        # Query G
│   └── results/
│       ├── questao-a.png                    # Resultado A
│       ├── questao-b.png                    # Resultado B
│       ├── ...
│       └── questao-g.png                    # Resultado G
```

---

## 🧠 Requisitos

- Docker e Docker Compose instalados
- Cliente SQL (como `psql` ou DBeaver)