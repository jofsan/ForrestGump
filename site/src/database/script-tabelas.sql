-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/
CREATE DATABASE forrestgump;

USE forrestgump;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	email VARCHAR(60) UNIQUE NOT NULL,
	senha VARCHAR(20) NOT NULL
);

CREATE TABLE quiz (
	idquiz INT PRIMARY KEY AUTO_INCREMENT,
	score int,
	fkusuario INT,
	FOREIGN KEY (fkusuario) REFERENCES usuario(id)
);

CREATE TABLE comentario (
	iddesc INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(30) NOT NULL,
	fkusuario int,
	FOREIGN KEY (fkusuario) REFERENCES usuario(id)
);
select*from usuario;
select*from quiz;
select*from comentario;
select*from usuario join quiz on id=fkusuario;
select*from usuario join comentario on id=fkusuario;
select*from usuario join quiz on id=fkusuario join comentario on id=comentario.fkusuario;
select sum(score)from quiz;
select avg(score)from quiz;
select concat('O usuario ', nome , ' fez ' , score ,' pontos', ' e comentou ', descricao) 
as ' texto quiz ' from usuario join quiz on id=fkusuario join comentario on id=comentario.fkusuario;
CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
