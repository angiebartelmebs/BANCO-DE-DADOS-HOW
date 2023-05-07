CREATE DATABASE bancoloja; 

USE bancoloja; 

CREATE TABLE cliente( 
codCliente int(4) auto_increment, 
nome varchar(30) NOT NULL, 
sobrenome varchar(30) NOT NULL, 
telefone int(10), 
email varchar(50), 
cpf int (11), 
PRIMARY KEY (codCliente) 
); 
-- alteração no tipo do telefone--
ALTER TABLE `bancoloja`.`cliente` 
CHANGE COLUMN `telefone` `telefone` VARCHAR(12) NULL DEFAULT NULL ;
-- alteração no tipo de cpf8--
ALTER TABLE `bancoloja`.`cliente` 
CHANGE COLUMN `cpf` `cpf` VARCHAR(11) NULL DEFAULT NULL ;

CREATE TABLE ingresso( 
codIngresso int(6) auto_increment, 
evento varchar(30), 
data character (9), 
local character(20), 
categoria varchar(10), 
descrição varchar(100), 
plateia varchar (15), 
estoque int (10) ,
PRIMARY KEY (codIngresso) 
); 

-- alteração de tipo da data--
ALTER TABLE `bancoloja`.`ingresso` 
CHANGE COLUMN `data` `data` DATETIME NULL DEFAULT NULL ;
-- alteração no tipo do local--
ALTER TABLE `bancoloja`.`ingresso` 
CHANGE COLUMN `local` `local` VARCHAR(50) NULL DEFAULT NULL ;


-- armazenamento --
CREATE TABLE tabela_estatisticas (
  num_clientes INT
);

 -- gatilho --
 DELIMITER $$
 CREATE TRIGGER cliente_trigger AFTER INSERT ON cliente
  FOR EACH ROW
  BEGIN
    UPDATE tabela_estatisticas SET num_clientes = num_clientes + 1;
  END;
  
-- Simulações Cliente--
SELECT * FROM cliente;
SELECT * FROM cliente WHERE telefone IS NOT NULL;
SELECT CONCAT(nome, ' ', sobrenome) AS nome_completo, cpf FROM cliente WHERE email IS NOT NULL;
SELECT * FROM cliente WHERE cpf <> 0;
SELECT nome, sobrenome FROM cliente WHERE telefone IS NOT NULL AND email IS NOT NULL;
SELECT * FROM cliente WHERE codCliente = 03;
UPDATE cliente SET nome = 'Maria Eduarda' WHERE codCliente = 02 ;
UPDATE cliente SET email = 'mioguel@email.com' WHERE codCliente = 03;
UPDATE cliente SET telefone = '99934385160' WHERE codCliente = 01;
DELETE FROM cliente WHERE codCliente = 06;
DELETE FROM cliente WHERE codCliente = 05;
DELETE FROM cliente WHERE codCliente = 02;
INSERT INTO cliente (codCliente, nome, sobrenome, telefone, email, cpf) VALUES
( 01, 'angelica', 'bueno', 9899785869, 'angelica@email.com', '02618429077'),
( 02, 'maria' , 'silva' , 9997845596 ,  'maria@email.com', '23035025877'),
( 03, 'miguel', 'batista' , 9933555888 , 'email@email.com' , '36534902514'),
( 04, 'rodrigo', 'bueno', 9789785869, 'rodrigo@email.com', '09018042977'),
( 05, 'Judite' , 'silva' , 9997745596 ,  'judite@email.com', '02416527099'),
( 06, 'sadra', 'batista' , 9933559088 , 'sandra@email.com' , '03005899721');


-- Simulações Ingresso --
SELECT * FROM  ingresso;
SELECT * FROM ingresso WHERE data <> 0;
SELECT * FROM ingresso WHERE estoque > 60;
SELECT evento FROM ingresso WHERE categoria IS NOT NULL AND descrição IS NOT NULL;
SELECT * FROM ingresso i JOIN ingresso e ON i.evento = e.codingresso WHERE i.estoque > 5;
UPDATE ingresso SET data = '2023-05-25' WHERE codIngresso = 030;
UPDATE ingresso SET local = 'Teatro itajai' WHERE codIngresso = 027;
UPDATE ingresso SET categoria = 'Improviso' WHERE codIngresso = 026;
DELETE FROM ingresso WHERE codIngresso = 030;
DELETE FROM ingresso WHERE codIngresso = 027;
INSERT INTO ingresso (codIngresso, evento, data, local, categoria, descrição, plateia, estoque) VALUES
( 025, 'Os Barbichas', '2023-05-20', 'Teatro Jaraguá', 'Comédia', 'Show de humor de improviso','Cadeira', '100' ),
( 026 , 'Show Red hot Chili Peppers' , '2023-06-30' , 'Arena BRB Mané Garrincha' ,  'Música', 'Show de música de turnê mundial', 'Arena', '50'),
( 027, 'Ambiente de Negócios ', '2023-06-27' , 'Expoville, Joinville - SC' , 'Palestra' , 'Palestra de aprendizado em ambiente de negócios', 'Cadeira', '60'),
( 030, 'Ambiente de Vendas ', '2023-06-10' , 'Expoville, Joinville - SC' , 'Palestra' , 'Palestra de aprendizado em ambiente de negócios', 'Cadeira', '30');


