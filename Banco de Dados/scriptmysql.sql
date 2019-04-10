-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
idCliente int PRIMARY KEY,
nomeUsuario varchar(40),
senhaUsuario varchar(40),
Email varchar(40)
);

CREATE TABLE Local (
numero varchar(40),
complemento varchar(40),
posicaoLocal varchar(40),
idLocal int PRIMARY KEY,
idSensor int,
idCliente int,
cep int,
FOREIGN KEY(idCliente) REFERENCES Cliente (idCliente)
);

CREATE TABLE Sensor (
idSensor int PRIMARY KEY,
N_de_Identificação varchar(40),
Temp_Max varchar(40),
Temp_Min varchar(40),
Umid_Min varchar(40),
Umid_Max varchar(40),
idTemp_Umid int
);

CREATE TABLE Endereco (
cep int PRIMARY KEY,
logradouro varchar(40),
estado varchar(40),
bairro varchar(40),
cidade varchar(40)
);

CREATE TABLE Eventos (
idTemp_Umid int PRIMARY KEY,
Temperatura varchar(40),
Umidade varchar(40),
dataHora varchar(40)
);

ALTER TABLE Local ADD FOREIGN KEY(idSensor) REFERENCES Sensor (idSensor);
ALTER TABLE Local ADD FOREIGN KEY(cep) REFERENCES Endereco (cep);
ALTER TABLE Sensor ADD FOREIGN KEY(idTemp_Umid) REFERENCES Eventos (idTemp_Umid);
