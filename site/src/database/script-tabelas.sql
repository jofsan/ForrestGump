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
	nome VARCHAR(45),
	email VARCHAR(60),
	senha VARCHAR(20)
);

CREATE TABLE quiz (
	idquiz INT PRIMARY KEY AUTO_INCREMENT,
	acertos int,
	score int,
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

CREATE TABLE votoDificuldade (
	idvoto INT PRIMARY KEY AUTO_INCREMENT,
	dificuldade VARCHAR(30),
	fk_usuario int,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

select*from usuario join quiz on fk_usuario=usuario.id 
join votodificuldade on votodificuldade.fk_usuario=usuario.id;


CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
