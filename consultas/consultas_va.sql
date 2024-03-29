use va;

-- Ultimas 10 vacinas aplicadas 
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

-- Nome Completo de todos usuarios
SELECT
  CONCAT_WS(" ", primeiro_nome, sobrenome) AS "Nome Completo"
FROM
  usuario;

-- Todos aplicadoras do sexo feminino
SELECT
  CONCAT_WS(" ", primeiro_nome, sobrenome) AS "Nome Completo"
FROM
  aplicador
WHERE
  sexo = "F";

-- Selecionar primeiro nome e datas de aplicação
SELECT
  primeiro_nome,
  data_aplicacao
FROM
  aplicacao
  JOIN usuario ON usuario.id = aplicacao.id_usuario;

-- Vacinas por vencimento próximo
SELECT
  nome,
  DATE_FORMAT(validade, '%d/%m/%Y') AS "Validade "
FROM
  vacina
ORDER BY
  validade;

-- NUmero de vacinações por nome
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

-- Usuarios nunca vacinados
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

-- Vacinas mais aplicadas
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

-- Vacinas nunca aplicadas
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

-- Meses por frequência
SELECT
  DATE_FORMAT(data_aplicacao, '%M') AS mes,
  COUNT(*) AS frequencia
FROM
  aplicacao
GROUP BY
  mes
ORDER BY
  frequencia DESC;