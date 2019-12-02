Projeto para disciplina projeto de banco de dados

### Grupo
- João Marcos
- Marina Cotta
- Victor Souza

### Recursos
- [Mockaroo](https://mockaroo.com/) para gerar dados

## Carteira de Vacinação
Usamos como motivação o trabalho de PIBITI "CIVA - Carteira de Vacinação Inteligente" para modelar um banco de dados.

## Tabelas
### vacina
| Field | Type | Null | Key | Default | Extra|
| --- | --- | --- | --- | --- | --- |
| id | int(11) | NO | PRI | NULL | auto_increment
| nome | varchar(100) | NO | UNI | NULL | 
| descricao | varchar(100) | NO |  | NULL | 
| validade | date | YES |  | (curdate() + interval 1 year) |

### usuario
| Field | Type | Null | Key | Default | Extra|
| --- | --- | --- | --- | --- | --- |
| id | int(11) | NO | PRI | NULL | auto_increment
| primeiro_nome | varchar(100) | NO |  | NULL | 
| sobrenome | varchar(100) | NO |  | NULL | 
| email | varchar(100) | NO |  | NULL | 
| telefone | varchar(20) | NO |  | NULL | 
| sexo | char(1) | NO |  | NULL | 
| CPF | char(14) | NO | UNI | NULL |

### aplicador
| Field | Type | Null | Key | Default | Extra|
| --- | --- | --- | --- | --- | --- |
| id | int(11) | NO | PRI | NULL | auto_increment
| primeiro_nome | varchar(100) | NO |  | NULL | 
| sobrenome | varchar(100) | NO |  | NULL | 
| email | varchar(100) | NO |  | NULL | 
| telefone | varchar(20) | NO |  | NULL | 
| sexo | char(1) | NO |  | NULL | 
| CPF | char(14) | NO | UNI | NULL |

### aplicacao
| Field | Type | Null | Key | Default | Extra|
| --- | --- | --- | --- | --- | --- |
| id | int(11) | NO | PRI | NULL | auto_increment
| id_vacina | int(11) | NO | MUL | NULL |
| id_usuario | int(11) | NO | MUL | NULL |
| id_aplicador | int(11) | NO | MUL | NULL |
| data_aplicacao | date | YES | | curdate() |