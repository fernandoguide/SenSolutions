/* Criando as tabelas do banco */
CREATE  TABLE  tb_Cliente (
idCliente int PRIMARY KEY IDENTITY,
nomeUsuario varchar(40),
senhaUsuario varchar(40),
Email varchar(40)
)
go
CREATE TABLE tb_Local (
numero varchar(40),
complemento varchar(40),
idLocal int PRIMARY KEY IDENTITY,
fkSensor int,
fkCliente int,
fkcep varchar(20),
FOREIGN KEY(fkCliente) REFERENCES tb_Cliente (idCliente)
)go
CREATE TABLE tb_Sensor (
idSensor int PRIMARY KEY IDENTITY,
N_de_Identificação varchar(40),
posicaoSensor varchar(40),
Temp_Max varchar(40),
Temp_Min varchar(40),
Umid_Min varchar(40),
Umid_Max varchar(40),
)go
CREATE TABLE tb_Endereco (
CEP varchar(20) PRIMARY KEY,
logradouro varchar(40),
estado varchar(40),
bairro varchar(40),
cidade varchar(40)
)go
CREATE TABLE tb_Eventos (
idTemp_Umid int PRIMARY KEY IDENTITY,
Temperatura int,
Umidade int,
dataHora datetime,
fkSensor int
)go
ALTER TABLE tb_Local ADD FOREIGN KEY(fkSensor) REFERENCES tb_Sensor (idSensor)go
ALTER TABLE tb_Local ADD FOREIGN KEY(fkcep) REFERENCES tb_Endereco (CEP)go
ALTER TABLE tb_Eventos ADD FOREIGN KEY(fkSensor) REFERENCES tb_Sensor (idSensor)go

/* Inserindo os dados da tabela tb_cliente */
insert into tb_cliente values('Admin','admin','admin@admin.com') go
insert into tb_cliente values('Admin1','admin1','admin1@admin.com') go
insert into tb_cliente values('Admin2','admin2','admin2@admin.com') go
insert into tb_cliente values('Admin3','admin3','admin3@admin.com') go

-- select * from tb_cliente

/* inserindo dados na tabela tb_Sensor */

-- delete from tb_Sensor where idSensor = 1;
insert into tb_Sensor values('serial do Sensor 300','LADO A','35°C','18°C','30%','80%') go
insert into tb_Sensor values('serial do Sensor 400','LADO B','35°C','18°C','30%','80%') go
insert into tb_Sensor values('serial do Sensor 500','LADO C','35°C','18°C','30%','80%') go
insert into tb_Sensor values('serial do Sensor 600','LADO d','35°C','18°C','30%','80%') go

-- select * from tb_Sensor;

/* inserindo dados na tabela  tb_Eventos*/

insert into tb_Eventos values(25,70,current_timestamp,1) go
insert into tb_Eventos values(24,68,GETDATE(),2) go
insert into tb_Eventos values(27,65,'2019-04-11 02:49:00 PM',3) go
insert into tb_Eventos values(30,57,'2019-04-11 03:10:00 PM',4) go

-- select * from tb_Eventos

/* inserindo dados na tabela tb_Endereco */

insert into tb_Endereco values('02805050','Rua Emilio monassa','SP','Freguesia do O',' Sao Paulo') go
insert into tb_Endereco values('11122236','Rua do eduardo','SP','Mooca',' Sao Paulo') go
insert into tb_Endereco values('12344568','Rua do Luis','SP','Casa Verde',' Sao Paulo') go

-- select * from tb_Endereco 

/* inserindo dados na tabela tb_Local */

insert into tb_Local values ('N° 188',' casa 1',1,1,'02805050') go
insert into tb_Local values ('N° 257',' casa 2',2,2,'11122236') go
insert into tb_Local values ('N° 333',' ap 57 bloco A',1,3,'12344568') go

-- select * from tb_Local

-- delete from tb_Local where idLocal = 1;

/* Comandos para dropar as tabelas do banco */
/*
    drop table tb_Local

    drop table tb_Eventos

    drop table tb_Sensor

    drop table tb_Endereco

    drop TABLE tb_Cliente
*/