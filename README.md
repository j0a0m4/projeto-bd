### Projeto: Carteira de Vacina

Bem-vindo a documentação para o nosoo projeto de banco de dados. Vamos modelar uma carteira de vacina digital. O projeto PIBITI "CIVa - Carteira Inteligente de Vacinação" foi usado como motivação para essa escolha.

### Grupo

- [João Marcos](https://github.com/j0a0m4)
- [Marina Cotta](https://github.com/MarinaCotta)
- [Victor Souza](https://github.com/dataskirmisher)

### Recursos

- [Mockaroo](https://mockaroo.com/) para gerar dados
- [Draw.io](https://www.draw.io/) para gerar diagrama conceitual

### Mini mundo

A vacinação é a maneira mais eficaz e segura de prevenir diversas doenças. Por meio
do Sistema Único de Saúde (SUS), o Programa Nacional de Imunizações (PNI) é referência
internacional ao promover o acesso gratuito da população às vacinas, respeitando critérios e orientações da Organização Mundial da Saúde (OMS).
Sendo assim, são 300 milhões de doses das vacinas incluídas no Calendário Nacional de Vacinação. De fato, o setor de vacinação tem a necessidade de um sistema para gerenciar as vacinas disponíveis. O nosso banco de dados permitirá o armazenamento dos dados referentes as vacinas com informações fundamentais tais como sua data de validade, nome e descrição. Além disso o banco armazenará dados do referente aplicador como seu nome, e-mail, telefone, sexo e CPF. Também guardará dados referentes ao “aplicado” como seu nome, e-mail, CPF e sexo. O BD também conterá a entidade aplicação com data de aplicação,aplicador, aplicado e vacina.


## Atividades

As atividades se encontram nos respectivos diretórios desse repositório:

| Atividade                    | Localização   |
| ---------------------------- | ------------- |
| Diagrama conceitual e lógico | `./diagramas` |
| Schema                       | `./schema`    |
| Seed e consultas             | `./consultas` |

Obs.:

- So é possivel rodar `seed_aplicacao.sql` após popular as outras tabelas.
- O default da validade, na tabela vacina `validade DATE DEFAULT DATE_ADD(CURDATE(), INTERVAL 1 YEAR)` não funcionou em algumas máquinas, por isso inclui um arquivo `schema_reserva.sql` em que retirei esse valor padrão.

## Tabelas

### vacina

| Field     | Type         | Null | Key | Default                       | Extra          |
| --------- | ------------ | ---- | --- | ----------------------------- | -------------- |
| id        | int(11)      | NO   | PRI | NULL                          | auto_increment |
| nome      | varchar(100) | NO   | UNI | NULL                          |
| descricao | varchar(100) | NO   |     | NULL                          |
| validade  | date         | YES  |     | (curdate() + interval 1 year) |

### usuario

| Field         | Type         | Null | Key | Default | Extra          |
| ------------- | ------------ | ---- | --- | ------- | -------------- |
| id            | int(11)      | NO   | PRI | NULL    | auto_increment |
| primeiro_nome | varchar(100) | NO   |     | NULL    |
| sobrenome     | varchar(100) | NO   |     | NULL    |
| email         | varchar(100) | NO   |     | NULL    |
| telefone      | varchar(20)  | NO   |     | NULL    |
| sexo          | char(1)      | NO   |     | NULL    |
| CPF           | char(14)     | NO   | UNI | NULL    |

### aplicador

| Field         | Type         | Null | Key | Default | Extra          |
| ------------- | ------------ | ---- | --- | ------- | -------------- |
| id            | int(11)      | NO   | PRI | NULL    | auto_increment |
| primeiro_nome | varchar(100) | NO   |     | NULL    |
| sobrenome     | varchar(100) | NO   |     | NULL    |
| email         | varchar(100) | NO   |     | NULL    |
| telefone      | varchar(20)  | NO   |     | NULL    |
| sexo          | char(1)      | NO   |     | NULL    |
| CPF           | char(14)     | NO   | UNI | NULL    |

### aplicacao

| Field          | Type    | Null | Key | Default   | Extra          |
| -------------- | ------- | ---- | --- | --------- | -------------- |
| id             | int(11) | NO   | PRI | NULL      | auto_increment |
| id_vacina      | int(11) | NO   | MUL | NULL      |
| id_usuario     | int(11) | NO   | MUL | NULL      |
| id_aplicador   | int(11) | NO   | MUL | NULL      |
| data_aplicacao | date    | YES  |     | curdate() |

## Consultas

### Últimas 10 vacinas aplicadas

```sql
SELECT
  nome,
  descricao,
  data_aplicacao
FROM
  vacina
  JOIN aplicacao on vacina.id = id_vacina
ORDER BY
  data_aplicacao DESC
LIMIT
  10;
```

### Nome Completo de todos usuarios

```sql
SELECT
  CONCAT_WS(" ", primeiro_nome, sobrenome) AS "Nome Completo"
FROM
  usuario;
```

### Todos aplicadoras do sexo feminino

```sql
SELECT
  CONCAT_WS(" ", primeiro_nome, sobrenome) AS "Nome Completo"
FROM
  aplicador
WHERE
  sexo = "F";
```

### Selecionar primeiro nome e datas de aplicação

```sql
SELECT
  primeiro_nome,
  data_aplicacao
FROM
  aplicacao
  JOIN usuario ON usuario.id = aplicacao.id_usuario;
```

### Vacinas por vencimento próximo

```sql
SELECT
  nome,
  DATE_FORMAT(validade, '%d/%m/%Y') AS "Validade "
FROM
  vacina
ORDER BY
  validade;
```

### Número de vacinações por nome

```sql
SELECT
  primeiro_nome,
  count(*) AS '# Vacinações'
FROM
  aplicacao
  JOIN usuario ON usuario.id = aplicacao.id_usuario
GROUP BY
  primeiro_nome
ORDER BY
  count(*) DESC;
```

### Usuarios nunca vacinados

```sql
SELECT
  CONCAT(primeiro_nome, " ", sobrenome) AS "Nome",
  email,
  IFNULL(data_aplicacao, "Nenhum registro") AS "Data"
FROM
  usuario
  LEFT JOIN aplicacao ON usuario.id = aplicacao.id_usuario
WHERE
  data_aplicacao IS NULL
GROUP BY
  usuario.id;
```

### Vacinas mais aplicadas

```sql
SELECT
  nome,
  COUNT(*) AS quantidade
FROM
  vacina
  JOIN aplicacao ON vacina.id = aplicacao.id_vacina
GROUP BY
  vacina.id
ORDER BY
  quantidade DESC;
```

### Vacinas nunca aplicadas

```sql
SELECT
  nome,
  IFNULL(data_aplicacao, "Nenhum registro") AS "Data"
FROM
  vacina
  LEFT JOIN aplicacao ON vacina.id = aplicacao.id_vacina
WHERE
  data_aplicacao IS NULL
GROUP BY
  vacina.id;
```

### Meses por frequência

```sql
SELECT
  DATE_FORMAT(data_aplicacao, '%M') AS mes,
  COUNT(*) AS frequencia
FROM
  aplicacao
GROUP BY
  mes
ORDER BY
  frequencia DESC;
```
