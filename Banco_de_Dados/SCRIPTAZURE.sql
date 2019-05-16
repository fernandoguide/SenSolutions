/* Criando as tabelas do banco */
CREATE  TABLE  tb_Cliente (
idCliente int PRIMARY KEY identity,
nomeUsuario varchar(40),
senhaUsuario varchar(40),
Email varchar(40)
) go
CREATE TABLE tb_Local (
idLocal int PRIMARY KEY identity,
numero varchar(10),
complemento varchar(40),
fkCliente int,
fkcep varchar(20),
FOREIGN KEY(fkCliente) REFERENCES tb_Cliente (idCliente)
) go
CREATE TABLE tb_Sensor (
idSensor int PRIMARY KEY identity,
SerialSensor varchar(40),
posicaoSensor varchar(40),
Temp_Max varchar(10),
Temp_Min varchar(10),
Umid_Min varchar(10),
Umid_Max varchar(10),
fkLocal int
) go
CREATE TABLE tb_Endereco (
CEP varchar(20) PRIMARY KEY,
logradouro varchar(40),
ufEstado varchar(2),
bairro varchar(40),
cidade varchar(40)
) go
CREATE TABLE tb_Eventos (
idTemp_Umid int PRIMARY KEY identity,
Temperatura float,
Umidade float,
dataHora datetime,
fkSensor int
) go
/* Inserindo os dados da tabela tb_cliente */
insert into tb_cliente(nomeUsuario,SenhaUsuario,email) values
('Admin','admin','admin@admin.com'),
('Admin1','admin1','admin1@admin.com'), 
('Admin2','admin2','admin2@admin.com'), 
('Admin3','admin3','admin3@admin.com') go 

-- select * from tb_clientego

/* inserindo dados na tabela tb_Sensor */

-- delete from tb_Sensor where idSensor = 1go
insert into tb_Sensor(SerialSensor,posicaoSensor,Temp_Max,Temp_Min,Umid_Min,Umid_Max,fkLocal) values
('300','LADO A',35,18,30,80,1),
('400','LADO B',35,18,30,80,2),
('500','LADO C',35,18,30,80,3),
('600','LADO D',35,18,30,80,1) go

-- select * from tb_Sensorgo

/* inserindo dados na tabela  tb_Eventos*/

insert into tb_Eventos(temperatura,umidade,dataHora,fksensor)values
(25,70,current_timestamp,1),
(24,68,current_timestamp,2),
(27,65,'2019-04-11 02:49:00',3),
(30,57,'2019-04-11 03:10:00',4) go

-- select * from tb_Eventosgo

/* inserindo dados na tabela tb_Endereco */

insert into tb_Endereco values
('02805050','Rua Emilio monassa','SP','Freguesia do O',' Sao Paulo'),
('11122236','Rua do eduardo','SP','Mooca',' Sao Paulo'),
('12344568','Rua do Luis','SP','Casa Verde',' Sao Paulo') go

-- select * from tb_Enderecogo 

/* inserindo dados na tabela tb_Local */

insert into tb_Local(numero,complemento,fkCliente,fkCEP) values
('188',' casa 1',1,'02805050'),
('257',' casa 2',2,'11122236'),
('333',' ap 57 bloco A',3,'12344568') go

-- select * from tb_Local

-- inserindo chaves estrangeiras

ALTER TABLE tb_Local ADD FOREIGN KEY(fkcep) REFERENCES tb_Endereco (CEP)go
ALTER TABLE tb_Eventos ADD FOREIGN KEY(fkSensor) REFERENCES tb_Sensor (idSensor)go
alter table tb_Sensor add foreign key (fkLocal) references tb_Local(idLocal)go


-- drop database sensolutionsgo

-- delete from tb_Local where idLocal = 1 go

/* Comandos para dropar as tabelas do banco */
/*
    drop table tb_Local
    drop TABLE tb_Cliente
    drop table tb_Eventos
    drop table tb_Sensor
    drop table tb_Endereco
 
*/