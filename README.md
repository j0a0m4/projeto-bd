### Projeto: Carteira de Vacina
Bem-vindo a documentação para o nosoo projeto de banco de dados. Vamos modelar uma carteira de vacina digital. O projeto PIBITI "CIVa - Carteira Inteligente de Vacinação" foi usado como motivação para essa escolha.

### Mini mundo
A vacinação é a maneira mais eficaz e segura de prevenir diversas doenças. Por meio
do Sistema Único de Saúde (SUS), o Programa Nacional de Imunizações (PNI) é referência
internacional ao promover o acesso gratuito da população às vacinas, respeitando critérios e orientações da Organização Mundial da Saúde (OMS).
Sendo assim, são 300 milhões de doses das vacinas incluídas no Calendário Nacional de Vacinação. De fato, o setor de vacinação tem a necessidade de um sistema para gerenciar as vacinas disponíveis. O nosso banco de dados permitirá o armazenamento dos dados referentes as vacinas com informações fundamentais tais como sua data de validade, nome e descrição. Além disso o banco armazenará dados do referente aplicador como seu nome, e-mail, telefone, sexo e CPF. Também guardará dados referentes ao “aplicado” como seu nome, e-mail, CPF e sexo. O BD também conterá a entidade aplicação com data de aplicação,aplicador, aplicado e vacina.

### Grupo
- João Marcos
- Marina Cotta
- Victor Souza

### Recursos
- [Mockaroo](https://mockaroo.com/) para gerar dados

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